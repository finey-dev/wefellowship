import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wefellowship/utilities/utilities.dart';

/// Render the motion toast widget
// ignore: must_be_immutable
class RelightToast extends StatefulWidget {
  @override
  State<RelightToast> createState() => _RelightToastState();

  /// Render a success motion toast
  /// [primaryColor] is set to [successColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.SUCCESS]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.SUCCESS]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  RelightToast.success({
    Key? key,
    required this.description,
    this.title,
    this.width,
    this.height,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = RelightToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.displayBorder = false,
    this.displaySideBar = true,
  }) : super(key: key) {
    relightToastType = RelightToastType.success;
    _initializeAnimationType();
    _assertValidValues();
    _initializeParameters();
  }

  /// Render a warning motion toast
  /// [primaryColor] is set to [warningColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.WARNING]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.WARNING]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  RelightToast.warning({
    Key? key,
    required this.description,
    this.title,
    this.width = 350,
    this.height = 80,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = RelightToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.displayBorder = false,
    this.displaySideBar = true,
  }) : super(key: key) {
    relightToastType = RelightToastType.warning;
    _initializeAnimationType();
    _assertValidValues();
    _initializeParameters();
  }

  /// Render an error motion toast
  /// [primaryColor] is set to [errorColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.ERROR]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.ERROR]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  RelightToast.error({
    Key? key,
    required this.description,
    this.title,
    this.width = 350,
    this.height = 80,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = RelightToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.displayBorder = false,
    this.displaySideBar = true,
  }) : super(key: key) {
    relightToastType = RelightToastType.error;
    _initializeAnimationType();
    _assertValidValues();
    _initializeParameters();
  }

  /// Render Info motion toast
  /// [primaryColor] is set to [infoColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.INFO]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.INFO]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  RelightToast.info({
    Key? key,
    required this.description,
    this.title,
    this.width = 350,
    this.height = 80,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = RelightToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.displayBorder = false,
    this.displaySideBar = true,
  }) : super(key: key) {
    relightToastType = RelightToastType.info;
    _initializeAnimationType();
    _assertValidValues();
    _initializeParameters();
  }

  /// Render delete motion toast
  /// [primaryColor] is set to [deleteColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.DELETE]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.DELETE]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  RelightToast.delete({
    Key? key,
    required this.description,
    this.title,
    this.width = 350,
    this.height = 80,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = RelightToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.displayBorder = false,
    this.displaySideBar = true,
  }) : super(key: key) {
    relightToastType = RelightToastType.delete;
    _initializeAnimationType();
    _assertValidValues();
    _initializeParameters();
  }

  /// initialize [icon] and [primaryColor] based on the selected [RelightToastType]
  void _initializeParameters() {
    icon = RelightToastType as IconData?;
    primaryColor = RelightToastType as Color;
    secondaryColor = RelightToastType as Color;
    backgroundType = BackgroundType.lighter;
  }

  /// assert valid values when creating a Relight toast widget
  void _assertValidValues() {
    if (width != null || height != null) {
      assert(
        width != null && height != null,
        'You need to provide both width and height or use constraints attribute',
      );
    }
  }

  void _initializeAnimationType() {
    if (position == RelightToastPosition.bottom &&
        animationType == AnimationType.fromTop) {
      animationType = AnimationType.fromBottom;
    } else if (position == RelightToastPosition.top &&
        animationType == AnimationType.fromBottom) {
      animationType = AnimationType.fromTop;
    }
  }

  /// the text widget used for description message
  final Widget description;

  /// The title of the motion toast
  /// if it's null it will not be rendered in the widget
  final Widget? title;

  /// The motion toast type possible values:
  /// ```dart
  /// {
  ///  sucess
  ///  error
  ///  warning
  ///  info
  ///  delete
  ///  custom
  /// }
  /// ```
  late final RelightToastType relightToastType;

  /// The motion toast icon, for types other than custom
  /// the icon will get the default type icon
  ///
  /// if [RelightToastType] set to [RelightToastType.custom] the icon parameter is required
  late final IconData? icon;

  /// The motion toast background color
  /// if `RelightToastType == MOTION_TOAST_TYPE.CUSTOM` color parameter is required
  /// else the color will get the default type color from [RelightToastColors]
  late final Color primaryColor;

  /// Color applied on the motion toast side widget (sidebar) and the icon
  /// if it's null secondary color will be the primary color
  /// can be customized when using the default constructor
  late final Color? secondaryColor;

  /// the type  of the background that will be applied on the motion toast content
  /// available values:
  /// - solid: the primary color will be applied as it is on the content background
  /// - transparent: an opacity will be added to the primary color
  /// - lighter: a white background added to the motion toast with little opacity added to the primary color
  late final BackgroundType backgroundType;

  /// The design type icon (Material design or Cupertino)
  /// if [RelightToastType] set to [MOTION_TOAST_TYPE.CUSTOM] [iconType] will not be used
  /// possible values
  /// ```dart
  /// {
  /// MATERIAL_DESIGN,
  /// CUPERTINO
  /// }
  // /// ```
  // late final IconType? iconType;

  /// The Relight toast width by default it's set to 250
  final double? width;

  /// define the height of the motion toast
  final double? height;

  /// The constraint of the motion toast to size itself to the content
  /// for responsive design
  /// If it's `null`, then [width] and [height] will be used as it is.
  final BoxConstraints? constraints;

  /// the motion toast icon size
  /// by default it's 40
  final double iconSize;

  /// disable or enable the heartbeat animation on the icon
  /// by default the animation is enabled
  final bool enableAnimation;

  /// The layout ToastOrientation (from right to left or from left to right)
  /// ```dart
  /// {
  /// LTR,
  /// RTL
  /// }
  /// ```
  final ToastOrientation layoutOrientation;

  /// The type of animation, by default it's [AnimationType.fromBottom]
  /// ```dart
  /// {
  /// FROM_BOTTOM,
  /// FROM_LEFT,
  /// FROM_RIGHT
  /// }
  /// ```
  late AnimationType animationType;

  /// the Duration of the toast animation
  /// by default it's 1.5 seconds
  final Duration animationDuration;

  /// How long the toast will be shown
  /// by default it's 3 seconds.
  final Duration toastDuration;

  /// The toast animation curve
  /// by default it's `Curves.ease`
  final Curve animationCurve;

  /// The position where the motion toast will be displayed
  /// possible values
  /// ```dart
  /// {
  /// CENTER,
  /// TOP,
  /// BOTTOM
  /// }
  /// ```
  final RelightToastPosition position;

  /// Define the border radius of the toast
  /// by default it's 20
  final double borderRadius;

  /// Function invoked when the toast is closed
  final Function? onClose;

  /// define whether the motion toast can be dismissed or not
  /// applied on bottom motion toast
  final bool dismissable;

  /// The barrier color applied to the dialog display
  /// by default the barrier is transparent [Colors.transparent]
  final Color barrierColor;

  ///padding added to the main widget motion taost
  ///by default the padding is set to 0
  final EdgeInsets padding;

  /// define whether the borders are rendered or not
  /// by default  `= false`
  final bool displayBorder;

  /// define whether the side bar is displayed or not
  /// default `= true`
  final bool displaySideBar;

  /// Display the created motion toast based on the [position] attribute
  /// [context]: the actual context of the application
  void show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder<Widget>(
        fullscreenDialog: false,
        barrierColor: barrierColor,
        pageBuilder: (BuildContext context, _, __) => this,
        opaque: false,
        barrierDismissible: dismissable,
      ),
    );
  }
}

