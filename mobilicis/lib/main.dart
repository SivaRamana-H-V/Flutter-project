import 'package:flutter/material.dart';
import 'package:mobilicis/screen/filter_page.dart';
import 'package:mobilicis/screen/search_page2.dart';
import 'package:mobilicis/screen/drawer_page.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class Pagelndicator extends StatelessWidget {
  const Pagelndicator(
      {super.key, Key? keys, required this.length, required this.currentPage});

  final int length;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 200),
            width: index == currentPage ? 25 : 10,
            height: 10,
            decoration: BoxDecoration(
              color: index == currentPage
                  ? const Color.fromARGB(255, 44, 46, 67)
                  : Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, Key? keys});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> imageNames = [
    'assets/Oppo-Logo.png',
    'assets/OnePlus-bg.jpg',
    'assets/OP.png',
    'assets/oppoAD.png',
  ];
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, size: 40),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        toolbarHeight: 69,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "India",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            iconSize: 23,
            icon: const Icon(Icons.location_pin),
          ),
          Stack(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: const Icon(Icons.notification_add_outlined),
                iconSize: 23,
                onPressed: () {},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 27, top: 4),
              padding: const EdgeInsets.all(0.1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: const Text(
                "3",
                style: TextStyle(
                  color: Color.fromARGB(255, 44, 46, 67),
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ],
        backgroundColor: const Color.fromARGB(255, 44, 46, 67),
        title: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 18),
          width: 70,
          child: const Image(
            image: AssetImage("assets/Logo.png"),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(22),
          child: Container(
            height: 60,
            width: 400,
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            color: const Color.fromARGB(255, 44, 46, 67),
            child: Theme(
              data: ThemeData(primaryColor: Colors.black),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide.none, // Remove the default blue border
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: 'Search with make and model',
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: CustomSearchDelegate([
                            'OnePlus Nord NIOO',
                            'OnePlus Nord CE 2 Lite 5G',
                            'OnePlus Nord 2T',
                            "OnePlus Nord N20 5G",
                            "OnePlus Nord CE 2 56",
                            'OnePlus Nord 2 5G',
                            "OnePlus Nord N200 5G",
                            'OnePlus Nord',
                            'OnePlus Nord CE 5G',
                            'OnePlus Nord CE 3 Lite',
                            'OnePlus Nord NIO 5G',
                            'OnePlus Nord N20 SE',
                          ]));
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: const SimpleDrawer(),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 360,
                height: 20,
                margin: const EdgeInsets.only(
                  top: 8,
                  bottom: 5,
                  right: 275,
                  left: 10,
                ),
                child: const Text(
                  "Buy Top Brands",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                height: 95,
                padding: const EdgeInsets.only(top: 10),
                color: Colors.white70,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 70,
                        width: 90,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: const Center(
                              child: Image(
                                image: AssetImage("assets/Apple.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 70,
                        width: 90,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(0.1),
                            child: const Center(
                              child: Image(
                                image: AssetImage("assets/samsung.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 70,
                        width: 90,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            child: const Center(
                              child: Image(
                                image: AssetImage("assets/MI.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 70,
                        width: 90,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            child: const Center(
                              child: Image(
                                image: AssetImage("assets/Vivo.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 70,
                        width: 90,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            child: const Center(
                              child: Image(
                                image: AssetImage("assets/OnePlus-Logo.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 70,
                        width: 90,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            child: const Center(
                              child: Image(
                                image: AssetImage("assets/Oppo-Logo.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                width: 420,
                height: 210, // Adjust the height as needed
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: imageNames.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imageNames[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Positioned(
                      bottom: 10, // Adjust the position as needed
                      left: 0,
                      right: 0,
                      child: Pagelndicator(
                        length: imageNames.length,
                        currentPage: _currentPage,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 360,
                height: 20,
                margin: const EdgeInsets.only(
                  top: 8,
                  bottom: 5,
                  right: 275,
                  left: 10,
                ),
                child: const Text(
                  "Shop By",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 70,
                            width: 90,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Material(
                              elevation: 1,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                child: const Center(
                                  child: Image(
                                    image: AssetImage("assets/BS.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 70,
                            width: 90,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Material(
                              elevation: 1,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Center(
                                  child: Image(
                                    image: AssetImage("assets/Verified.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 70,
                            width: 90,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Material(
                              elevation: 1,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: const Center(
                                  child: Image(
                                    image: AssetImage("assets/NC.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 70,
                            width: 90,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Material(
                              elevation: 1,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                child: const Center(
                                  child: Image(
                                    image: AssetImage("assets/Waranty.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Bestselling\n',
                                ),
                                TextSpan(
                                  text: 'Mobiles',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 19),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Verified\n',
                                  ),
                                  TextSpan(
                                    text: 'Devices Only',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 19),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Like New\n',
                                  ),
                                  TextSpan(
                                    text: 'Condition',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 19),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Phones with\n',
                                  ),
                                  TextSpan(
                                    text: 'Warranty',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                width: 410,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text: "Best Deals Near You ",
                          ),
                          TextSpan(
                            text: "India",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 183, 0),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: "            Filter",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Add some space between text and icon
                    IconButton(
                      icon: const Icon(Icons.filter_list),
                      iconSize: 35,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.0)),
                          ),
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: const FilterPage(),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1000,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 200,
                          height: 300,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                icon: isFavorite
                                    ? const Icon(Icons.favorite_rounded)
                                    : const Icon(Icons.favorite_border),
                                iconSize: 30,
                                color: Colors.red,
                                onPressed: _toggleFavorite,
                              ),
                            ),
                            const Image(
                              image: AssetImage("assets/List-1.jpg"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '₹ 10,500\n',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Apple Iphone 12\n',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '128 GB',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '             Condition Good',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7),
                                      child: RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Bhubaneswar',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '                Jul 12th',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 200,
                          height: 300,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                            ),
                            const Image(
                              image: AssetImage("assets/List-2.jpg"),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '₹ 7,500\n',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Redmi Note 12 Pro 5G\n',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '128 GB',
                                        style: TextStyle(
                                          // fontSize: 20,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '                Condition Good',
                                        style: TextStyle(
                                          // fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Manipur',
                                            style: TextStyle(
                                              // fontSize: 20,
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '                  Apr 30th',
                                            style: TextStyle(
                                              // fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 200,
                          height: 300,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                            ),
                            const Image(
                              image: AssetImage("assets/List-5.jpg"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '₹ 120,500\n',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Galaxy S22 ultra\n',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '1000 GB',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '           Condition Good',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7),
                                      child: RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Bengaluru',
                                              style: TextStyle(
                                                // fontSize: 20,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '                     Feb 20th',
                                              style: TextStyle(
                                                // fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 200,
                          height: 300,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                            ),
                            const Image(
                              image: AssetImage("assets/List-6.jpg"),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '₹ 12,000\n',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Oppo A2\n',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '128 GB',
                                        style: TextStyle(
                                          // fontSize: 20,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '                Condition Good',
                                        style: TextStyle(
                                          // fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Delhi',
                                            style: TextStyle(
                                              // fontSize: 20,
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '                                 Oct 28th',
                                            style: TextStyle(
                                              // fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 200,
                          height: 300,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                            ),
                            const Image(
                              image: AssetImage("assets/List-3.jpg"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '₹ 6,000\n',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Oppo A9\n',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '128 GB',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '             Condition Good',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7),
                                      child: RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Dhabad',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '                Jun 19th',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 200,
                          height: 300,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                            ),
                            const Image(
                              image: AssetImage("assets/List-4.jpg"),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '₹ 12,500\n',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Galaxy A54 5G\n',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '256 GB',
                                        style: TextStyle(
                                          // fontSize: 20,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '                Condition Good',
                                        style: TextStyle(
                                          // fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Kollam',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '                  Mar 17th',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
