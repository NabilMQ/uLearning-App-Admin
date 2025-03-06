import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:ulearning_app_admin/blocs/themeBloc/theme_bloc.dart';
import 'package:ulearning_app_admin/blocs/themeBloc/theme_events.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            Text(
              "Settings",
              style: context.textTheme.displaySmall?.apply(
                color: context.colorScheme.primary
              ),
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      "Dark Mode",
                      style: context.textTheme.titleLarge?.apply(
                        color: context.colorScheme.primary
                      ),
                    ),
                
                    Text(
                      "Color Theme",
                      style: context.textTheme.titleLarge?.apply(
                        color: context.colorScheme.primary
                      ),
                    ),
                  ],
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 25,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Switch(
                          value: !context.read <ThemeDataBloc> ().state.isLightMode,
                          onChanged: (value){
                            context.read <ThemeDataBloc> ().add(
                              ChangeThemeDataEvents(
                                isLightMode: !value,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
        
                    ColorPicker(
                      pickerAreaBorderRadius: BorderRadius.circular(16),
                      hexInputBar: true,
                      pickerColor: context.read <ThemeDataBloc>().state.themeColor,
                      onColorChanged: (color) {
                        context.read <ThemeDataBloc>().add(
                          ChangeThemeColorEvents(
                            themeColor: color,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
        
          ],
        ),
      )
    );
  }
}