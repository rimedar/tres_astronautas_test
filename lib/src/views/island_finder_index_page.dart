import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tres_astronautas_test/src/utils/responsive.dart';
import 'package:tres_astronautas_test/src/views/island_finder/island_finder_controller.dart';

import 'island_finder_index_controller.dart';

class IslandFinderIndexPage extends StatefulWidget {
  const IslandFinderIndexPage({Key? key}) : super(key: key);

  @override
  State<IslandFinderIndexPage> createState() => _IslandFinderState();
}

class _IslandFinderState extends State<IslandFinderIndexPage> {
  IslandFinderIndexController islandFinderIndexController =
      IslandFinderIndexController();

  final GlobalKey<FormState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return DefaultTabController(
      length: islandFinderIndexController.optionList.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: List.generate(
              islandFinderIndexController.optionList.length,
              (index) => Tab(
                icon: Text(
                  islandFinderIndexController.optionList[index]['option'],
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
          title: const Text(
            'Buscador de Islas',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: TabBarView(
          children: List.generate(islandFinderIndexController.optionList.length,
              (index) => islandFinderIndexController.optionList[index]['page']),
        ),
      ),
    );
  }
}
