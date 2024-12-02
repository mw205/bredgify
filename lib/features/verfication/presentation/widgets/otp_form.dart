import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/features/verfication/presentation/widgets/otp_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key, this.onGenerateFields});
  final void Function(
          List<TextEditingController> controllers, List<FocusNode> focusNodes)?
      onGenerateFields;
  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  List<FocusNode> focusNodes = [];
  List<TextEditingController> controllers = [];
  List<Widget> fields = [];
  @override
  void initState() {
    _generateFields();
    super.initState();
  }

  void _generateFields() {
    for (var i = 0; i < 6; i++) {
      focusNodes.add(FocusNode());
      controllers.add(TextEditingController());
    }
    for (int i = 0; i < 6; i++) {
      fields.add(
        OtpTextFormField(
          controller: controllers[i],
          focusNode: focusNodes[i],
        ),
      );
    }
    widget.onGenerateFields!(controllers, focusNodes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 10.h, start: 18.w),
          child: Text(
            "OTP Code",
            style: AppTextStyles.kBlack16FontW500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: fields,
        ),
      ],
    );
  }
}
