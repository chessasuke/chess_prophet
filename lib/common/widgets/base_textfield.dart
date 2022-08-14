// import 'package:chess_prophet/common/constants/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../text/text_style.dart';


// class BaseTextfield extends StatefulWidget {
//   const BaseTextfield({
//     this.keyboardType,
//     this.style,
//     this.inputFormatter,
//     this.onChanged,
//     this.hintText,
//     this.isFilled = true,
//     this.fillColor = Colors.white,
//     this.contentPadding = EdgeInsets.zero,
//     this.hintTextStyle,
//     this.focusColor = AppColors.grayNeutral300,
//     this.textAlign = TextAlign.center,
//     this.decoration,
//     this.labelText,
//     Key? key,
//   }) : super(key: key);

//   final InputDecoration? decoration;
//   final Function(String)? onChanged;
//   final List<TextInputFormatter>? inputFormatter;
//   final TextStyle? style;
//   final TextInputType? keyboardType;
//   final TextAlign textAlign;
//   final String? hintText;
//   final TextStyle? hintTextStyle;
//   final bool isFilled;
//   final Color focusColor;
//   final Color fillColor;
//   final EdgeInsets contentPadding;
//   final String? labelText;

//   @override
//   State<BaseTextfield> createState() => _BaseTextfieldState();
// }

// class _BaseTextfieldState extends State<BaseTextfield> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       cursorColor: AppColors.pink,
//       style: widget.style ?? TextStyles.heading03,
//       showCursor: true,
//       keyboardType: widget.keyboardType,
//       inputFormatters: widget.inputFormatter,
//       textAlign: widget.textAlign,
//       onChanged: widget.onChanged,
//       enableSuggestions: false,
//       maxLines: 1,
//       decoration: InputDecoration(
//             border: InputBorder.none,
//             labelText: widget.labelText,
//             labelStyle: TextStyles.heading03.copyWith(color: AppColors.grayNeutral300),
//             hintStyle: widget.hintTextStyle ?? TextStyles.heading03,
//             hintText: widget.hintText,
//             fillColor: widget.fillColor,
//             contentPadding: widget.contentPadding,
//             focusColor: widget.focusColor,
//             filled: widget.isFilled,
//           ),
//     );
//   }
// }
