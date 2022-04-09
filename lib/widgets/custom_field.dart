import 'package:flutter/material.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_text.dart';

class CustomField extends StatefulWidget {
  final String label;
  final Function validator, onChanged;
  final bool isPassword, isEmail;

  const CustomField({
    Key key,
    this.label,
    this.onChanged,
    this.validator,
    this.isPassword = false,
    this.isEmail = false,
  }) : super(key: key);

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isSeePassword = false;
  TextEditingController controller = TextEditingController();

  togglePassword() {
    if (!mounted) return;
    setState(() {
      isSeePassword = !isSeePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: widget.label,
              fontSize: 16,
            ),
          ],
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          onChanged: (value) {
            widget.onChanged(value);
          },
          validator: (value) {
            return widget.validator != null ? widget.validator(value) : null;
          },
          obscureText: widget.isPassword && !isSeePassword,
          keyboardType:
              widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      togglePassword();
                    },
                    icon: Icon(
                      isSeePassword ? Icons.visibility : Icons.visibility_off,
                      color: primaryColor,
                      size: 20,
                    ),
                  )
                : SizedBox(),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: secColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: secColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: secColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ],
    );
  }
}
