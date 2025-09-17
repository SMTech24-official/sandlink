import 'package:flutter/material.dart';

/// A reusable expandable text widget that shows limited lines by default
/// and expands to show full text when "Read More" is tapped
class CustomExpandableText extends StatefulWidget {
  /// The text to display
  final String text;

  /// Maximum number of lines to show when collapsed (default: 3)
  final int maxLines;

  /// Text style for the main text
  final TextStyle? textStyle;

  /// Text style for the expand/collapse button
  final TextStyle? buttonStyle;

  /// Color for the expand/collapse button (default: Theme primary color)
  final Color? buttonColor;

  /// Text to show for expand button (default: "Read More")
  final String expandText;

  /// Text to show for collapse button (default: "Show Less")
  final String collapseText;

  /// Whether to show expand/collapse icons
  final bool showIcon;

  /// Animation duration for expand/collapse
  final Duration animationDuration;

  /// Padding around the widget
  final EdgeInsetsGeometry? padding;

  /// Text alignment
  final TextAlign textAlign;

  const CustomExpandableText({
    super.key,
    required this.text,
    this.maxLines = 3,
    this.textStyle,
    this.buttonStyle,
    this.buttonColor,
    this.expandText = 'See More',
    this.collapseText = 'See Less',
    this.showIcon = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.padding,
    this.textAlign = TextAlign.start,
  });

  @override
  State<CustomExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<CustomExpandableText>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  bool _needsExpansion = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfExpansionNeeded();
    });
  }

  void _checkIfExpansionNeeded() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
      ),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
      textAlign: widget.textAlign,
    );

    textPainter.layout(
      maxWidth:
          MediaQuery.of(context).size.width -
          (widget.padding?.horizontal ?? 32),
    );

    if (mounted) {
      setState(() {
        _needsExpansion = textPainter.didExceedMaxLines;
      });
    }
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveButtonColor = widget.buttonColor ?? theme.primaryColor;
    final effectiveTextStyle = widget.textStyle ?? theme.textTheme.bodyMedium;
    final effectiveButtonStyle =
        widget.buttonStyle ??
        theme.textTheme.bodySmall?.copyWith(
          color: effectiveButtonColor,
          fontWeight: FontWeight.w600,
        );

    return Container(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedCrossFade(
            duration: widget.animationDuration,
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: _buildCollapsedText(effectiveTextStyle),
            secondChild: _buildExpandedText(effectiveTextStyle),
          ),

          if (_needsExpansion) ...[
            const SizedBox(height: 8),
            _buildToggleButton(effectiveButtonStyle, effectiveButtonColor),
          ],
        ],
      ),
    );
  }

  Widget _buildCollapsedText(TextStyle? textStyle) {
    return Stack(
      children: [
        Text(
          widget.text,
          style: textStyle,
          maxLines: widget.maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: widget.textAlign,
        ),
        if (_needsExpansion)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 20,
            child: Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.transparent,
                //     Theme.of(context).scaffoldBackgroundColor,
                //   ],
                // ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildExpandedText(TextStyle? textStyle) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Text(widget.text, style: textStyle, textAlign: widget.textAlign),
    );
  }

  Widget _buildToggleButton(TextStyle? buttonStyle, Color buttonColor) {
    return InkWell(
      onTap: _toggleExpansion,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _isExpanded ? widget.collapseText : widget.expandText,
              style: buttonStyle,
            ),
            if (widget.showIcon) ...[
              const SizedBox(width: 4),
              AnimatedRotation(
                duration: widget.animationDuration,
                turns: _isExpanded ? 0.5 : 0,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 18,
                  color: buttonColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
