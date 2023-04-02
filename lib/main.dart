import 'dart:convert';
import 'dart:typed_data';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _selectedApp;

  Map<String, dynamic>? getUserSemmar;
  List<dynamic>? dynamicqawert;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUPIList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cashfree SDK Sample'),
        ),
        body: Column(
          children: [
            Center(
              child: GestureDetector(
                child: Text('WEB CHECKOUT'),
                /* onTap: () async {
                    await getUPIList();
                  }*/
                onTap: () => makePayment(),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text('SEAMLESS CARD'),
                onTap: () => seamlessCardPayment(),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text('SEAMLESS NETBANKING'),
                onTap: () => seamlessNetbankingPayment(),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text('SEAMLESS WALLET'),
                onTap: () => seamlessWalletPayment(),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text('SEAMLESS UPI COLLECT'),
                onTap: () => seamlessUPIPayment(),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text('SEAMLESS PAYPAL'),
                onTap: () => seamlessPayPalPayment(),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('UPI INTENT')),
                onTap: () => makeUpiPayment(),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text('GET INSTALLED UPI APPS'),
                onTap: () => getUPIApps(),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text('SEAMLESS UPI INTENT'),
                onTap: () => seamlessUPIIntent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getUPIApps() {
    CashfreePGSDK.getUPIApps().then((value) => {
      if (value != null && value.length > 0)
        {
          _selectedApp = value[2],
          print("call datta"),
          print(_selectedApp["id"]),
        }
      else
        {
          print("call dattanot rec"),
        }
    });
  }

  // WEB Intent
  makePayment() {
    //Replace with actual values
    String orderId = "GZ-212";
    String stage = "TEST";
    String orderAmount = "10";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "31470076b6c755aa35dac07283007413";
    String customerPhone = "6307558161";
    String customerEmail = "savita@gmng.pro";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }

  // SEAMLESS - CARD
  Future<void> seamlessCardPayment() async {
    String orderId = "ORDER_ID";
    String stage = "TEST";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "31470076b6c755aa35dac07283007413";
    String customerPhone = "Customer Phone";
    String customerEmail = "savita@gmng.pro";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl,

      // EXTRA THINGS THAT NEEDS TO BE ADDED
      "paymentOption": "card",
      "card_number": "ENTER CARD NUMBER",
      "card_expiryMonth": "MONTH IN MM format",
      "card_expiryYear": "EXPIRY IN YYYY format",
      "card_holder": "Card Holder Name",
      "card_cvv": "Card CVV"
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }

  // SEAMLESS - NETBANKING
  Future<void> seamlessNetbankingPayment() async {
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "31470076b6c755aa35dac07283007413";
    String customerPhone = "Customer Phone";
    String customerEmail = "savita@gmng.pro";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl,

      // EXTRA THINGS THAT NEEDS TO BE ADDED
      "paymentOption": "nb",
      "paymentCode": "ENTER Code",
      // Find Code here https://docs.cashfree.com/docs/net-banking
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }

  // SEAMLESS - WALLET
  Future<void> seamlessWalletPayment() async {
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "31470076b6c755aa35dac07283007413";
    String customerPhone = "Customer Phone";
    String customerEmail = "savita@gmng.pro";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl,

      // EXTRA THINGS THAT NEEDS TO BE ADDED
      "paymentOption": "wallet",
      "paymentCode": "ENTER Code",
      // Find Code here https://docs.cashfree.com/docs/wallets
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }

  // SEAMLESS - UPI
  Future<void> seamlessUPIPayment() async {
    String orderId = "GZ-212";
    String stage = "TEST";
    String orderAmount = "10";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "Order0001";
    String customerPhone = "6307558161";
    String customerEmail = "savita@gmng.pro";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl,
      "paymentOption": "upi",
      "upi_vpa": "shukla.savita208@okhdfcbank"
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }

  // SEAMLESS - Paypal
  Future<void> seamlessPayPalPayment() async {
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "31470076b6c755aa35dac07283007413";
    String customerPhone = "Customer Phone";
    String customerEmail = "savita@gmng.pro";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl,

      // EXTRA THINGS THAT NEEDS TO BE ADDED
      "paymentOption": "paypal"
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }

  // UPI Intent
  Future<void> makeUpiPayment() async {


    print( _selectedApp["id"]);
    //Replace with actual values
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "31470076b6c755aa35dac07283007413";
    String customerPhone = "Customer Phone";
    String customerEmail = "savita@gmng.pro";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };

    CashfreePGSDK.doUPIPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }

  // SEAMLESS UPI Intent
  Future<void> seamlessUPIIntent() async {
    //Replace with actual values
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "31470076b6c755aa35dac07283007413";
    String customerPhone = "Customer Phone";
    String customerEmail = "savita@gmng.pro";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl,

      // For seamless UPI Intent
      "appName": _selectedApp["id"]
    };

    CashfreePGSDK.doUPIPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }

  Future<void> getUPIList() async {
    dynamicqawert = await CashfreePGSDK.getUPIApps();


    Uint8List _imageBytesDecoded;
    _imageBytesDecoded = Base64Codec().decode(dynamicqawert![0]["icon"]);
    print("call all data");
    print(dynamicqawert);

    print(dynamicqawert.toString());
  }
}
