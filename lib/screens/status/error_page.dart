import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_button.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
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
              "An Error has Occured",
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
                    text: "Refresh",
                    isPrimary: true,
                    onPressed: () {
                      web.window.location.reload();
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