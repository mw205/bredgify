import 'package:bridgefy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../gen/colors.gen.dart';
import '../constants/app_text_styles.dart';
import '../utils/app_utils.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String label;
  final Widget? icon;
  final Function(String)? onChanged;
  final bool? obscureText;
  final String? obsecuringCharacter;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintTextStyle;
  final BoxConstraints? prexixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final double? top;
  final double? bottom;
  final double? end;
  final double? start;
  final String? Function(String?)? validator;
  final bool? isReadOnly;
  final bool? customValidation;
  const CustomTextFormField(
      {super.key,
      this.onChanged,
      required this.hintText,
      this.icon,
      this.obscureText = false,
      this.obsecuringCharacter = "*",
      this.textEditingController,
      this.keyboardType = TextInputType.text,
      this.maxLines = 1,
      required this.prefixIcon,
      this.suffixIcon,
      required this.label,
      this.hintTextStyle,
      this.prexixIconConstraints,
      this.suffixIconConstraints,
      this.top,
      this.bottom,
      this.end,
      this.start,
      this.validator,
      this.isReadOnly,
      //added customValidation to custom textFormFeild to be true and return the validation message if carColor is null in the textFormFeild for Choose Car color at date(11/11/2024) by helmy
      this.customValidation = false});
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObsecured;
  final FocusNode _focusNode = FocusNode();
  bool _hasValidationError = false;
  String? _errorMessage;
  @override
  void initState() {
    isObsecured = widget.obscureText ?? false;
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void togglePasswordVisibility() {
    setState(() {
      isObsecured = !isObsecured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Text(widget.label, style: AppTextStyles.kBlack16FontW500),
        ),
        Container(
          padding: EdgeInsetsDirectional.only(
            top: widget.top ?? (AppScreenUtils.isTablet ? 8.h : 4.h),
            end: widget.end ?? 23.w,
            bottom: widget.bottom ?? (AppScreenUtils.isTablet ? 8.h : 4.h),
            start: widget.start ?? 11.w,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: _hasValidationError ? ColorName.red : ColorName.gray,
              strokeAlign: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: TextFormField(
              readOnly: widget.isReadOnly ?? false,
              onTap: () {
                setState(() {
                  _focusNode.requestFocus();
                });
              },
              focusNode: _focusNode,
              validator: (value) {
                //handle custom validation by helmy(11/11/2024)
                if (widget.customValidation == true) {
                  return widget.validator?.call(value);
                } else if (value?.isEmpty ?? true) {
                  setState(() {
                    _hasValidationError = true;
                    _errorMessage = "field_can't_be_empty".tr;
                  });
                  return "";
                }
                final validationResult = widget.validator?.call(value);
                setState(() {
                  _hasValidationError = validationResult != null;
                  _errorMessage = validationResult;
                });
                return validationResult;
              },
              maxLines: widget.maxLines,
              obscureText: isObsecured,
              obscuringCharacter: "*",
              enableSuggestions: true,
              controller: widget.textEditingController,
              style: AppTextStyles.kGray12FontW500,
              cursorColor: ColorName.black,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.only(
                  start: 20.w,
                  end: 15.w,
                  top: 15.h,
                ),
                hintText: widget.hintText,
                prefixIcon: Transform.scale(
                  scale: 0.5,
                  child: widget.prefixIcon,
                ),
                hintStyle:
                    widget.hintTextStyle ?? AppTextStyles.kGray12FontW500,
                border: InputBorder.none,
                suffixIcon:
                    Transform.scale(scale: 0.5, child: checkAboutSuffixIcon()),
              ),
            ),
          ),
        ),
        if (_hasValidationError && _errorMessage != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              _errorMessage!,
              // style: AppTextStyles.kRed11FontW400,
            ),
          ),
      ],
    );
  }

  ///make check if the suffix icon is specified or no , if so then it will be returned and if not then make another check if the obsecure text is set to true and if so then it will provide a button to toggle the obsecure
  Widget? checkAboutSuffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    } else if (widget.obscureText == true) {
      return GestureDetector(
        onTap: () {
          togglePasswordVisibility();
        },
        child: isObsecured
            ? Assets.images.eyeDisabled.svg(height: 18.75.h, width: 16.w)
            : Assets.images.eyeEnabled.svg(height: 18.75.h, width: 16.w),
      );
    } else {
      return null;
    }
  }

  /// Returns an [OutlineInputBorder] with a circular border radius of 10
  /// and a border side with the given [color].
  ///
  /// This is used to style the border of a [TextFormField].
  ///
  /// The [color] parameter is the color of the border side of the
  /// [OutlineInputBorder].
  ///
  /// The returned [OutlineInputBorder] has a [BorderRadius.circular] of 10
  /// and a [BorderSide] with the given [color].
  OutlineInputBorder _buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: color),
    );
  }
}
