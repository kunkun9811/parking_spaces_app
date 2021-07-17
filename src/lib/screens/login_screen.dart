import 'package:flutter/material.dart';

import '../size_config.dart';
import './main_router.dart';
import './register_screen.dart';
import '../widgets/animated_text_field.dart';
import '../widgets/placeholder_logo.dart';
import '../widgets/general_button.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final FocusNode _userNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  final _form = GlobalKey<FormState>();
  String _username;
  String _password;

  void _signIn() {
    // Save current data in text fields
    _form.currentState.save();

    // Check if input is valid
    final isValid = _form.currentState.validate();
    if (!isValid) return;

    // TODO: Sign the user in with "username" and "password"
  }

  @override
  void dispose() {
    super.dispose();
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    _userNode.dispose();
    _passNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /* Logo Image */
            Hero(
              tag: "logo",
              child: PlaceholderImage(
                margin: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.15,
                  bottom: SizeConfig.screenHeight * 0.12,
                ),
              ),
            ),
            /* Login Form */
            Form(
              key: _form,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedTextField(
                      width: SizeConfig.screenWidth * 0.75,
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.screenHeight * 0.03),
                      textNode: _userNode,
                      fieldController: _usernameCtrl,
                      fieldLabel: "Username/Phone #",
                      textInputAction: TextInputAction.next,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please enter a username or password";
                        }
                        return null;
                      },
                      onSaved: (input) => _username = input,
                    ),
                    AnimatedTextField(
                      width: SizeConfig.screenWidth * 0.75,
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.screenHeight * 0.03),
                      textNode: _passNode,
                      fieldController: _passwordCtrl,
                      fieldLabel: "Password",
                      isPassword: true,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      onSaved: (input) => _password = input,
                      onSubmit: (input) => _signIn(),
                    ),
                  ],
                ),
              ),
            ),

            /* Submit/Register Buttons */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeneralButton(
                  buttonLabel: "Register",
                  height: SizeConfig.screenHeight * 0.055,
                  width: SizeConfig.screenWidth * 0.25,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.04),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                ),
                // TODO: Connect with _signIn()
                GeneralButton(
                  height: SizeConfig.screenHeight * 0.055,
                  width: SizeConfig.screenWidth * 0.25,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.04),
                  buttonLabel: "Login",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainRouter(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
