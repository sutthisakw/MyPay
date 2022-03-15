import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class calPage extends StatefulWidget {
  //const calPage({ Key? key }) : super(key: key);

  @override
  _calPageState createState() => _calPageState();
}

class _calPageState extends State<calPage> {
  TextEditingController totalprice = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController result = TextEditingController();
  int total = 100;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void validatetext() {
    final FormState form = formKey.currentState!;
    if (form.validate()) {}
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/logoMypay.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "คำนวณการผ่อนสินค้า",
                style: TextStyle(
                    fontFamily: 'modsss',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: formKey,
                child: Container(
                  width: 500,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: totalprice,
                        style: TextStyle(
                          fontFamily: 'modsss',
                          fontSize: 16,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'กรุณาระบุราคาสินค้า';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'ราคารวมสินค้าเช่น 3000',
                            border: OutlineInputBorder(),
                            suffixIcon: totalprice.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => totalprice.clear(),
                                  )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: tax,
                        style: TextStyle(
                          fontFamily: 'modsss',
                          fontSize: 16,
                        ),
                        //keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'อัตราดอกเบี้ยต่อเดือนเช่น 0.74',
                            border: OutlineInputBorder(),
                            suffixIcon: tax.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => tax.clear(),
                                  )),
                        validator: (value) => tax.text.isEmpty
                            ? 'กรุณาระบุอัตราดอกเบี้ยต่อเดือน'
                            : null,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: month,
                        style: TextStyle(
                          fontFamily: 'modsss',
                          fontSize: 16,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'จำนวนเดือนที่ต้องการผ่อนเช่น 10',
                            border: OutlineInputBorder(),
                            suffixIcon: month.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => month.clear(),
                                  )),
                        validator: (value) => month.text.isEmpty
                            ? 'กรุณาระบุจำนวนเดือนที่ต้องการผ่อน'
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              ),
              ElevatedButton(
                child: Text("คำนวณ"),

                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[300],
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                //),
                onPressed: () {
                  if (formKey.currentState!.validate()) {}

                  var formatter = NumberFormat('###,###,###.##');
                  var totalpricenum =
                      formatter.format(double.parse(totalprice.text));
                  var cal1 =
                      (double.parse(totalprice.text) * double.parse(tax.text)) /
                          total;
                  var caln1 = formatter.format(cal1);
                  var cal2 =
                      double.parse(totalprice.text) / double.parse(month.text);
                  var cal2n = formatter.format(cal2);
                  var cal3 = cal1 + cal2;
                  var cal4 = formatter.format(cal3);
                  var cal5 = cal1 * double.parse(month.text);
                  var taxnum = formatter.format(cal5);

                  setState(() {
                    AwesomeDialog(
                      //dialogBackgroundColor: Colors.blue,
                        width: 500,
                        context: context,
                        animType: AnimType.TOPSLIDE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.SUCCES,
                        btnOkColor: Colors.blue,
                        showCloseIcon: true,
                        title: 'สรุปการผ่อนชำระ',
                        desc:
                            '\nราคารวมสินค้า $totalpricenum บาท \n\nอัตราดอกเบี้ยต่อเดือน ${tax.text} % \n\nจำนวนเดือนที่ต้องการผ่อน ${month.text} เดือน \n\nจำนวนเงินผ่อนต่อเดือน $cal2n บาท \n\nจำนวนดอกเบี้ยต่อเดือน $caln1 บาท \n\nดอกเบี้ยรวมทั้งสิ้น $taxnum บาท \n\nคุณต้องผ่อนเดือนละ $cal4 บาท',
                        btnOkOnPress: () {},
                        btnOkIcon: Icons.check_circle,
                        buttonsTextStyle:
                            TextStyle(fontSize: 20, fontFamily: 'modsss'),
                        onDissmissCallback: (type) {})
                      ..show();
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                result.text,
                style: TextStyle(fontFamily: 'modsss', fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
