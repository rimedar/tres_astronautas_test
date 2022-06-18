import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/src/utils/responsive.dart';

class RestaurantUnderConstructionPage extends StatelessWidget {
  const RestaurantUnderConstructionPage(this.title, {Key? key})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Center(
      child: SizedBox(
        width: responsive.wp(60),
        height: responsive.hp(40),
        child: Column(
          children: [
            const Image(
                image: AssetImage('assets/images/under_construction.png')),
            Padding(
              padding: EdgeInsets.only(top: responsive.hp(3)),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: responsive.dp(2), fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
