import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    this.progress,
  });

  final String? progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          SpinKitFadingCircle(
            color: context.colorScheme.primary,
            size: 50,
          ),
          Text(
            progress == null || progress == ""
            ? "Loading..."
            : "$progress%",
            style: context.textTheme.titleLarge?.apply(
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}