import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';

class InfoUser extends StatelessWidget {
  const InfoUser({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      color: primaryColor,
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: Row(
        children: [
         const Padding(
            padding:  EdgeInsets.only(right: defaultPadding / 2),
            child:  CircleAvatar(
              radius: 40,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              // Text(
              //   ("Mẫn Trần"),
              //   style: TextStyle(color: Colors.white, fontSize: 25.0),
              // ),
              // Text(
              //   "0962455419",
              //   style: TextStyle(color: Colors.white, fontSize: 20.0),
              // )
              InkWell(
                child: const Text('Đăng nhập',style: TextStyle(color: Colors.white,)),
                onTap: (){
                  Navigator.pushNamed(
                    context,'/login'
                  );
                },
              ),
              InkWell(
                child: const Text('Đăng kí',style: TextStyle(color: Colors.white,)),
                onTap: (){
                    Navigator.pushNamed(
                    context,'/register'
                  );
                },
              ),
              
            ],
          ),
        ],
      ));
  }
}
