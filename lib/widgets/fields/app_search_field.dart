import 'package:flutter/material.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';

class AppSearchField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hint;
  final TextStyle Function(Color)? textStyle;
  final TextStyle Function(Color)? hintStyle;
  final double? height;
  final double? iconSize;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final String? helperText;
  final bool isDisabled;
  final bool required;
  final double horizontalMargin;
  final Function(String)? onChanged;
  final VoidCallback? onFocusOut;
  const AppSearchField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.hint,
    this.textStyle,
    this.hintStyle,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.helperText,
    this.isDisabled = false,
    this.required = false,
    this.horizontalMargin = 20,
    this.onChanged,
    this.onFocusOut,
    this.height,
    this.iconSize,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  @override
  void initState() {
    widget.focusNode.addListener(_focusListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_focusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isDisabled,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(widget.focusNode);
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              height: widget.height ?? 52,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F6),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: AppColors.border,
                ),
              ),
              child: Row(
                children: [
                  Assets.icons.search.svg(
                    width: 36,
                    height: 36,
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      focusNode: widget.focusNode,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      textCapitalization: widget.textCapitalization,
                      style: (widget.textStyle ??
                          AppTextStyles.r14Poppins)(AppColors.text),
                      onChanged: (text) {
                        setState(() {});
                        if (widget.onChanged != null) {
                          widget.onChanged!(text);
                        }
                      },
                      decoration: InputDecoration(
                        isCollapsed: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        hintText: widget.hint,
                        hintStyle:
                            (widget.hintStyle ?? AppTextStyles.r14Poppins)(
                          AppColors.text.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  GestureDetector(
                    onTap: () {
                      widget.controller.clear();
                      if (widget.onChanged != null) {
                        widget.onChanged!(widget.controller.text);
                      }
                    },
                    child: Assets.icons.close.svg(
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _focusListener() {
    if (!widget.focusNode.hasFocus) {
      if (widget.onFocusOut != null) {
        widget.onFocusOut!();
      }
    }
    setState(() {});
  }
}
