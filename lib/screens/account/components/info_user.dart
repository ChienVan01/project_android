import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/account/components/user_provider.dart';
import 'package:provider/provider.dart';

class InfoUser extends StatefulWidget {
  const InfoUser({Key? key}) : super(key: key);

  @override
  State<InfoUser> createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  late UserProfile user;
  // DBConfig db = DBConfig();
  @override
  void initState() {
    super.initState();
    // final user = Provider.of<UserProvider>(context);
    // user.getData();
  }

  // Future refreshNote() async {
  //   user = await db.getUser();
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Container(
        color: primaryColor,
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: FutureBuilder(
            future: user.getData(),
            builder: (context, AsyncSnapshot<UserProfile> snapshot) {
              if (snapshot.hasData) {
                // ignore: unnecessary_null_comparison
                if (snapshot.data!.id == null) {
                  return Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: defaultPadding / 2),
                        child: CircleAvatar(
                          radius: 40,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: const Text('Đăng nhập',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                          ),
                          InkWell(
                            child: const Text('Đăng kí',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: defaultPadding / 2),
                        child: CircleAvatar(
                          radius: 40,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.name.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              }
              return Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: defaultPadding / 2),
                    child: CircleAvatar(
                      radius: 40,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: const Text('Đăng nhập',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                      InkWell(
                        child: const Text('Đăng kí',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                      ),
                    ],
                  ),
                ],
              );
            }));
  }
}
