import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:creative_chaos_test/style/theme.dart' as Style;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Ajman';
  int _selectedIndex;
  List<String> _options = ['Woolha', 'Flutter', 'Dart'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _mainWidget()),
    );
  }

  Widget _mainWidget() {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                "assets/images/top_image.jpg",
              ),
            ),
            topCategories(),
            mostSelling(),
            shopByBrand(),
            allProducts(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        Container(
          height: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              gradient: LinearGradient(begin: Alignment.centerLeft,
                  // stops: [0.1, 0.9],
                  // tileMode: TileMode.repeated,
                  colors: [
                    Style.Colors.gradientShade1,
                    Style.Colors.gradientShade2
                  ])),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Image.asset(
                          "assets/images/top_logo.png",
                          height: 70,
                          width: 70,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search here...",
                                hintStyle:
                                    TextStyle(color: Style.Colors.titleColor),
                                suffixIcon: IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.search),
                                ),
                                fillColor: Color(0xFFFFFFFF),
                                filled: true,
                                border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(50),
                                    ),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Delivery Location",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        dropdownColor: Colors.grey,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.white70),
                        underline: Container(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Ajman',
                          'Karachi',
                          'Lahore',
                          'Islamabad'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget topCategories() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Top Categories",
          style: TextStyle(
              color: Style.Colors.gradientShade1,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return topCategoryItem();
              }),
        )
      ],
    );
  }

  Widget topCategoryItem() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5, left: 5),
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("assets/images/drinks.jpg"),
                  fit: BoxFit.cover)),
          child: Container(
            color: Colors.black38,
          ),
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.center,
          child: Text(
            "Drinks",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ))
      ],
    );
  }

  Widget mostSelling() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Most Selling",
          style: TextStyle(
              color: Style.Colors.gradientShade1,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return mostSellingItem();
              }),
        )
      ],
    );
  }

  Widget mostSellingItem() {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5),
      width: 150,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey[400],
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/grocery.png",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(
                        color: Colors.grey[400],
                      ),
                      right: BorderSide(
                        color: Colors.grey[400],
                      ),
                      bottom: BorderSide(
                        color: Colors.grey[400],
                      ),
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Text(
                            "Super Cookies Biscuit 1x18 PCsPCsPCsPCsPCs"
                                .toUpperCase(),
                            style: TextStyle(
                                color: Style.Colors.gradientShade1,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "AED 12.25",
                          style: TextStyle(
                              color: Style.Colors.orage,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: Container(
                                  margin: EdgeInsets.all(4),
                                  child: _mostSellingOption())),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 14,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Style.Colors.orage)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.remove),
                    ),
                    Expanded(
                        child: Text(
                      "0",
                      textAlign: TextAlign.center,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.add),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget _mostSellingOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: option()),
        Expanded(child: option()),
        Expanded(child: option())
      ],
    );
  }

  Widget option() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey[400])),
        child: Text(
          "Card Place Holder",
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(fontSize: 8),
        ),
      ),
    );
  }

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        labelPadding: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        label: Text(_options[i],
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(color: Style.Colors.titleColor)),
        pressElevation: 5,
        selectedColor: Style.Colors.gradientShade1,
        backgroundColor: Colors.transparent,
        shape: StadiumBorder(side: BorderSide(color: Colors.grey[400])),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(Center(child: choiceChip));
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      children: chips,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget shopByBrand() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Shop by Brand",
          style: TextStyle(
              color: Style.Colors.gradientShade1,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return shopByBrandItem();
              }),
        )
      ],
    );
  }

  Widget shopByBrandItem() {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5),
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage("assets/images/brand.png"), fit: BoxFit.cover)),
    );
  }

  Widget allProducts() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/images/all_items.png",
              fit: BoxFit.cover,
            ),
          );
        });
  }

  Widget _allProductsItem() {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5),
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage("assets/images/all_items.png"),
              fit: BoxFit.cover)),
    );
  }
}
