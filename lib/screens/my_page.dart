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
                  color: Colors.grey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.face, size: 30),
                      ),
                      SizedBox(width: 8),
                      Text('이름 들어갈 곳',
                          style: TextStyle(
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.bold)),
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
                  top: BorderSide(color: Colors.grey, width: 1),
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '메시지 도착 알림 설정',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  ),
                  CupertinoSwitch(
                    value: _isChecked,
                    activeTrackColor: CupertinoColors.inactiveGray,
                    thumbColor: CupertinoColors.activeBlue,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(110.0,20.0,110.0,20.0),
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
