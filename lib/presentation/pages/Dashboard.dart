import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_touch/Providers/HomeProvider.dart';

import 'package:one_touch/presentation/common/SearchBox.dart';

import 'package:one_touch/presentation/common/TitleBarHome.dart';
import 'package:one_touch/presentation/pages/Notifications.dart';

import 'package:one_touch/presentation/components/Categories.dart';
import 'package:one_touch/presentation/components/DrawerComponent.dart';
import 'package:one_touch/presentation/components/HomeSlider.dart';
import 'package:one_touch/presentation/components/MainMenu.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController _controller = PageController();
@override
  initState() {
    super.initState();
    var data =
        Provider.of<HomeProvider>(context, listen: false).getCategories();
  }
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context);
    
    return Scaffold(
      // appBar: AppBar(),
      drawer: Drawer(
        child: DrawerComponent(),
      ),
      body: 
        data.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xff39C7A5),
                ),
              )
            :
           RefreshIndicator(
              onRefresh: <Null>() async {
                // data.fetchCategories();
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleBarHome(),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, top: 10),
                          child: Row(children: [
                            const Text(
                              "Hello,",
                              style: TextStyle(
                                  color: Color(0xff1C1D20),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              " John",
                              style: TextStyle(
                                  color: Color(0xff1C1D20),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700),
                            )
                          ]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, bottom: 16),
                          child: Text(
                            "Lorem ipsum dolor sit amet",
                            style: TextStyle(color: Color(0xff999DA0)),
                          ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        const SearchBox(),
                        const SizedBox(
                          height: 35,
                        ),
                        Container(
                            height: 140,
                            // width: 200,
                            child: HomeSlider(controller: _controller)),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: _controller,
                            count: data.homePageData.offers.length,
                            effect: WormEffect(
                              dotHeight: 6,
                              dotWidth: 6,
                              activeDotColor: Color(0xff39C7A5),
                              type: WormType.thin,
                              // strokeWidth: 5,
                            ),
                          ),
                        ),
                        // Image.asset("assets/images/banner.png"),
                        SizedBox(
                          height: 30,
                        ),
                        MainMenu(),

                        Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 20),
                            child: Text("Categories",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500))),
                        Categories()
                      ]),
                ),
              ),
            ),
    );
  }
}
