import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/display_properties.dart';
import '../text/text_style.dart';

class BasicTextField extends StatefulWidget {
  const BasicTextField({
    Key? key,
    required this.width,
this.height,
    this.initialValue,
    this.labelText,
    this.onChanged,
    this.onSubmitted,
    this.autoFocus = true,
    this.textInputType = TextInputType.text,
    this.style,
    this.cursorColor,
    this.inputFormatters,
    this.floatingLabelStyle,
  }) : super(key: key);

  final bool autoFocus;
  final double width;
  final double? height;
  final String? initialValue;
  final Function(String)? onChanged;
    final Function(String)? onSubmitted;
  final String? labelText;
  final TextInputType textInputType;
  final TextStyle? style;
  final TextStyle? floatingLabelStyle;
  final Color? cursorColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<BasicTextField> createState() => _EditorTextInputState();
}

class _EditorTextInputState extends State<BasicTextField> {
  final FocusNode _focus = FocusNode();
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BasicTextField oldWidget) {
    _controller.text = widget.initialValue ?? '';
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DisplayProperties.textFieldWidth,
      height: DisplayProperties.componentsHeight,
      child: TextField(
        autofocus: widget.autoFocus,
        maxLines: 1,
        style: widget.style ?? TextStyles.heading02,
        cursorColor: widget.cursorColor ?? AppColors.black100,
        inputFormatters: widget.inputFormatters,
        textAlign: TextAlign.center,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle: widget.floatingLabelStyle ?? TextStyles.body01,
          border: DisplayProperties.focusedBorder,
          enabledBorder: DisplayProperties.focusedBorder,
          focusedBorder: DisplayProperties.focusedBorder,
          labelStyle: TextStyles.body01,
          labelText: widget.labelText,
        ),
        focusNode: _focus,
        controller: _controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
