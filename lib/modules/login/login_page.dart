import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_stylesl.dart';
import 'package:payflow/shared/themes/appcolor.dart';
import 'package:payflow/shared/widgets/socialLogin/social_login.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //MediaQuery.of pega o tamanho da tela do dispositivo
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _loginConroller = LoginController();

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Container(
              width: size.width,
              height: size.height * 0.3,
              color: AppColors.primary,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Image.asset(
                AppImages.person,
                width: 208,
                height: 273,
              ),
            ),
            Positioned(
                bottom: size.height * 0.25,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.logomini),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 70, right: 70),
                      child: Text(
                        "Organize seus boletos em um só lugar",
                        style: AppTextStyles.titleHome,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 40),
                      child: SocialoginButton(
                        onTap: () async {
                          _loginConroller.googeSignin(context);
                        },
                      ),
                    )
                  ],
                ))
          ]),
        ));
  }
}
