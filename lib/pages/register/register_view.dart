import 'package:flutter/material.dart';
import 'package:movieapp/utils/routes.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_button.dart';
import 'package:movieapp/widgets/custom_field.dart';
import 'package:movieapp/widgets/custom_text.dart';
import './register_view_model.dart';

class RegisterView extends RegisterViewModel {
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
              child: SingleChildScrollView(
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
                        text: 'Register',
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
                              label: 'Username',
                              onChanged: (value) {
                                if (!mounted) return;
                                setState(() {
                                  username = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            CustomField(
                              label: 'Email',
                              isEmail: true,
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
                        label: 'REGISTER',
                        onTap: () => onRegister(builderContext),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Sudah punya akun? ',
                          ),
                          InkWell(
                            onTap: () {
                              goBack(context);
                            },
                            child: CustomText(
                              text: 'Login',
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
      ),
    );
  }
}
