import 'package:flutter/material.dart';

import '../../../constants.dart';

class TransportUnit extends StatelessWidget {
  const TransportUnit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.emoji_transportation, color: primaryColor),
            title: Text("Đơn Vị Vận Chuyển"),
          ),
          const Divider(thickness: 2, height: 1),
          ListTile(
            minVerticalPadding: 20,
            isThreeLine: true,
            title: const Text("Giao Hàng Nhanh",
                style: TextStyle(
                    height: 1.5, fontWeight: FontWeight.bold, fontSize: 19)),
            subtitle: Text(
                "Nhận hàng vào " +
                    t.day.toString() +
                    "/" +
                    t.month.toString() +
                    "/" +
                    t.year.toString() +
                    "\n(Do ảnh hưởng của Covid-19, thời điểm giao hàng có thể dài hơn dự kiến 1-3 ngày)",
                style: const TextStyle(
                    height: 1.25, fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

final DateTime t = DateTime.now().add(const Duration(days: 40));
