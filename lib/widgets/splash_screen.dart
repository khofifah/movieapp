import 'package:flutter/material.dart';
import 'package:movieapp/pages/beranda/beranda.dart';
import 'package:movieapp/pages/login/login.dart';
import 'package:movieapp/providers/connection_provider.dart';
import 'package:movieapp/providers/user_provider.dart';
import 'package:movieapp/utils/routes.dart';
import 'package:movieapp/utils/shared_preferences.dart';
import 'package:movieapp/widgets/no_connection.dart';
import 'package:movieapp/widgets/show_loading.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SharedPreferencesHandler {
  ConnectionProvider conProvider = ConnectionProvider();
  UserProvider userProvider = UserProvider();
  bool isLoading = true;

  getData() async {
    await userProvider.openDB();
    await userProvider.createUserTable();
    await conProvider.checkConnectivity().then((value) async {
      if (value) {
        int userId = await getUserId();
        if (userId != null) {
          goTo(context, Beranda());
        } else {
          goTo(context, Login());
        }
      } else {
        if (!mounted) return;
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    conProvider = Provider.of<ConnectionProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isConnect =
        Provider.of<ConnectionProvider>(context).isConnect ?? false;
    return isLoading
        ? Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
            child: circleLoading(context),
          )
        : !isConnect
            ? NoConnection(onRefresh: () => getData())
            : circleLoading(context);
  }
}
