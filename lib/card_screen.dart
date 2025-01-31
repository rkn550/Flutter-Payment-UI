import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  List<String> title = [
    'Lifeline Card Wallet',
    'Lifeline Coin',
    'CashBack Coin'
  ];

  List<String> description = [
    'Upcoming EMI/Udhar',
    'Lifeline Magic Coin',
    'Add Credit Coin'
  ];
  List<String> date = [
    '',
    '11th Sep 2023 To 11 Oct 2023',
    '11th Sep 2023 To 11 Oct 2023'
  ];

  List<String> price = ['4356', '600', ''];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Card & Wallets',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: RPScustomClipper(),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: width,
                        height: height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.deepPurple[100],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/credit_card.png',
                              width: width * 0.9,
                              height: height * 0.2,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: width / 2,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Card Status : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Inactive',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                          width: width * 0.3,
                          child: buildElevatedButton(text: 'Guide')),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              buildActivateCardWidget(width, height * 0.58),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Wallet',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildContainerList(height, width),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainerList(double height, double width) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: RPScustomClipper(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    height: height * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.deepPurple[200],
                              child: const Icon(Icons.fiber_manual_record,
                                  color: Colors.deepPurple, size: 30),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title[index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  description[index],
                                  style: TextStyle(
                                      color: index == 1
                                          ? Colors.deepPurple
                                          : index == 2
                                              ? Colors.red
                                              : Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                            Column(
                              children: [
                                const Text(
                                  '4356',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  price[index],
                                  style: TextStyle(
                                      color: index == 1
                                          ? Colors.deepPurple
                                          : Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: index != 0,
                              child: Text(
                                date[index],
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ),
                            Visibility(
                              visible: index == 0,
                              child: Container(
                                width: width / 2,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Withdraw',
                                      style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      'Transfer',
                                      style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                      width: width * 0.3,
                      child: buildElevatedButton(text: 'More')),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Widget buildActivateCardWidget(double width, double height) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Activate your LifeLineCard',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₹ 3499/- Life Time',
                      style: TextStyle(
                          color: Colors.purple[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '₹ 9999/Year',
                      style: TextStyle(
                        color: Colors.red, fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration:
                            TextDecoration.lineThrough, // Beech se cut karega
                        decorationThickness: 1, // Line ki motai
                        decorationColor: Colors.red,
                      ),
                    ),
                    const Text(
                      'Offer Ends Soon',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    buildElevatedButton(
                        backgroundColor: Colors.deepPurple,
                        textColor: Colors.white,
                        text: 'Activate Now'),
                  ],
                ),
                SvgPicture.asset('assets/svg_image_6.svg'),
              ],
            ),
            const Divider(color: Colors.grey, thickness: 1),
            const SizedBox(height: 10),
            const Text(
              'Our Features',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildContainerLevel(level: 'Udhar Limit', value: '₹ 74425'),
                const SizedBox(width: 10),
                buildContainerLevel(level: 'CP EMI Limit', value: '₹ 74425'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildContainerLevel2(text: 'Udhar', icon: 'assets/payment.png'),
                const SizedBox(width: 10),
                buildContainerLevel2(text: 'CP EMI', icon: 'assets/hand.png'),
                const SizedBox(width: 10),
                buildContainerLevel2(
                    text: 'Business Funds', icon: 'assets/money.png'),
              ],
            )
          ]),
    );
  }

  Widget buildContainerLevel({required String level, required String value}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1)),
      child: Row(
        children: [
          Text(
            '$level:',
            style: const TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(width: 3),
          Text(
            value,
            style: const TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget buildContainerLevel2({required String text, required String icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
              border: Border.all(color: Colors.grey, width: 1)),
          child: Image.asset(icon, height: 40, width: 40, color: Colors.black),
        ),
        const SizedBox(height: 5),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Widget buildElevatedButton(
      {Color? backgroundColor, Color? textColor, required String text}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.deepPurple[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.deepPurple, width: 1),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            color: textColor ?? Colors.deepPurple,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class RPScustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 2 / 3 - 20, size.height);
    path.quadraticBezierTo(
        size.width * 2 / 3, size.height, size.width * 2 / 3, size.height - 20);
    path.lineTo(size.width * 2 / 3, size.height - 20);
    path.quadraticBezierTo(size.width * 2 / 3, size.height - 50,
        size.width * 2 / 3 + 20, size.height - 50);
    path.lineTo(size.width - 20, size.height - 50);
    path.quadraticBezierTo(
        size.width, size.height - 50, size.width, size.height - 80);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; // Redraw when necessary
  }
}
