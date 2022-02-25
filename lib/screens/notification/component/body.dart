import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_android/screens/notification/component/notify_provider.dart';

import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

class NotifyBody extends StatefulWidget {
  const NotifyBody({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  _NotifyBodyState createState() => _NotifyBodyState();
}

class _NotifyBodyState extends State<NotifyBody> {
  @override
  void initState() {
    super.initState();
    final notifies = Provider.of<NotifyProvider>(context, listen: false);
    notifies.getNotifyByUserID(
        context, widget.id.toString()); //widget.id.toString()
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotifyProvider>(builder: (context, state, child) {
      return Column(children: <Widget>[
        Container(
            color: backgroundColor, // Tab Bar color change
            child: Column(
              children: const [],
            )),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: state.notifies.length,
            itemBuilder: (context, index) {
              return GFListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return RatingDialog(
                        starSize: 0,
                        enableComment: false,
                        title: Text(
                          state.notifies[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        starColor: primaryColor,
                        message: Text(
                          state.notifies[index].content,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15),
                        ),
                        // your app's logo?
                        submitButtonText: "",
                        onCancelled: () {},
                        onSubmitted: (response) {},
                      );
                    },
                  );
                },
                color: Colors.white,
                avatar: Image.asset("assets/images/logo_chu_s.png",
                    width: 60, height: 60),
                titleText: state.notifies[index].name,
                subTitleText: state.notifies[index].receiveddate.toString(),
                padding: const EdgeInsets.all(defaultPadding / 2),
                margin:
                    const EdgeInsets.only(top: 7.0, bottom: defaultPadding / 4),
              );
            },
          ),
        ),
      ]);
    });
  }
}
