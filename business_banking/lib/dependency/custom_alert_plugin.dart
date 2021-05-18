import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum CustomAnimationType { fromRight, fromLeft, fromTop, fromBottom, grow, shrink }
Map<CustomAnimationType, AnimationType> customAnimationTypeToAnimationType = {
  CustomAnimationType.fromRight: AnimationType.fromRight,
  CustomAnimationType.fromLeft: AnimationType.fromLeft,
  CustomAnimationType.fromTop: AnimationType.fromTop,
  CustomAnimationType.fromBottom: AnimationType.fromBottom,
  CustomAnimationType.grow: AnimationType.grow,
  CustomAnimationType.shrink: AnimationType.shrink
};

enum CustomButtonsDirection { row, column }

typedef CustomAlertAnimation = Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    );

class CustomAlert extends ExternalDependency {
  final BuildContext context;
  final String? keyString;
  final CustomAlertStyle style;
  final Widget? image;
  final String title;
  final String? desc;
  final Widget content;
  final List<CustomDialogButton>? buttons;
  final Function? closeFunction;
  final Widget? closeIcon;
  final bool onWillPopActive;
  final bool useRootNavigator;
  final CustomAlertAnimation? customAlertAnimation;

  CustomAlert({
    required this.context,
    this.keyString,
    this.style = const CustomAlertStyle(),
    this.image,
    required this.title,
    this.desc,
    this.content = const SizedBox(),
    this.buttons,
    this.closeFunction,
    this.closeIcon,
    this.onWillPopActive = false,
    this.customAlertAnimation,
    this.useRootNavigator = true,
  });

  void show() {
    Alert(
      context: context,
      id: keyString,
      //skip type since all is does it set the alert icon
      style: AlertStyle(
        animationType: customAnimationTypeToAnimationType[style.customAnimationType]!,
        animationDuration: style.animationDuration,
        alertBorder: style.alertBorder,
        isButtonVisible: style.isButtonVisible,
        isCloseButton: style.isCloseButton,
        isOverlayTapDismiss: style.isOverlayTapDismiss,
        backgroundColor: style.backgroundColor,
        overlayColor: style.overlayColor,
        titleStyle: style.titleStyle,
        descStyle: style.descStyle,
        titleTextAlign: style.titleTextAlign,
        descTextAlign: style.descTextAlign,
        buttonAreaPadding: style.buttonAreaPadding,
        constraints: style.constraints,
        buttonsDirection: (style.customButtonsDirection == CustomButtonsDirection.row)
          ? ButtonsDirection.row
          : ButtonsDirection.column,
        alertElevation: style.elevation,
        alertPadding: style.alertPadding,
        alertAlignment: style.alertAlignment
      ),
      title: title,
      desc: desc,
      content: content,
      buttons: buttons?.map((button) {
        return DialogButton(
          key: button.key,
          child: button.child,
          onPressed: button.onPressed,
          width: button.width,
          height: button.height,
          color: button.color,
          highlightColor: button.highlightColor,
          splashColor: button.splashColor,
          gradient: button.gradient,
          radius: button.radius,
          border: button.border,
          padding: button.padding,
          margin: button.margin,
        );
      }).toList(),
      closeFunction: closeFunction,
      closeIcon: closeIcon,
      onWillPopActive: onWillPopActive,
      useRootNavigator: useRootNavigator,
      alertAnimation: customAlertAnimation
    ).show();
  }
}

class CustomAlertStyle {
  final CustomAnimationType customAnimationType;
  final Duration animationDuration;
  final ShapeBorder? alertBorder;
  final bool isButtonVisible;
  final bool isCloseButton;
  final bool isOverlayTapDismiss;
  final Color? backgroundColor;
  final Color overlayColor;
  final TextStyle titleStyle;
  final TextStyle descStyle;
  final TextAlign titleTextAlign;
  final TextAlign descTextAlign;
  final EdgeInsets buttonAreaPadding;
  final BoxConstraints? constraints;
  final CustomButtonsDirection customButtonsDirection; //replace this
  final double? elevation;
  final EdgeInsets alertPadding;
  final AlignmentGeometry alertAlignment;

  const CustomAlertStyle({
    this.customAnimationType = CustomAnimationType.fromBottom,
    this.animationDuration = const Duration(milliseconds: 200),
    this.alertBorder,
    this.isButtonVisible = true,
    this.isCloseButton = true,
    this.isOverlayTapDismiss = true,
    this.backgroundColor,
    this.overlayColor = Colors.black87,
    this.titleStyle = const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal),
    this.titleTextAlign = TextAlign.center,
    this.descStyle = const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal),
    this.descTextAlign = TextAlign.center,
    this.buttonAreaPadding = const EdgeInsets.all(20.0),
    this.constraints,
    this.customButtonsDirection = CustomButtonsDirection.row,
    this.elevation,
    this.alertPadding = defaultAlertPadding,
    this.alertAlignment = Alignment.center,
  });
}

class CustomDialogButton {
  final Key? key;
  final Widget? child;
  final double? width;
  final double height;
  final Color? color;
  final Color? highlightColor;
  final Color? splashColor;
  final Gradient? gradient;
  final BorderRadius radius;
  final VoidCallback? onPressed;
  final BoxBorder border;
  final EdgeInsets padding;
  final EdgeInsets margin;

  CustomDialogButton({
    this.key,
    required this.child,
    this.width,
    this.height = 40.0,
    this.color,
    this.highlightColor,
    this.splashColor,
    this.gradient,
    this.radius = const BorderRadius.all(Radius.circular(6)),
    this.border = const Border.fromBorderSide(
      BorderSide(
        color: const Color(0x00000000),
        width: 0,
        style: BorderStyle.solid,
      ),
    ),
    this.padding = const EdgeInsets.only(left: 6, right: 6),
    this.margin = const EdgeInsets.all(6),
    required this.onPressed,
  });
}