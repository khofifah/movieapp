import 'package:flutter/material.dart';
import 'package:movieapp/pages/beranda/beranda.dart';
import 'package:movieapp/providers/user_provider.dart';
import 'package:movieapp/utils/routes.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_snackbar.dart';
import 'package:provider/provider.dart';
import './login.dart';

abstract class LoginViewModel extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email, password;
  UserProvider userProvider = UserProvider();

  onLogin(BuildContext buildContext) async {
    if (formKey.currentState.validate()) {
      if (!validateEmail(email)) {
        Scaffold.of(buildContext).showSnackBar(
          customSnackbar(buildContext, 'Masukkan e-mail yang valid'),
        );
      } else {
        userProvider.getDataUser(email, password).then((value) {
          if (value == null) {
            Scaffold.of(buildContext).showSnackBar(
              customSnackbar(
                context,
                'Login gagal , periksa kembali inputan anda',
              ),
            );
          } else {
            goTo(context, Beranda());
          }
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

  openDB() async {
    await userProvider.openDB();
    await userProvider.createUserTable();
  }

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    openDB();
    super.initState();
  }
}
