import 'package:flutter/material.dart';
import 'package:addis_plus/colors.dart';
import 'package:addis_plus/validator.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Center(child: LoginArea())),
            Container(
                decoration: BoxDecoration(
                  color: quinaryColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    )
                  ], //,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 30),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Dont have an account?",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 13,
                          color: Colors.grey[600]),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: mainColor,
                        textStyle: const TextStyle(fontSize: 13),
                      ),
                      onPressed: () {},
                      child: const Text('Signup'),
                    ),
                  ],
                ))
          ],
        )),
  ));
}

class LoginArea extends StatefulWidget {
  const LoginArea({super.key});

  @override
  State<LoginArea> createState() => _LoginAreaState();
}

class _LoginAreaState extends State<LoginArea> {
  final loginFormKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: quinaryColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 1.0,
            )
          ], //,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Material(
            color: Colors.transparent,
            child: Form(
              key: loginFormKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Logo(),
                    /*      more text widgets can be added here 
                      eg.
                        - purpose of app
                        - slogan ...*/
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: mainColor)),
                              prefixIcon: Icon(
                                Icons.email_rounded,
                              ),
                              focusColor: mainColor,
                              labelText: "Enter Email",
                              enabledBorder: UnderlineInputBorder()),
                          validator: (value) => emailValidator(value)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: TextFormField(
                        obscureText: _isObscured,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () => setState(() {
                                      _isObscured = !_isObscured;
                                    }),
                                icon: _isObscured
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            focusColor: mainColor,
                            labelText: "Enter Password",
                            border: const UnderlineInputBorder()),
                        validator: (value) => passwordValidator(value),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: mainColor,
                              padding: const EdgeInsets.all(10.0),
                              textStyle: const TextStyle(fontSize: 13),
                            ),
                            onPressed: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              minimumSize: const Size.fromHeight(40), // NEW
                            ),
                            onPressed: () {
                              if (loginFormKey.currentState!.validate()) {
                                debugPrint("valid");
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 17),
                            ))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 0),
                      child: Row(children: <Widget>[
                        const Expanded(
                            child: Divider(
                          color: mainColor,
                          thickness: 2,
                          indent: 30,
                        )),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: mainColor, width: 2)),
                          child: const Text("OR"),
                        ),
                        const Expanded(
                            child: Divider(
                          color: mainColor,
                          thickness: 2,
                          endIndent: 30,
                        )),
                      ]),
                    ),
                    SignInButton(Buttons.Google, onPressed: () {}),
                  ]),
            )));
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Addis Plus",
        style: TextStyle(
          fontFamily: "logoFont",
          fontSize: 40,
          decoration: TextDecoration.none,
          color: mainColor,
        ));
  }
}
