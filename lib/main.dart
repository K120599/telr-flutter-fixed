import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:telr_flutter_plugin/response_model.dart';
import 'package:telr_flutter_plugin/telr_payment_gateway.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await TelrPaymentGateway.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Text('Running on: $_platformVersion\n'),
            const SizedBox(height: 10),
            ElevatedButton(
                child: const Text('TelR Submit'),
                onPressed: () async {
                  var responseJson;
                  // Platform messages may fail, so we use a try/catch PlatformException.
                  // We also handle the message potentially returning null.
                  try {
                    responseJson = await TelrPaymentGateway.callTelRForTransaction(
                          store_id: "30059",
                          key: "tkLFk#Hd7t~ZtprB",
                          amount: "20",
                          app_install_id: "123456",
                          app_name: "TelR",
                          app_user_id: "12345",
                          app_version: "1.0.0",
                          sdk_version: "123",
                          mode: "1",
                          tran_type: "sale",
                          tran_cart_id: "1003",
                          desc: "First Transaction",
                          tran_lang: "EN",
                          tran_currency: "SAR",
                          bill_city: "Dubai",
                          bill_country: "AE",
                          bill_region: "Dubai",
                          bill_address: "SIT GTower",
                          bill_first_name: "Groupies ",
                          bill_last_name: "test",
                          bill_title: "Mr",
                          bill_email: "test@test.com",
                          bill_phone: "528636596",
                        ) ??
                        'Unknown Message';

                    // Parse JSON response into AuthResponse object
                    Map<String, dynamic> parsedResponse = jsonDecode(responseJson);
                    AuthResponse authResponse =
                        AuthResponse.fromJson(parsedResponse);

                    // Now you can access properties of authResponse
                    log('Status: ${authResponse.status}');
                    log('Transaction Code: ${authResponse.code}');
                    log('Message: ${authResponse.message}');
                    log('Transaction Reference: ${authResponse.tranref}');

                  } on PlatformException {
                    log("Filed");
                  }
                  
                })
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:telr_flutter/telr_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';

//   @override
//   void initState() { 
//     super.initState();
//   }

//   startPaymentProcess() {
//     var telr = TelrFlutter(
//       configuration: TelrConfiguration(
//         key: "pQ6nP-7rHt@5WRFv",
//         storeId: "15996",
//         email: "girish.spryox@gmail.com",
//         enableSecurity: false,
//         testMode: true,
//       ),
//     );
//     telr.billingAddress = BillingAddress(
//       city: "Dubai",
//       country: "AE",
//       firstName: "Basem",
//       lastName: "Abduallah",
//       line: "236b stree",
//       phoneNumber: "01007898142",
//       region: "Dubai",
//     );
//     telr.makePayment(
//       transaction: Transaction(
//         amount: "2",
//         currency: "AED",
//         language: "en",
//         userId: "123455",
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: startPaymentProcess,
//         ),
//         body: Center(
//           child: Text('Running on: $_platformVersion\n'),
//         ),
//       ),
//     );
//   }
// }
