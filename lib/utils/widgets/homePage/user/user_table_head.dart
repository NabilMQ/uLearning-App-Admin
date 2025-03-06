import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

class UserTableHead extends StatelessWidget {
  const UserTableHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Id",
                style: context.textTheme.titleSmall?.apply(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
      
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                "Name",
                style: context.textTheme.titleSmall?.apply(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
      
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                "Email",
                style: context.textTheme.titleSmall?.apply(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "Created At",
                style: context.textTheme.titleSmall?.apply(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
      
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "Action",
                style: context.textTheme.titleSmall?.apply(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}