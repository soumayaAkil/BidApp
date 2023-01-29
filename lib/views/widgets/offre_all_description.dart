import 'package:flutter/material.dart';


class DescriptionAllDetail extends StatelessWidget {
  const DescriptionAllDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Text("app bar"),

            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(

//image
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "chant avec de magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors d"
              "chant avec de magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors d"
              "chant avec de magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors d"
              "chant avec de magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors d"
              "chant avec de magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors d"
            ,style: TextStyle(color: Colors.black),),
          )
        ],
      ),
    );
  }
}
