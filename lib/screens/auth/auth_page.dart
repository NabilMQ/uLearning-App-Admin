import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_bloc.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_events.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_states.dart';
import 'package:ulearning_app_admin/utils/constants/global.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';
import 'package:ulearning_app_admin/utils/enum/auth.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_button.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_error_dialog.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_text_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: BlocBuilder <AuthBloc, AuthStates> (
            bloc: Global.authBloc,
            builder: (context, state) {

              if (state.apiStatus == ApiStatus.error) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomErrorDialog();
                    },
                  );
                });
                Global.authBloc.add(ClearError());
              }

              if (state.authStatus == AuthStatus.authenticated) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  context.go("/home");
                });
              }

              return Container(
                width: min(400, context.screenWidth * 0.8),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: context.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  spacing: 100,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/vectors/uLearning_logo_only_black.svg",
                      colorFilter: ColorFilter.mode(
                        context.colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                      placeholderBuilder: (context) {
                        return CircularProgressIndicator();
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.colorScheme.primary,
                            ),
                          ),
                          child: Text(
                            "Error loading asset",
                            style: context.textTheme.headlineSmall?.apply(
                              color: context.colorScheme.primary,
                            ),
                          ),
                        );
                      },
                    ),
              
                    Column(
                      spacing: 24,
                      children: [
                        CustomTextField(
                          label: "Email",
                          validator: r"(\S+?@\S+?(\.{1})\S+)$",
                          errorMessage: "Please fill the email field",
                          onChanged: (value) {
                            Global.authBloc.add(
                              EmailEvent(
                                email: value,
                              )
                            );
                          },
                        ),
                    
                        CustomTextField(
                          label: "Password",
                          validator: r".+",
                          errorMessage: "Please fill the password field",
                          obscureText: true,
                          onChanged: (value) {
                            Global.authBloc.add(
                              PasswordEvent(
                                password: value,
                              )
                            );
                          }
                        ),
                    
                        CustomButton(
                          text: state.apiStatus == ApiStatus.processing
                            ? "Logging in..."
                            : "Log In",
                          onPressed: state.email.isNotEmpty && state.password.isNotEmpty && state.apiStatus != ApiStatus.processing
                            ? () async {
                              try {
                                Global.authBloc.add(
                                  SignInEvent(
                                    email: Global.authBloc.state.email,
                                    password: Global.authBloc.state.password,
                                  )
                                );
                              }
                              catch (e) {
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomErrorDialog();
                                  },
                                );
                              }
                            }
                            : null,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}