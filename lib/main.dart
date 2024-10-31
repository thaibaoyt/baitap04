import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyBaiTap());
}

class MyBaiTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: BaiTapHomePage());
  }
}

class BaiTapHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BaiTapHomePageSate();
  }
}

class BaiTapHomePageSate extends State<BaiTapHomePage> {
  num kqTinh = 0;
  String so1 = '';
  String so2 = '';
  String songuyen='';
  String ketquakiemtra='';
  String sont="";
  String kqCheck="";
  String soNhap = '';
  bool isNguyenTo(num n) {
    if (n < 2) return false;
    for (num i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Bài tập 3'),
        ),
        body: Center(
          child: Column(

            children: [
              TextField(
                  onChanged: (text) {
                    songuyen = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nhap so nguyen :')),
              ElevatedButton(onPressed:() {
                try {
                  int number = int.parse(songuyen);
                  ketquakiemtra = '$songuyen là một số nguyên.';
                } catch (e) {
                  ketquakiemtra = '$songuyen không phải là một số nguyên hay nhap lai.';
                }
                setState(() {});

              }, child: Text("Kiểm tra số nguyên")),
              Text(
                "$ketquakiemtra",
                style: TextStyle(backgroundColor: Colors.orange, fontSize: 15),
              ),SizedBox(height: 30,),
              Text(
                'Kết quả tính: $kqTinh',
                style: TextStyle(backgroundColor: Colors.yellow, fontSize: 20),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                        onChanged: (text) {
                          so1 = text;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Nhập Số A:'),
                      )),
                  SizedBox(width: 20),
                  Expanded(
                      child: TextField(
                          onChanged: (text) {
                            so2 = text;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Nhập Số B:')))

                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 100),
                  ElevatedButton(
                      onPressed: () {
                        kqTinh = num.parse(so1) + num.parse(so2);
                        setState(() {});
                      },
                      child: Text('+')),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        kqTinh = num.parse(so1) - num.parse(so2);
                        setState(() {});
                      },
                      child: Text('-')),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        kqTinh = num.parse(so1) * num.parse(so2);
                        setState(() {});
                      },
                      child: Text('*')),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        double kq = num.parse(so1) / num.parse(so2);
                        kqTinh = num.parse(kq.toStringAsFixed(2));
                        setState(() {});
                      },
                      child: Text('/'))
                ],
              ),
              TextField(
                  onChanged: (text) {
                    soNhap = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nhập số cần check số nguyên tố:')),
              ElevatedButton(onPressed:() {
                bool kq = false;
                kq = isNguyenTo(num.parse(soNhap));
                if (kq)
                  kqCheck = '${num.parse(soNhap)} là  số  nguyen   to';
                else
                  kqCheck =
                  '${num.parse(soNhap)} khong phai so nguyen to';
                String message = kqCheck;

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(message)));
                setState(() {});


              }, child: Text("Kiem tra snt")),



            ],

          ),
        ));
  }
}
