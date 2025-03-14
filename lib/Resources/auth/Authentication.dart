import 'package:flipcart/Services/userControllerService.dart';
import 'package:flipcart/Widgets/Buttons/CustomButton.dart';
import 'package:flipcart/Widgets/Buttons/TextFormField.dart';
import 'package:flipcart/constants/globalVariables.dart';
import 'package:flutter/material.dart';

enum Auth {
  sigin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController passcode = TextEditingController();
  final TextEditingController email = TextEditingController();
  final UserController userController = UserController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    name.dispose();
    passcode.dispose();
  }

  void Register() {
    userController.RegisterUser(
        context: context,
        email: email.text,
        password: passcode.text,
        name: name.text);
  }

  void SignIn() {
    userController.SigInUser(
        context: context, email: email.text, password: passcode.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                groupValue: _auth,
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                    key: _signUpFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextField(
                            obscureText: false,
                            textEditingController: name,
                            hintText: "Enter your Name",
                          ),
                          CustomTextField(
                            obscureText: false,
                            textEditingController: email,
                            hintText: "Enter your Email",
                          ),
                          CustomTextField(
                            obscureText: true,
                            textEditingController: passcode,
                            hintText: "Enter your Passcode",
                          ),
                          CustomButton(
                            text: "Sign up",
                            ontap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                Register();
                              }
                            },
                          )
                        ],
                      ),
                    )),
              ),
            ListTile(
              tileColor: _auth == Auth.sigin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: Text(
                "Sign in",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                groupValue: _auth,
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.sigin,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.sigin)
              Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          obscureText: false,
                          textEditingController: email,
                          hintText: "Enter your Email",
                        ),
                        CustomTextField(
                          obscureText: true,
                          textEditingController: passcode,
                          hintText: "Enter your Passcode",
                        ),
                        CustomButton(
                          text: "Sign in",
                          ontap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              SignIn();
                            }
                          },
                        )
                      ],
                    )),
              ),
          ],
        ),
      ),
    ));
  }
}
