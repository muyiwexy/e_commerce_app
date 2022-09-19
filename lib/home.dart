import 'package:e_commerce_app/pages/login.dart';
import 'package:e_commerce_app/pages/signup.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void signup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Signup()));
  }

  void login() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: InkWell(
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Homepage()));
            },
            child: const Text(
              'Swagga',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0x5AF1F4F8),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            child: FloatingActionButton.extended(
              onPressed: () {
                login();
              },
              extendedPadding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
              label: const Text(
                'Login',
                style:
                    TextStyle(fontFamily: 'Poppins', color: Color(0x5AF1F4F8)),
              ),
              backgroundColor: const Color(0xFF1A1F24),
              elevation: 0,
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () async {
              signup();
            },
            extendedPadding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            label: const Text(
              'Get Started',
              style: TextStyle(fontFamily: 'Poppins', color: Color(0x5AF1F4F8)),
            ),
            backgroundColor: const Color(0xFF1A1F24),
            elevation: 0,
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Material(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1A1F24), Color(0xFFF2A03D)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0.4),
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        signup();
                      },
                      label: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0x5AF1F4F8)
                        ),
                      ),
                      elevation: 0,
                      backgroundColor: const Color(0xC2F2A03D)
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0, -0.59),
                    child: Text(
                      'Welcome to a world of possibilities, Welcome to Swagga!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                            fontFamily: 'Poppins',
                            color: Color(0x5AF1F4F8),
                            letterSpacing: 2,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   Color hexToColor(String code) {
  //     // ignore: unnecessary_new
  //     return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  //   }

  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: hexToColor("#F2A03D"),
  //       leading: Container(
  //         alignment: Alignment.center,
  //         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
  //         child: const Text.rich(
  //           TextSpan(
  //               text: 'Swagga',
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.bold,
  //               )),
  //         ),
  //       ),
  //       actions: [
  //         Container(
  //           //   child:           Align(
  //           //   alignment: Alignment.center,
  //           //   child: FloatingActionButton.extended(
  //           //       onPressed: () {
  //           //       },
  //           //       label: const Text('Signup')),
  //           // ),
  //           padding: const EdgeInsets.all(5),
  //           alignment: Alignment.center,
  //           child: Row(
  //             children: [
  //               FloatingActionButton.extended(
  //                 onPressed: signup,
  //                 elevation: 0,
  //                 label: const Text('signup'),
  //                 backgroundColor: hexToColor("#F2A03D"),
  //               ),
  //               const Padding(padding: EdgeInsets.all(5)),
  //               FloatingActionButton.extended(
  //                 onPressed: login,
  //                 elevation: 0,
  //                 label: const Text('login'),
  //                 backgroundColor: hexToColor("#F2A03D"),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
