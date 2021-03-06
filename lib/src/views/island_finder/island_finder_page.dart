import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tres_astronautas_test/src/utils/responsive.dart';
import 'package:tres_astronautas_test/src/views/island_finder/island_finder_controller.dart';

class IslandFinderPage extends StatefulWidget {
  const IslandFinderPage({Key? key}) : super(key: key);

  @override
  State<IslandFinderPage> createState() => _IslandFinderState();
}

class _IslandFinderState extends State<IslandFinderPage> {
  IslandFinderController islandFinder = IslandFinderController();
  TextEditingController matrixSizeController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    matrixSizeController.text = '2';
    islandFinder.generateMatrix(2);
  }

  @override
  void dispose() {
    matrixSizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: responsive.wp(90),
          height: responsive.hp(75),
          decoration: BoxDecoration(color: Colors.grey[200],
              // shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: const Offset(-0.1, 0.1),
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: const Offset(0.1, -0.1),
                  blurRadius: 2,
                  spreadRadius: 2,
                )
              ]),
          child: Form(
            key: _key,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Islas : ' + islandFinder.numeroDeIslas.toString(),
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                        fontSize: responsive.dp(3)),
                  ),
                  SizedBox(
                    width: responsive.wp(85),
                    height: responsive.hp(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        islandFinder.matrix.length,
                        (i) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              List.generate(islandFinder.matrix.length, (j) {
                            Color color = islandFinder.matrix[i][j] == 1
                                ? Colors.green
                                : Colors.blueAccent[100]!;
                            return SizedBox(
                              width: responsive
                                  .wp(80 / islandFinder.matrix.length),
                              height: responsive
                                  .wp(80 / islandFinder.matrix.length),
                              child: GestureDetector(
                                onTap: () {
                                  if (islandFinder.visited[i][j]) {
                                    islandFinder.matrix[i][j] = 0;
                                  } else {
                                    islandFinder.matrix[i][j] = 1;
                                  }

                                  islandFinder.visited[i][j] =
                                      !islandFinder.visited[i][j];
                                  islandFinder.contarIslas();
                                  setState(() {});
                                },
                                child: Card(
                                  elevation: 5,
                                  color: color,
                                  child: Center(
                                    child: Text(
                                      islandFinder.matrix[i][j].toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: responsive.hp(5),
                  ),
                  SizedBox(
                    width: responsive.wp(50),
                    height: responsive.hp(6),
                    child: TextFormField(
                      controller: matrixSizeController,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "Campo obligatorio";
                        }
                        if (int.parse(text) < 2) {
                          return "Ingrese un n??mero => 2";
                        }
                        if (int.parse(text) > 10) {
                          return "Ingrese un n??mero <= 10";
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.dp(3),
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white60, width: 1.0),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.redAccent, width: 1.0),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.redAccent, width: 1.0),
                          ),
                          errorStyle: TextStyle(
                              color: Colors.redAccent,
                              fontSize: responsive.dp(1.6),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0, color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[400]!),
                        ),
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            islandFinder.generateMatrix(
                                int.parse(matrixSizeController.text));
                            setState(() {});
                          }
                        },
                        child: Text(
                          'BUSCAR',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: responsive.dp(2),
                              fontWeight: FontWeight.bold),
                        )
                        //  Icon(
                        //   Icons.search_rounded,
                        //   size: responsive.dp(5.5),
                        // ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
