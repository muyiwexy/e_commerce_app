import 'package:e_commerce_app/auth/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mainhomepage extends StatefulWidget {
  const Mainhomepage({super.key});

  @override
  State<Mainhomepage> createState() => _MainhomepageState();
}

class _MainhomepageState extends State<Mainhomepage> {
  
  // Authenticate state = Provider.of<Authenticate>(context, listen: false);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: 
      AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: InkWell(
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Mainhomepage()));
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
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<Authenticate>(
              builder: (context, state, child) {
                if (!state.isLoggedin) return const Text( "welcome,{state.user?.name ??}"  );
                return Text(
                  state.user?.name ?? ''
                );
              },)
            ),
          )
        ],
        // actions: [
        //   Expanded(
        //     child: Consumer<Authenticate>(
        //       builder: (context, state, child) {
        //         if (!state.isLoggedin) return Container();
        //         return Text(
        //           state.user?.name ?? ''
        //         );
        //       },)
        //   )
        // ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<Authenticate>(
        builder: (context, state, child) {
          if (!state.isLoggedin) return Container();
          return ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              Center(
                child: Text(
                  state.user?.name ?? '',
                  style: TextStyle(
                    color: Colors.black,
                  )
                ),
              )
            ]
          );
        },
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
