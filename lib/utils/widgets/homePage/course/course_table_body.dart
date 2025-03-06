import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/entities/course.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_alert_dialog.dart';
import 'package:ulearning_app_admin/utils/widgets/homePage/course/course_detail_page.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_icon_button.dart';

class CourseTableBody extends StatelessWidget {
  const CourseTableBody({
    super.key,
    required this.course,
  });

  final Course course;

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
          
          child: Row(
            spacing: 16,
            children: [
        
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    course.id ?? "-",
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
                    course.name ?? "-",
                    style: context.textTheme.titleSmall?.apply(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ),
        
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    course.description ?? "-",
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
                    course.createdAt ?? "-",
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
                    course.updatedAt ?? "-",
                    style: context.textTheme.titleSmall?.apply(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ),
        
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    CustomIconButton(
                      icon: Icons.info_outline_rounded,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CourseDetailPage(
                              course: course,
                            );
                          }
                        );
                      },
                    ),
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
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}