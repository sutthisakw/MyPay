import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
          Center(
            child: Column(
              children: [
                Container(
                  //margin: EdgeInsets.fromLTRB(left, top, right, bottom)
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                  height: 90,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage('assets/devperman.png'), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  "แอพนี้พัฒนาด้วย FLUTTER\nผู้พัฒนา Mr. Sutthisak Wimolrat\n\n''ขอบคุณทุกๆท่านที่โหลดแอพนี้มาใช้งาน\nโปรดบอกเราหากมีข้อเสนอแนะหรือความต้องการให้เราพัฒนาแอพพลิเคชั่นให้ดียิ่งขึ้น''",
                  style: TextStyle(
                    fontFamily: 'modsss',
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(onPressed: (){},
                  icon: Icon(Icons.email_outlined), label: Text('swimolrat@hotmail.com',
                  style: TextStyle(fontFamily: 'modsss',fontSize: 14),))
              ],
            ),
          ),
      ]),
    );
  }
}
