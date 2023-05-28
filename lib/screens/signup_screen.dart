import 'package:flutter/material.dart';
import 'package:traveling_app/screens/tabs_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'login_screen.dart';



// class SignUPScreen extends StatelessWidget {
//   const SignUPScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ,
//     );
//   }
// }

class SignUpScreen extends StatelessWidget {
  static String id = 'SignUPScreen';
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey(); // شرحها مكتوب في الون نوت

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 68, 97, 1),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  //علشان احقق ال form validation بشوف  الويدجت اللي عايز اتحقق منها موجوده جوا مين يعني اعمل  wrap with widget form للويدجت اللي بتحتوي علي الويدجت اللي بتحقق منها و بحدد ال key الخاص بالform
                  key: formKey,
                  //ال key عبارة عن مفتاح بيبقي خاص لكل فورم يعني من خلال الkey ده اقدر اوصل لمحتوي الفورم بتاعتي
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      // Image.asset(
                      //   "assets/images/scholar.png",
                      //   height: 100,
                      // ),
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
                            'انشاء حساب الكتروني',
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
                        onChanged: (data) {
                          password = data;
                        },
                        label: "كلمة السر",
                        hintText: "ادخل كلمة السر",
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomButton(
                        text: "انشئ الحساب",
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, LoginScreen.id);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "تمتلك حساب بالفعل ؟ ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, LoginScreen.id);
                            },
                            child: Text(
                              "سجِل الدخول",
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
