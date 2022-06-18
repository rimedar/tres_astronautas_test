import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/src/utils/responsive.dart';
import 'package:tres_astronautas_test/src/widgets/menu_widget.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<Map<String, String>> optionList = [
    {'option': 'Problema Logico :  Islas (0 y 1)', 'route': '/island_finder'},
    {'option': 'Diseño app :  Restaurant', 'route': '/restaurant'}
  ];
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: const Text(
          'Tres Astronautas Test',
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
        ),
      ),
      drawer: MenuWidget(),
      drawerScrimColor: Colors.grey[100],
      body: Center(
        child: SizedBox(
          width: responsive.wp(80),
          height: responsive.hp(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Test para Trest Astronautas',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: responsive.dp(2.3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                height: 25,
                color: Colors.grey,
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: optionList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsive.wp(2),
                            vertical: responsive.hp(1.5)),
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(optionList[index]['route']!),
                          child: Text(
                            (index + 1).toString() +
                                ' :' +
                                optionList[index]['option']!,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: responsive.dp(1.7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
