import 'package:d4media_sample_demo_app/login/login_controller.dart';
import 'package:d4media_sample_demo_app/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({Key? key}) : super(key: key);
  LoginController _loginController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // to bring drawer from right to left use endDrawer
      child: Container(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: DrawerHeader(
                child: Stack(
                  children: <Widget>[
                    ListTile(
                      trailing: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft + Alignment(.1, 2.5),
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              'assets/icons/d4media.png',
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF032D9C),
                              border: Border.all(
                                  color: Colors.white,
                                  width: 20.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        Align(
                            alignment:
                                Alignment.bottomLeft + Alignment(.65, .75),
                            child: const Icon(
                              Icons.credit_card_sharp,
                              size: 25,
                              color: Color(0xFF032D9C),
                            )),
                        Align(
                            alignment: Alignment.bottomLeft + Alignment(.7, .7),
                            child: const Icon(
                              Icons.edit,
                              size: 15,
                              color: Color(0xFF032D9C),
                            )),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center + Alignment(0.05, .5),
                      child: const Text(
                        'Hello',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center + Alignment(.4, .9),
                      child: const Text(
                        'Jose Dianicious',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF032D9C),
                ),
              ),
            ),
            ListTile(
                selected: true,
                selectedColor: Color(0xFF032D9C),
                horizontalTitleGap: 0,
                title: const Text("Home"),
                onTap: () {},
                leading: const Icon(Icons.home),
                trailing:
                    Image.asset('assets/icons/navigate_next_black_-1.png')),
            ListTile(
                horizontalTitleGap: 0,
                title: const Text("Category"),
                onTap: () {},
                leading: const Icon(Icons.category_rounded),
                trailing:
                    Image.asset('assets/icons/navigate_next_black_-1.png')),
            ListTile(
                horizontalTitleGap: 0,
                title: const Text("Profile"),
                onTap: () {},
                leading: Image.asset(
                    'assets/icons/account_circle_black_24dp (1).png',color: Colors.black54,),
                trailing:
                    Image.asset('assets/icons/navigate_next_black_-1.png')),
            ListTile(
                horizontalTitleGap: 0,
                title: const Text("History"),
                onTap: () {},
                leading: const Icon(Icons.history),
                trailing:
                    Image.asset('assets/icons/navigate_next_black_-1.png')),
            ListTile(
                horizontalTitleGap: 0,
                title: const Text("Notifications"),
                onTap: () {},
                leading: const Icon(Icons.notifications_none),
                trailing:
                    Image.asset('assets/icons/navigate_next_black_-1.png')),
            ListTile(
                horizontalTitleGap: 0,
                title: const Text("Favorites"),
                onTap: () {},
                leading: const Icon(Icons.favorite),
                trailing:
                    Image.asset('assets/icons/navigate_next_black_-1.png')),
            ListTile(
                horizontalTitleGap: 0,
                title: const Text("Help"),
                onTap: () {},
                leading: Icon(Icons.help_outline),
                trailing:
                    Image.asset('assets/icons/navigate_next_black_-1.png')),
            ListTile(
                horizontalTitleGap: 0,
                title: const Text("Logout"),
                onTap: () {
                  _loginController.userData.remove('username');
                  _loginController.userData.write('isLogged', false);
                  Get.offAll(LoginPage());
                },
                leading: Image.asset('assets/icons/logout_black_24dp.png',color: Colors.black54,),
                trailing:
                    Image.asset('assets/icons/navigate_next_black_-1.png')),
          ],
        ),
      ),
    );
  }
}
