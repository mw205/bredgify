import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/utils/app_utils.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextFormField extends StatefulWidget {
  const OtpTextFormField(
      {super.key, required this.focusNode, required this.controller});

  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  State<OtpTextFormField> createState() => _OtpTextFormFieldState();
}

class _OtpTextFormFieldState extends State<OtpTextFormField> {
  bool _hasError = false;
  InputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: color ?? Colors.grey.shade200,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppScreenUtils.isTablet ? 52.h : 44.h,
      height: AppScreenUtils.isTablet ? 52.h : 44.h,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: _hasError
              ? ColorName.red
              : widget.focusNode.hasFocus
                  ? ColorName.darkBlue
                  : ColorName.black.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            setState(() {
              _hasError = true;
            });
            return '';
          } else {
            setState(() {
              _hasError = false;
            });
          }
          return null;
        },
        readOnly: false,
        controller: widget.controller,
        focusNode: widget.focusNode,
        onFieldSubmitted: (_) {
          widget.focusNode.unfocus(); // Unfocus the current field
        },
        onTap: () {
          if (widget.controller.text.isNotEmpty) {
            widget.controller.selection = TextSelection.fromPosition(
              TextPosition(offset: widget.controller.text.length),
            );
          }
          setState(() {}); // Rebuild to update focus state
        },
        onEditingComplete: () {
          setState(() {}); // Ensure the border gets updated after editing
        },
        onSaved: (_) {
          setState(() {});
        },
        style: widget.focusNode.hasFocus
            ? AppTextStyles.kdarkBlue24FontW600
            : AppTextStyles.kBlack24FontW600,
        showCursor: false,
        decoration: const InputDecoration(
          errorStyle: TextStyle(fontSize: 0),
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1), // Limit to 1 character
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.isNotEmpty) {
            widget.focusNode.nextFocus();
          } else if (value.isEmpty && widget.controller.text.isEmpty) {
            widget.focusNode.previousFocus(); // Move to the previous field
          }
        },
      ),
    );
  }
}
