import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/Providers/MainProvider.dart';
import 'package:one_touch/presentation/common/SearchBox.dart';
import 'package:one_touch/presentation/common/TitleBar.dart';
import 'package:one_touch/presentation/components/ClassifiedsCard.dart';
import 'package:provider/provider.dart';

class Classifieds extends StatefulWidget {
  const Classifieds({Key? key}) : super(key: key);

  @override
  State<Classifieds> createState() => _ClassifiedsState();
}

class _ClassifiedsState extends State<Classifieds> {
  @override
  void initState() {
    super.initState();

    Provider.of<HomeProvider>(context, listen: false).getClassifieds();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context);

    return Scaffold(
      body:data.isLoading?Center(child: CircularProgressIndicator(color: Color(0xff39C7A5),),): SingleChildScrollView(
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
              ...data.classifieds.items.map((e)=>  ClassifiedsCard(item: e),),
            
            ]),
          )
        ],
      )),
    );
  }
}
