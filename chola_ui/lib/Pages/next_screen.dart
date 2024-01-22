import 'package:chola_chariots_ui/Widgets/BackButton.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.1,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        leading: BackButton1(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.2,
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Align(
                    alignment: Alignment(-0.80, -0.80),
                    child: Text(
                      'Chola Cash',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Align(
                    alignment: Alignment(-0.70, -0.70),
                    child: Text(
                      '₹ 100.55',
                      style: TextStyle(
                        color: Color(0xFF141010),
                        fontSize: MediaQuery.of(context).size.width * 0.08,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Align(
                    alignment: Alignment(-0.80, -0.70),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.03,
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
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // Payment Methods
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              // Google Pay
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.09,
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
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.14,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        bottom: 1,
                                        top: 0,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
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
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Text(
                                  'Google Pay\n',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF454545),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Text(
                                  '5% back for Google Pay payments',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0B7C47),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.025,
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
                height: MediaQuery.of(context).size.height * 0.09,
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
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.16,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        bottom: 1,
                                        top: 0,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
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
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Text(
                                  'Master Card\n',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF454545),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.025,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Text(
                                  '****6356',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.025,
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
                height: MediaQuery.of(context).size.height * 0.1,
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
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x11000000),
                                blurRadius:
                                    MediaQuery.of(context).size.width * 0.02,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left:
                                    MediaQuery.of(context).size.width * 0.0186,
                                top:
                                    MediaQuery.of(context).size.height * 0.0149,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.145,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.0464,
                                        bottom: 1,
                                        top: 0,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0965,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  AssetImage('assets/visa.jpg'),
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
                                width:
                                    MediaQuery.of(context).size.width * 0.1589,
                                height:
                                    MediaQuery.of(context).size.height * 0.0343,
                                child: Text(
                                  'Visa\n',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF454545),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.0195,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.445,
                                height:
                                    MediaQuery.of(context).size.height * 0.0343,
                                child: Text(
                                  '****6356',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.0173,
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
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Discount
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.1,
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
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x11000000),
                                blurRadius:
                                    MediaQuery.of(context).size.width * 0.02,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left:
                                    MediaQuery.of(context).size.width * 0.0186,
                                top:
                                    MediaQuery.of(context).size.height * 0.0149,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.145,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.0464,
                                        bottom: 1,
                                        top: 0,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0965,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  AssetImage('assets/dis.jpg'),
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
                                width:
                                    MediaQuery.of(context).size.width * 0.1589,
                                height:
                                    MediaQuery.of(context).size.height * 0.0343,
                                child: Text(
                                  'Discount\n',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF454545),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.0195,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.445,
                                height:
                                    MediaQuery.of(context).size.height * 0.0343,
                                child: Text(
                                  'Vouchers, Promotion',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0B7C47),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.0173,
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
                            icon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

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
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement logic for Done button
                  },
                  child: Text(
                    'DONE',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(250, 189, 29, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.02),
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
