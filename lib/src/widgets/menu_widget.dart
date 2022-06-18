// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/src/utils/responsive.dart';

import 'dialog_box/loadingDialog.dart';

List<Map<String, dynamic>> optionList = [
  {
    'option': 'Detector de Islas',
    'route': '/island_finder',
    'icon': Icons.gamepad_outlined
  },
  {
    'option': 'Restaurant',
    'route': '/restaurant',
    'icon': Icons.restaurant_menu_rounded
  }
];

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive resonsive = Responsive(context);

    return SizedBox(
      width: resonsive.horizontal! ? resonsive.wp(40) : resonsive.wp(80),
      child: Drawer(
        child: Container(
          padding: EdgeInsets.only(top: resonsive.dp(1.5)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              right: BorderSide(
                color: Colors.grey[500]!,
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SafeArea(
                      child: LayoutBuilder(
                        builder: (context, constrains) => Center(
                          child: SizedBox(
                            width: constrains.maxWidth * 0.7,
                            height: constrains.maxWidth * 0.3,
                            child: const Image(
                              color: Colors.grey,
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: resonsive.wp(70),
                      height: resonsive.hp(50),
                      child: ListView.builder(
                          itemCount: optionList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: resonsive.wp(2),
                                  right: resonsive.wp(3),
                                  bottom: resonsive.hp(3),
                                  top: resonsive.hp(3)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      resonsive.dp(2),
                                    ),
                                  ),
                                  border: Border.all(
                                      color: Colors.black26, width: 1),
                                ),
                                child: ListTile(
                                    leading: Icon(
                                      optionList[index]['icon'],
                                      color: Colors.grey[400],
                                      size: resonsive.dp(5),
                                    ),
                                    title: Text(
                                      optionList[index]['option'],
                                      style: TextStyle(
                                          fontSize: resonsive.dp(2),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierColor:
                                            Colors.white.withOpacity(0.7),
                                        builder: (c) {
                                          return const LoadingAlertDialog(
                                              mensaje:
                                                  'Cargando datos, espere');
                                        },
                                      );
                                      Future.delayed(const Duration(
                                              milliseconds: 1500))
                                          .then((value) {
                                        Navigator.of(context).pop();
                                        Navigator.pushNamed(
                                          context,
                                          optionList[index]['route'],
                                        );
                                      });
                                    }),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: resonsive.hp(35),
                      ),
                      child: const Divider(
                        height: 2,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.exit_to_app,
                              color: Colors.red[400],
                              size: resonsive.dp(5),
                            ),
                            onPressed: () {}),
                        const Text(
                          'V.1.0.0',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
