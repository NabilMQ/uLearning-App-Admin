import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_button.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Icon(
              Icons.error_outline,
              color: context.colorScheme.primary,
              size: 115,
            ),
            Text(
              "Page Not Found",
              style: context.textTheme.headlineLarge?.apply(
                color: context.colorScheme.primary,
              ),
            ),
            Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: CustomButton(
                    text: "Go To Home Page",
                    isPrimary: true,
                    onPressed: () {
                      context.go("/home");
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}