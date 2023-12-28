import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        leading: ElevatedButton(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 140,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.97, -0.25),
                  end: Alignment(0.97, 0.25),
                  colors: [
                    Color(0xBC6D7C83),
                    Color(0xB86E7D83),
                    Color(0xB86E7D83),
                    Color(0xB86E7D83),
                    Color(0xB86E7D83),
                    Color(0xB86E7D83),
                    Color(0xB86E7D83),
                    Color(0xB86E7D83),
                    Color(0xB86E7D83),
                    Color(0xB86E7D83),
                    Color(0x008E9699),
                    Color(0x008E9699)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment(-0.80, -0.80),
                    child: Text(
                      'Chola Cash',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment(-0.70, -0.70),
                    child: Text(
                      '₹ 100.55',
                      style: TextStyle(
                        color: Color(0xFF141010),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment(-0.80, -0.70),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 27,
                      padding: const EdgeInsets.all(0),
                      decoration: ShapeDecoration(
                        color: Color(0xFF151513),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '+  Gift card',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Roboto Flex',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            // Payment Methods
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //google pay
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 69,
                  decoration: ShapeDecoration(
                    color: Color(0x00D9D9D9),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0x26999999)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 55,
                            height: 42,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x11000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 1.86,
                                  top: 1.49,
                                  child: Container(
                                    width: 52.29,
                                    height: 30,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 16.64,
                                          bottom: 1,
                                          top: 0,
                                          child: Container(
                                            width: 35.65,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/google.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 72.61,
                                  height: 22.28,
                                  child: Text(
                                    'Google pay\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF454545),
                                      fontSize: 13,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 22.28,
                                  child: Text(
                                    '5% back for google pay payment’s',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0B7C47),
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Mastercard
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 69,
                  decoration: ShapeDecoration(
                    color: Color(0x00D9D9D9),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0x26999999)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 55,
                            height: 42,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x11000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 1.86,
                                  top: 1.49,
                                  child: Container(
                                    width: 62.29,
                                    height: 30,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 16.64,
                                          bottom: 1,
                                          top: 0,
                                          child: Container(
                                            width: 30.65,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/mastercard.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 72.61,
                                  height: 22.28,
                                  child: Text(
                                    'Master Card\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF454545),
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 22.28,
                                  child: Text(
                                    '****6356',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Visa
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 69,
                  decoration: ShapeDecoration(
                    color: Color(0x00D9D9D9),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0x26999999)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 55,
                            height: 42,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x11000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 1.86,
                                  top: 1.49,
                                  child: Container(
                                    width: 52.29,
                                    height: 30,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 16.64,
                                          bottom: 1,
                                          top: 0,
                                          child: Container(
                                            width: 35.65,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/visa.jpg'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 72.61,
                                  height: 22.28,
                                  child: Text(
                                    'Visa\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF454545),
                                      fontSize: 13,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 22.28,
                                  child: Text(
                                    '****6356',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Discount
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 69,
                  decoration: ShapeDecoration(
                    color: Color(0x00D9D9D9),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0x26999999)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 55,
                            height: 42,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x11000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 1.86,
                                  top: 1.49,
                                  child: Container(
                                    width: 52.29,
                                    height: 30,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 16.64,
                                          bottom: 1,
                                          top: 0,
                                          child: Container(
                                            width: 35.65,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/dis.jpg'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 72.61,
                                  height: 22.28,
                                  child: Text(
                                    'Discount\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF454545),
                                      fontSize: 13,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 22.28,
                                  child: Text(
                                    'Vouchers,Promotion',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0B7C47),
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_drop_down)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Add Payment Method
            TextButton(
              onPressed: () {},
              child: Text('Add Payment Method'),
            ),
            // Spacer to push the "Done" button to the bottom
            Spacer(),
            // Done Button
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement logic for Done button
                  },
                  child: Text(
                    'DONE',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(250, 189, 29, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
