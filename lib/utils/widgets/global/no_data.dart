import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
      splashColor: context.colorScheme.onPrimaryContainer.withValues(alpha: 0.20),
      hoverColor: context.colorScheme.onPrimaryContainer.withValues(alpha: 0.15),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: context.colorScheme.primary,
                width: 0.5,
              ),
            )
          ),
          
          child: Center(
            child: Text(
              "No Data",
              style: context.textTheme.titleSmall?.apply(
                color: context.colorScheme.primary.withValues(
                  alpha: 0.8,
                ),
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        ),
      ),
    );
  }
}