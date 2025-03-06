import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.validator = "",
    this.errorMessage = "",
    this.maxLines = 1,
    this.isNum = false,
    this.obscureText = false,
    this.onChanged,
  });

  final String label;
  final String validator;
  final String errorMessage;
  final int maxLines;
  final bool isNum;
  final bool obscureText;
  final void Function(String value)? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  ValueNotifier <bool> isError = ValueNotifier <bool> (false);
  ValueNotifier <bool> isFirstInteract = ValueNotifier <bool> (true);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        ValueListenableBuilder(
          valueListenable: isError,
          builder: (context, value, child) {
            return Text(
              widget.label,
              style: context.textTheme.labelMedium?.apply(
                color: value
                  ? context.colorScheme.error
                  : context.colorScheme.primary,
              ),
            );
          }
        ),
        ValueListenableBuilder(
          valueListenable: isFirstInteract,
          builder: (context, value, child) {
            return TextFormField(
              textInputAction: TextInputAction.next,
              maxLines: widget.maxLines,
              onChanged: widget.onChanged,
              obscureText: widget.obscureText,
              onTapOutside: (event) {
                isFirstInteract.value = false;
              },
              onEditingComplete: () {
                isFirstInteract.value = false;
              },
              onSaved: (event) {
                isFirstInteract.value = false;
              },
              autovalidateMode: value
                ? AutovalidateMode.disabled
                : AutovalidateMode.always,
              validator: (text) {
                try {
                  if (widget.isNum && (text == "-" || text == "")) {
                    return widget.errorMessage;
                  }

                  if (widget.validator != "" && widget.isNum && double.parse(text!) < double.parse(widget.validator)) {
                    WidgetsBinding.instance.addPostFrameCallback((text) {
                      isError.value = true;
                    });
                    return widget.errorMessage;
                  }

                  if (widget.validator != "" && !widget.isNum && !RegExp(widget.validator).hasMatch(text!)) {
                    WidgetsBinding.instance.addPostFrameCallback((text) {
                      isError.value = true;
                    });
                    return widget.errorMessage;
                  }
              
                  WidgetsBinding.instance.addPostFrameCallback((value) {
                    isError.value = false;
                  });
                  return null;
                }
                catch (e) {
                  return "Wrong format";
                }
              },
              decoration: InputDecoration(
                fillColor: context.colorScheme.onPrimary,
                filled: true,
                enabledBorder: DecoratedInputBorder(
                  shadow: [
                    BoxShadow(
                      color: context.colorScheme.shadow.withValues(alpha: 0.2),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  child: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.colorScheme.outlineVariant,
                    ),
                  )
                ),
                border: DecoratedInputBorder(
                  shadow: [
                    BoxShadow(
                      color: context.colorScheme.shadow.withValues(alpha: 0.2),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  child: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.colorScheme.primary,
                    ),
                  )
                ),
                focusedBorder: DecoratedInputBorder(
                  shadow: [
                    BoxShadow(
                      color: context.colorScheme.shadow.withValues(alpha: 0.2),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  child: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.colorScheme.primary,
                    ),
                  )
                ),
                errorBorder: DecoratedInputBorder(
                  shadow: [
                    BoxShadow(
                      color: context.colorScheme.shadow.withValues(alpha: 0.2),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  child: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.colorScheme.error,
                    ),
                  )
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}