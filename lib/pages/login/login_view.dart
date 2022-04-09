import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/register/register.dart';
import 'package:movieapp/utils/routes.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_button.dart';
import 'package:movieapp/widgets/custom_field.dart';
import 'package:movieapp/widgets/custom_text.dart';
import './login_view_model.dart';

class LoginView extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Builder(
            builder: (builderContext) => SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomText(
                      text: 'Login',
                      color: primaryColor,
                      fontSize: 24,
                      isBold: true,
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomField(
                            label: 'Email',
                            onChanged: (value) {
                              if (!mounted) return;
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                          SizedBox(height: 20),
                          CustomField(
                            label: 'Password',
                            isPassword: true,
                            onChanged: (value) {
                              if (!mounted) return;
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      label: 'LOGIN',
                      onTap: () => onLogin(builderContext),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Belum punya akun? ',
                        ),
                        InkWell(
                          onTap: () {
                            goTo(context, Register());
                          },
                          child: CustomText(
                            text: 'Register',
                            isBold: true,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
