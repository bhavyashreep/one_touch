import 'package:flutter/material.dart';
import 'package:one_touch/Providers/MainProvider.dart';
import 'package:one_touch/presentation/common/SearchBox.dart';
import 'package:one_touch/presentation/common/TitleBar.dart';
import 'package:one_touch/presentation/components/ClassifiedsCard.dart';
import 'package:provider/provider.dart';

class Classifieds extends StatelessWidget {
  const Classifieds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MainProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TitleBar(title: "Classifieds"),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: SearchBox(),
              ),
              ClassifiedsCard(item: {}),
              ClassifiedsCard(item: {}),
              ClassifiedsCard(item: {}),

            ]),
          )
        ],
      )),
    );
  }
}
