import 'package:tap_builder/tap_builder.dart';
import 'package:zaplab_design/zaplab_design.dart';

class AppSmallButton extends StatelessWidget {
  const AppSmallButton({
    super.key,
    required this.children,
    this.onTap,
    this.onLongPress,
    this.onChevronTap,
    this.inactiveGradient,
    this.hoveredGradient,
    this.pressedGradient,
    this.inactiveColor,
    this.hoveredColor,
    this.pressedColor,
    this.square = false,
    this.rounded = false,
    this.padding,
  });

  final List<Widget> children;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onChevronTap;
  final Gradient? inactiveGradient;
  final Gradient? hoveredGradient;
  final Gradient? pressedGradient;
  final Color? inactiveColor;
  final Color? hoveredColor;
  final Color? pressedColor;
  final bool square;
  final bool rounded;
  final AppEdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    // Determine the gradients/colors to use
    final defaultGradient = theme.colors.blurple;

    final effectiveInactiveGradient =
        inactiveColor != null ? null : (inactiveGradient ?? defaultGradient);
    final effectiveHoveredGradient = inactiveColor != null
        ? null
        : (hoveredGradient ?? effectiveInactiveGradient);
    final effectivePressedGradient = inactiveColor != null
        ? null
        : (pressedGradient ?? effectiveInactiveGradient);

    final effectiveInactiveColor = inactiveColor;
    final effectiveHoveredColor = hoveredColor ?? effectiveInactiveColor;
    final effectivePressedColor = pressedColor ?? effectiveInactiveColor;

    return TapBuilder(
      onTap: onTap,
      onLongPress: onLongPress,
      builder: (context, state, hasFocus) {
        double scaleFactor = 1.0;
        if (state == TapState.pressed) {
          scaleFactor = 0.97;
        } else if (state == TapState.hover) {
          scaleFactor = 1.01;
        }

        return Transform.scale(
          scale: scaleFactor,
          child: Semantics(
            enabled: true,
            selected: true,
            child: AppSmallButtonLayout(
              content: children,
              square: square,
              rounded: rounded,
              onChevronTap: onChevronTap,
              gradient: state == TapState.hover
                  ? effectiveHoveredGradient
                  : state == TapState.pressed
                      ? effectivePressedGradient
                      : effectiveInactiveGradient,
              backgroundColor: state == TapState.hover
                  ? effectiveHoveredColor
                  : state == TapState.pressed
                      ? effectivePressedColor
                      : effectiveInactiveColor,
              padding: padding,
            ),
          ),
        );
      },
    );
  }
}

class AppSmallButtonLayout extends StatelessWidget {
  const AppSmallButtonLayout({
    super.key,
    required this.content,
    this.gradient,
    this.backgroundColor,
    this.onChevronTap,
    this.square = false,
    this.rounded = false,
    this.padding,
  });

  final List<Widget> content;
  final Gradient? gradient;
  final Color? backgroundColor;
  final VoidCallback? onChevronTap;
  final bool square;
  final bool rounded;
  final AppEdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final buttonHeight = theme.sizes.s32;

    return AppContainer(
      decoration: BoxDecoration(
        borderRadius: rounded
            ? theme.radius.asBorderRadius().rad16
            : theme.radius.asBorderRadius().rad8,
        gradient: gradient,
        color: gradient == null ? backgroundColor : null,
      ),
      height: buttonHeight,
      width: square ? buttonHeight : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppContainer(
            padding: padding ??
                (square
                    ? null
                    : const AppEdgeInsets.symmetric(
                        horizontal: AppGapSize.s12,
                      )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: content,
            ),
          ),
          if (onChevronTap != null) ...[
            AppDivider.vertical(
              color: theme.colors.whiteEnforced.withValues(alpha: 0.33),
            ),
            GestureDetector(
              onTap: onChevronTap,
              behavior: HitTestBehavior.opaque,
              child: AppContainer(
                padding: const AppEdgeInsets.only(
                  left: AppGapSize.s8,
                  right: AppGapSize.s8,
                  top: AppGapSize.s2,
                  bottom: AppGapSize.none,
                ),
                child: AppIcon.s4(
                  theme.icons.characters.chevronDown,
                  outlineColor:
                      theme.colors.whiteEnforced.withValues(alpha: 0.66),
                  outlineThickness: AppLineThicknessData.normal().medium,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
