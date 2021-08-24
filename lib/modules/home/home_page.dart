import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/meusBoletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_text_stylesl.dart';
import 'package:payflow/shared/themes/appcolor.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final pages = [
    MeusBoletoPage(
      key: UniqueKey(),
    ),
    ExtractPage(
      key: UniqueKey(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.titleBoldBackground,
                    children: [
                      TextSpan(
                          text: "${widget.user.name}",
                          style: AppTextStyles.titleBoldBackground)
                    ])),
                subtitle: Text("Mantenha suas contas em dia!",
                    style: AppTextStyles.captionShape),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(widget.user.photoUrl ??
                            "https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png")),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: pages[homeController.currentPage],
        bottomNavigationBar: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  homeController.setPage(0);
                  setState(() {});
                },
                icon: Icon(Icons.home),
                color: homeController.currentPage == 0
                    ? AppColors.primary
                    : AppColors.body,
              ),
              GestureDetector(
                onTap: () async {
                  await Navigator.pushNamed(context, "/barcode_scanner");
                },
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.add_box,
                    color: AppColors.background,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  homeController.setPage(1);
                  setState(() {});
                },
                icon: Icon(Icons.description_outlined),
                color: homeController.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
              )
            ],
          ),
        ));
  }
}
