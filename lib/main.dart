import 'package:flutter/material.dart';
import 'package:mypay/pages/about.dart';
import 'package:mypay/pages/calpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //ปรับแต่ง default font
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'modsss',
              fontSizeFactor: 1.1,
              fontSizeDelta: 2.0,
            ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [calPage(), About()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "แอพคำนวณการผ่อนสินค้า",
            style: TextStyle(fontFamily: 'modsss', fontSize: 20),
          ),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: 'คำนวณ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_support), label: 'เกี่ยวกับเรา'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
