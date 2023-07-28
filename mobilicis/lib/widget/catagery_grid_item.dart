import 'package:flutter/material.dart';

class CategoryGridltem extends StatelessWidget {
  const CategoryGridltem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: 200,
                height: 251,
                child: Column(children: [
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
                                text: '                Condition Good',
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
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Bhubaneswar',
                                  style: TextStyle(
                                    // fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: '                  Jul 12th',
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
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: 200,
                height: 251,
                child: Column(children: [
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
                                  text: 'Bhubaneswar',
                                  style: TextStyle(
                                    // fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: '                  Jul 12th',
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
        ],
      ),
    );
  }
}
