import 'package:flutter/material.dart';
import 'package:pin_generator/storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({key, this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _pinResult = "";
  TextEditingController authCode = TextEditingController();
  TextEditingController refKey = TextEditingController();
  String deneme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deneme = box.read("authKey");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                child: Text(
                  "AUTH KEY: ${deneme}",
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
            /* Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
              child: TextField(
                controller: authCode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: "Auth Code", // pass the hint text parameter here
                  hintStyle: TextStyle(color: Colors.black26),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ), */
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
              child: TextField(
                controller: refKey,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: "Ref Key", // pass the hint text parameter here
                  hintStyle: TextStyle(color: Colors.black26),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _pinResult = getPinCode(deneme, refKey.text);
                  });
                },
                child: const Text("Kod Üret")),
            Text(
              _pinResult,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            /*  ElevatedButton(
                onPressed: () {}, child: const Text("Yeni Giriş Ekle")), */
          ],
        ),
      ),
    );
  }

  String getPinCode(String key, String data) {
    String result = "";
    try {
      String ascList = "";
      for (var i = 0; i <= data.length - 1; i++) {
        String k = key[i];
        String d = data[i];
        ascList += (d.codeUnitAt(0) + k.codeUnitAt(0)).toString();
        ascList = ascList;
      }
      result = ascList.substring(1, 7);
    } catch (e) {
      return result;
    }

    return result;
  }
}
