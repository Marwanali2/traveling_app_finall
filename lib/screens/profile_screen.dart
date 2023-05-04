import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key key}) : super(key: key);
  var licon1 = [
    Icons.person,
    Icons.notifications,
    Icons.business_center_outlined,
    // Icons.favorite_outline,
    // Icons.settings
  ];
  var lfunction = [
    'تعديل الحساب',
    'الاشعارات',
    // 'Payment Method',
    'الرحلات المحجوزة',
    // 'الاعدادات'
  ];
  var licon2 = [
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    // Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    // Icons.arrow_forward_ios
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 245, 240, 240),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 15,
            right: 15,
          ),
          child: Column(

            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(
                          'assets/images/prof.jpg',
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Positioned(
                        top: 80,
                        right: 90,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Center(
                            child: Icon(
                              Icons.add_a_photo,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'اسم المستخدم',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                height: 500,
                child: ListView.builder(
                    itemCount: lfunction.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Expanded(
                          child: CustomCard(
                              icon: licon1[index],
                              title: lfunction[index],
                              icon2: licon2[index]),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
