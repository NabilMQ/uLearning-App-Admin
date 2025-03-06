import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

class InitializingPage extends StatelessWidget {
  const InitializingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            SpinKitFadingCircle(
              color: context.colorScheme.primary,
              size: 100,
            ),
            Text(
              "Initializing...",
              style: context.textTheme.headlineLarge?.apply(
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
      )
    );
  }
}