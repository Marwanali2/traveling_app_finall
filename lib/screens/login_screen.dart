import 'package:flutter/material.dart';
import 'package:traveling_app/screens/signup_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 68, 97, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              // Image.asset("assets/images/scholar.png", height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Travelia',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                       ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                label: "الحساب الالكتروني",
                hintText: "ادخل حسابك الالكتروني",
                onChanged: (data) {
                  email = data;
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                label: "كلمة السر",
                hintText: "ادخل كلمة السر",
                onChanged: (data) {
                  password = data;
                },
              ),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                text: "سجِل الدخول",
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, TabsScreen.id);
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ليس لديك حساب ؟ ",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignUpScreen.id);
                    },
                    child: Text(
                      "انشئ الحساب",
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
