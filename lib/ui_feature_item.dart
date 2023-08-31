library ui_feature_item;

import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
    this.innerPadding = const EdgeInsets.all(8.0),
    this.outerPadding = const EdgeInsets.all(18.0),
    this.backgroundColor,
    this.borderRadius = 12.0,
    this.shadowColor = Colors.black,
    this.shadowSpreadRadius = 5,
    this.shadowBlurRadius = 7,
    this.shadowOffset = const Offset(0, 3),
    this.shadowOpacity = 0.1,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    this.mainAxisSize = MainAxisSize.min,
    this.icon,
    this.title,
    this.body,
    this.fullWidthButton = true,
    this.button,
  });

  final EdgeInsetsGeometry outerPadding;
  final EdgeInsetsGeometry innerPadding;
  final Color? backgroundColor;
  final double borderRadius;

  final Color shadowColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final double shadowOpacity;

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  final Icon? icon;
  final Widget? title;
  final Widget? body;

  final bool fullWidthButton;
  final ElevatedButton? button;

  @override
  Widget build(BuildContext context) {
    late Color _backgroundColor =
        backgroundColor ?? Theme.of(context).colorScheme.surface;
    return Padding(
      padding: outerPadding,
      child: Container(
        padding: innerPadding,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(shadowOpacity),
              spreadRadius: shadowSpreadRadius,
              blurRadius: shadowBlurRadius,
              offset: shadowOffset,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          children: [
            Flexible(
              child: FittedBox(
                child: icon,
              ),
            ),
            title != null
                ? Flexible(
                    flex: 2,
                    child: title!,
                  )
                : const SizedBox.shrink(),
            body != null ? body! : const SizedBox.shrink(),
            button != null
                ? Flexible(
                    child: SizedBox(
                      width: fullWidthButton ? double.infinity : null,
                      child: button,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
