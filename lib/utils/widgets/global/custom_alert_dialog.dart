import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.icon,
    required this.text,
    required this.onAccept,
  });

  final IconData icon;
  final String text;
  final void Function() onAccept;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      title: Icon(
        icon,
        size: 60,
        color: context.colorScheme.primary,
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: min(400, context.screenWidth * 0.8),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall?.apply(
              color: context.colorScheme.primary
            ),
          ),
        ),
      ),
      actions: [
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: CustomButton(
                text: "No",
                isPrimary: false,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            Expanded(
              child: CustomButton(
                text: "Yes",
                isPrimary: true,
                onPressed: onAccept,
              ),
            ),
          ],
        ),
        
      ],
    );
  }
}