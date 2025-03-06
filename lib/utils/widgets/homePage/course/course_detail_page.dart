import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/entities/course.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_alert_dialog.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_icon_button.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_loading_widget.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            children: [
              CustomIconButton(
                icon: Icons.edit_outlined,
                onPressed: () {
                  
                },
              ),
              CustomIconButton(
                icon: Icons.delete_outline_rounded,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        icon: Icons.warning_outlined,
                        text: "Are you sure you want to delete this data?\n(This action may affect other data)",
                        onAccept: () {
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  );
                },
              ),
            ],
          ),
          CustomIconButton(
            icon: Icons.cancel_outlined,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: min(800, context.screenWidth * 0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: min(context.screenHeight * 0.6, 600),
                      child: Image.network(
                        course.thumbnail!,
                        fit: BoxFit.scaleDown,
                        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                          return child;
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return Center(
                              child: CustomLoadingWidget(
                                progress: loadingProgress.expectedTotalBytes != null
                                  ? (loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! * 100).toString()
                                  : null,
                              ),
                            );
                          }
                          
                          return child;
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Text("$stackTrace");
                        },
                      ),
                    ),
                  ),
                                
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Text(
                          "Id: ${course.id ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Name: ${course.name ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Type: ${course.type ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Price: ${course.price ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Lesson Length: ${course.lessonLength ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Video Length: ${course.videoLength ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Follow: ${course.follow ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Score: ${course.follow ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Downloadable Resources: ${course.downloadableResources ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Created At: ${course.createdAt ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Updated At: ${course.updatedAt ?? "-"}",
                          style: context.textTheme.titleSmall?.apply(
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Text(
                "Description: ${course.description ?? "-"}",
                style: context.textTheme.titleSmall?.apply(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}