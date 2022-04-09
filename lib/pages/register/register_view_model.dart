import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/beranda/beranda.dart';
import 'package:movieapp/providers/user_provider.dart';
import 'package:movieapp/utils/routes.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_snackbar.dart';
import 'package:provider/provider.dart';
import './register.dart';

abstract class RegisterViewModel extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String username, email, password;
  UserProvider userProvider = UserProvider();

  onRegister(BuildContext buildContext) async {
    if (formKey.currentState.validate()) {
      if (!validateEmail(email)) {
        Scaffold.of(buildContext).showSnackBar(
          customSnackbar(buildContext, 'Masukkan e-mail yang valid'),
        );
      } else {
        userProvider.insertUser(username, email, password).then((value) {
          Scaffold.of(buildContext).showSnackBar(
            customSnackbar(
              buildContext,
              'Register Berhasil',
            ),
          );
          goTo(context, Beranda());
        });
      }
    } else {
      Scaffold.of(buildContext).showSnackBar(
        customSnackbar(
          buildContext,
          'Form tidak boleh kosong, mohon cek kembali data yang anda inputkan',
        ),
      );
    }
  }

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
  }
}