class _RelightToastState extends State<RelightToast>
    with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;
  late Timer toastTimer;

  void _popCurrentToast() {
    if (mounted) {
      Navigator.of(context).pop();
      widget.onClose?.call();
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    toastTimer = Timer(
      widget.toastDuration,
      _popCurrentToast,
    );
  }

  /// initialize the animation that will be applied when displaying the toast
  ///  based on [this.widget.animationDuration], [this.widget.animationType] and [this.widge]
  void _initializeAnimation() {
    slideController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    var curveAnimation = CurvedAnimation(
      parent: slideController,
      curve: widget.animationCurve,
    );

    switch (widget.animationType) {
      case AnimationType.fromLeft:
        if (widget.position == RelightToastPosition.top) {
          offsetAnimation = Tween<Offset>(
            begin: const Offset(-0.3, 0.3),
            end: const Offset(0, 0.3),
          ).animate(curveAnimation);
        } else {
          offsetAnimation = Tween<Offset>(
            begin: const Offset(-0.3, -0.3),
            end: const Offset(0, -0.3),
          ).animate(curveAnimation);
        }
        break;
      case AnimationType.fromRight:
        if (widget.position == RelightToastPosition.top) {
          offsetAnimation = Tween<Offset>(
            begin: const Offset(0.5, 0.3),
            end: const Offset(0, 0.3),
          ).animate(curveAnimation);
        } else {
          offsetAnimation = Tween<Offset>(
            begin: const Offset(1.3, -0.3),
            end: const Offset(0, -0.3),
          ).animate(curveAnimation);
        }
        break;
      case AnimationType.fromTop:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -0.3),
          end: const Offset(0, 0.3),
        ).animate(curveAnimation);
        break;
      default:
        offsetAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, -0.3),
        ).animate(curveAnimation);
    }

    /// ! To support Flutter < 3.0.0
    /// This allows a value of type T or T?
    /// to be treated as a value of type T?.
    ///
    /// We use this so that APIs that have become
    /// non-nullable can still be used with `!` and `?`
    /// to support older versions of the API as well.
    T? ambiguate<T>(T? value) => value;

    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
      (_) => slideController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.dismissable ? _popCurrentToast : null,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: widget.padding,
            child: _renderRelightToastContent(),
          ),
        ),
      ),
    );
  }

  Widget _renderRelightToastContent() {
    return Center(
      child: Align(
        alignment: widget.position.alignment,
        child: Container(
          height: widget.height,
          width: widget.width,
          constraints: widget.height == null && widget.width == null
              ? widget.constraints ??
                  BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                    minWidth: 200,
                    maxHeight: 100,
                  )
              : null,
          child: widget.position == RelightToastPosition.center
              ? _buildRelightToast()
              : SlideTransition(
                  position: offsetAnimation,
                  child: _buildRelightToast(),
                ),
        ),
      ),
    );
  }

  Widget _buildRelightToast() {
    return RelightToastBackground(
      backgroundColor: widget.primaryColor,
      borderRadius: widget.borderRadius,
      backgroundType: widget.backgroundType,
      borderColor: widget.secondaryColor ?? widget.primaryColor,
      displayBorder: widget.displayBorder,
      child: RelightToastContent(
        color: widget.secondaryColor ?? widget.primaryColor,
        description: widget.description,
        icon: widget.icon,
        iconSize: widget.iconSize,
        radius: widget.borderRadius,
        title: widget.title,
        withAnimation: widget.enableAnimation,
        isReversed: widget.layoutOrientation == ToastOrientation.rtl,
        displaySideBar: widget.displaySideBar,
      ),
    );
  }

  @override
  void dispose() {
    slideController.dispose();
    toastTimer.cancel();
    super.dispose();
  }
}
