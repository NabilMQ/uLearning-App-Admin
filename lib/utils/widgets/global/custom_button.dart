import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isPrimary = true
  });

  final String text;
  final bool isPrimary;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed == null
        ? 0.5
        : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.2),
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: isPrimary
              ? context.colorScheme.primary
              : context.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              splashColor: isPrimary
                ? context.colorScheme.onPrimaryContainer
                : context.colorScheme.primaryContainer,
              hoverColor: isPrimary
                ? context.colorScheme.onPrimaryContainer.withValues(alpha: 0.75)
                : context.colorScheme.primaryContainer.withValues(alpha: 0.75),
              onTap: onPressed,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: context.colorScheme.inversePrimary,
                  ),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: context.textTheme.bodySmall?.apply(
                      color: isPrimary
                        ? context.colorScheme.onPrimary
                        : context.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}