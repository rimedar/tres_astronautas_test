import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/src/utils/responsive.dart';

class RestaurantHomePage extends StatelessWidget {
  const RestaurantHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Center(
      child: SizedBox(
        width: responsive.wp(60),
        height: responsive.hp(40),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/images/logo_restaurant.png')),
            Padding(
              padding: EdgeInsets.only(top: responsive.hp(3)),
              child: Text(
                'Navega por las opciones para conocer más',
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
