import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

class CustomListViewDrawerChild extends StatefulWidget {
  const CustomListViewDrawerChild({
    super.key,
    required this.width,
    required this.icon,
    required this.text,
    this.isSelected = false,
    required this.onPressed
  });

  final double width;
  final Widget icon;
  final String text;
  final bool isSelected;
  final void Function()? onPressed;

  @override
  State<CustomListViewDrawerChild> createState() => _CustomListViewDrawerChildState();
}

class _CustomListViewDrawerChildState extends State<CustomListViewDrawerChild> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.isSelected
        ? context.colorScheme.primary.withValues(alpha: 0.5)
        : Colors.transparent,
      child: InkWell(
        onTap: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 56.0,
              height: 48.0,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    widget.isSelected
                      ? context.colorScheme.onSecondary
                      : context.colorScheme.onSecondaryContainer,
                      BlendMode.srcIn),
                  child: widget.icon
                )
              ),
            ),
        
            AnimatedDefaultTextStyle(
              style: context.textTheme.titleSmall!.apply(
                fontSizeFactor: widget.width == 56.0
                  ? 0
                  : 1,
                letterSpacingFactor: widget.width == 56.0
                  ? 0
                  : 1, 
                color: widget.isSelected
                  ? context.colorScheme.onSecondary
                  : context.colorScheme.onSecondaryContainer,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 200),
              child: AnimatedPadding(
                curve: Curves.fastOutSlowIn,
                padding: EdgeInsets.only(
                  left: widget.width == 56.0
                    ? 0
                    : 8,
                ),
                duration: Duration(milliseconds: 200),
                child: Text(
                  widget.text,
                ),
              ),
            ),
          ],
        ),
      ),                          
    );
  }
}