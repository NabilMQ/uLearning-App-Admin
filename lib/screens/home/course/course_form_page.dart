import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/blocs/routeBloc/route_events.dart';
import 'package:ulearning_app_admin/utils/constants/global.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_button.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_text_field.dart';

class CourseFormPage extends StatefulWidget {
  const CourseFormPage({
    super.key,
    required this.isCreate,
  });

  final bool isCreate;

  @override
  State<CourseFormPage> createState() => _CourseFormPageState();
}

class _CourseFormPageState extends State<CourseFormPage> {

  @override
  void initState() {
    if (!Global.routeBloc.state.path!.contains("/courses")) {
      Global.routeBloc.add(
        ChangeEvent(path: "/courses")
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            width: min(400, context.screenWidth * 0.8),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              spacing: 100,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: Text(
                    widget.isCreate
                    ? "Add New Course Type"
                    : "Update Course Type",
                    style: context.textTheme.headlineMedium?.apply(
                      color: context.theme.primaryColor
                    ),
                  ),
                ),
          
                Column(
                  spacing: 24,
                  children: [
                    CustomTextField(
                      label: "Title",
                      validator: r".+",
                      errorMessage: "Please fill the title field",
                    ),
                
                    CustomTextField(
                      label: "Description",
                      validator: r".+",
                      errorMessage: "Please fill the description field",
                    ),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16,
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "Cancel",
                            isPrimary: false,
                            onPressed: () {
                                          
                            },
                          ),
                        ),

                        Expanded(
                          child: CustomButton(
                            text: widget.isCreate
                              ? "Save"
                              : "Update",
                            isPrimary: true,
                            onPressed: () {
                                              
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}