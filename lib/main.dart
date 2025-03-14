import 'package:flipcart/Resources/auth/Authentication.dart';
import 'package:flipcart/Screens/Admin/AdminScreen.dart';
import 'package:flipcart/Services/userControllerService.dart';
import 'package:flipcart/Widgets/Bars/BottomBar.dart';
import 'package:flipcart/constants/globalVariables.dart';
import 'package:flipcart/provider/userProvider.dart';
import 'package:flipcart/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserController userController = UserController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            appBarTheme: AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.role == "user"
                ? BottomBar()
                : Admin()
            : AuthScreen());
  }
}
