import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_button.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_text_field.dart';

class CourseTypeFormPage extends StatefulWidget {
  const CourseTypeFormPage({
    super.key,
    required this.isCreate,
  });

  final bool isCreate;

  @override
  State<CourseTypeFormPage> createState() => _CourseTypeFormPageState();
}

class _CourseTypeFormPageState extends State<CourseTypeFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Container(
            width: min(1200, context.screenWidth),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 1024) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 24,
                      children: [
                        Text(
                          widget.isCreate
                          ? "Add New Course"
                          : "Update Course",
                          style: context.textTheme.headlineMedium?.apply(
                            color: context.theme.primaryColor
                          ),
                        ),
                                      
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 24,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: context.screenWidth,
                                height: 400,
                                child: Material(
                                  color: context.colorScheme.onPrimary,
                                  child: InkWell(
                                    onTap: () {
                                      
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: SizedBox.square(
                                        dimension: 240,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Icon(
                                              Icons.photo_outlined,
                                              color: context.colorScheme.primary,
                                            ),
                                            Text(
                                              "Add course thumbnail",
                                              textAlign: TextAlign.center,
                                              style: context.textTheme.titleSmall?.apply(
                                                color: context.colorScheme.primary
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    label: "Name",
                                    validator: r".+",
                                    errorMessage: "Please fill this field",
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    label: "Type",
                                    validator: r".+",
                                    errorMessage: "Please fill this field",
                                  ),
                                ),
                              ],
                            ),
                                              
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    label: "Price",
                                    validator: "1",
                                    isNum: true,
                                    errorMessage: "The minimum value is 1",
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    label: "Downloadable resources",
                                    isNum: true,
                                    validator: "0",
                                    errorMessage: "The minimum value is 0",
                                  ),
                                ),
                              ],
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    label: "Price",
                                    validator: "1",
                                    isNum: true,
                                    errorMessage: "The minimum value is 1",
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    label: "Downloadable resources",
                                    isNum: true,
                                    validator: "0",
                                    errorMessage: "The minimum value is 0",
                                  ),
                                ),
                              ],
                            ),
                        
                            CustomTextField(
                              label: "Description",
                              errorMessage: "",
                              maxLines: 3,
                            ),
                        
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 16,
                                  children: [
                                    SizedBox(
                                      width: 190,
                                      child: CustomButton(
                                        text: "Cancel",
                                        isPrimary: false,
                                        onPressed: () {
                                                      
                                        },
                                      ),
                                    ),
                                                  
                                    SizedBox(
                                      width: 190,
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                    
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 24,
                    children: [
                      Text(
                        widget.isCreate
                        ? "Add New Course"
                        : "Update Course",
                        style: context.textTheme.headlineMedium?.apply(
                          color: context.theme.primaryColor
                        ),
                      ),
                                  
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 24,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 16,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Material(
                                    color: context.colorScheme.onPrimary,
                                    child: InkWell(
                                      onTap: () {
                                        
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: SizedBox.square(
                                          dimension: 240,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            spacing: 8,
                                            children: [
                                              Icon(
                                                Icons.photo_outlined,
                                                color: context.colorScheme.primary,
                                              ),
                                              Text(
                                                "Add course thumbnail",
                                                textAlign: TextAlign.center,
                                                style: context.textTheme.titleSmall?.apply(
                                                  color: context.colorScheme.primary
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  spacing: 8,
                                  children: [
                                    CustomTextField(
                                      label: "Name",
                                      validator: r".+",
                                      errorMessage: "Please fill this field",
                                    ),
                                    CustomTextField(
                                      label: "Type",
                                      validator: r".+",
                                      errorMessage: "Please fill this field",
                                    ),
                                    CustomTextField(
                                      label: "Price",
                                      validator: "1",
                                      isNum: true,
                                      errorMessage: "The minimum value is 1",
                                    ),
                                    CustomTextField(
                                      label: "Downloadable resources",
                                      isNum: true,
                                      validator: "0",
                                      errorMessage: "The minimum value is 0",
                                    ),
                                  ],
                                ),
                              ),
                                  
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  spacing: 8,
                                  children: [
                                    CustomTextField(
                                      label: "Lesson Length",
                                      validator: "0",
                                      isNum: true,
                                      errorMessage: "The minimum value is 0",
                                    ),
                                    CustomTextField(
                                      label: "Video Length",
                                      validator: "0",
                                      isNum: true,
                                      errorMessage: "The minimum value is 0",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      
                          CustomTextField(
                            label: "Description",
                            errorMessage: "",
                            maxLines: 3,
                          ),
                      
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 16,
                                children: [
                                  SizedBox(
                                    width: 190,
                                    child: CustomButton(
                                      text: "Cancel",
                                      isPrimary: false,
                                      onPressed: () {
                                                    
                                      },
                                    ),
                                  ),
                                                
                                  SizedBox(
                                    width: 190,
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
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ); 
              },
            ),
          ),
        ),
      ),
    );
  }
}