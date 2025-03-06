import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_button.dart';

class CustomErrorDialog extends StatelessWidget {
  const CustomErrorDialog({ super.key });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      title: Icon(
        Icons.error_outline,
        size: 60,
        color: context.colorScheme.primary,
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: min(400, context.screenWidth * 0.8),
          child: Text(
            "An Error has Occured",
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall?.apply(
              color: context.colorScheme.primary
            ),
          ),
        ),
      ),
      actions: [
        CustomButton(
          text: "Ok",
          isPrimary: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}