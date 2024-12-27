import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
            icon: Icon(Icons.close)),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 1),
                    bottom: BorderSide(color: Colors.grey, width: 1),
                  ),
                  color: Color(0xffeeeeee)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.face, size: 35),
                      ),
                      SizedBox(width: 8),
                      Text('이름 들어갈 곳',
                          style: TextStyle(
                              color: Color(0xff2F3FA3),
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.settings),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      '메시지 도착 알림 설정',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoSwitch(
                      value: _isChecked,
                      activeTrackColor: Color(0xffDEEFFF),
                      thumbColor: _isChecked ? Color(0xff2F3FA3) : Colors.grey,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(124.0,20.0,124.0,20.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )
                ),
                onPressed: () {},
                child: Text(
                  '개인정보처리방침',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                )
            ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,0,15.0,15.0),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100.0,20.0,100.0,20.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      )
                  ),
                  onPressed: () {},
                  child: RichText(
                    textAlign: TextAlign.center,
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: '서비스 및 장애센터',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                      ),
                      TextSpan(
                        text: '053-472-2110',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                      ),
                    ]
                  )
                  )
              ),
            ),

            Container(
              child: SvgPicture.asset(
                  'assets/images/mypage_card.svg',
              width: 380,)
            )
          ],
        ),
      ),
    );
  }
}
