// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class SpecificationsInfo {
  String config, info;
  SpecificationsInfo({required this.config, required this.info});
}

final List<SpecificationsInfo> _specifications = [
  SpecificationsInfo(
    config: 'Thương hiệu',
    info: 'Dell',
  ),
  SpecificationsInfo(
    config: 'Series laptop',
    info: 'Alienware',
  ),
  SpecificationsInfo(
    config: 'Mô tả bảo hành',
    info: 'Bảo hành 12 tháng với pin và phụ kiện',
  ),
  SpecificationsInfo(
    config: 'Part-number',
    info: 'P109F001',
  ),
  SpecificationsInfo(
    config: 'Thế́ hệ CPU',
    info: 'Core i7 , Intel Core thế hệ thứ 11',
  ),
  SpecificationsInfo(
    config: 'CPU',
    info:
        'Intel Core i7-11800H ( 2.3 GHz - 4.6 GHz / 24MB / 8 nhân, 16 luồng )',
  ),
  SpecificationsInfo(
    config: 'Chip đồ họa',
    info: 'NVIDIA GeForce RTX 3060 6GB GDDR6 / Intel UHD Graphics',
  ),
  SpecificationsInfo(
    config: 'RAM',
    info: '2 x 16GB DDR4 3200MHz ( 2 Khe cắm / Hỗ trợ tối đa 64GB )',
  ),
  SpecificationsInfo(
    config: 'Màn hình',
    info:
        '15.6" ( 2560 x 1440 ) Quad HD (2K) WVA 240Hz , không cảm ứng , HD webcam',
  ),
  SpecificationsInfo(
    config: 'Lưu trữ',
    info: '1TB SSD M.2 NVMe /',
  ),
  SpecificationsInfo(
    config: 'Số cổng lưu trữ tối đa',
    info: '2 x M.2 NVMeMSI',
  ),
  SpecificationsInfo(
    config: 'Kiểu khe M.2 hỗ trợ',
    info: 'M.2 NVMe',
  ),
  SpecificationsInfo(
    config: 'Cổng xuất hình',
    info: '1 x HDMI',
  ),
  SpecificationsInfo(
    config: 'Cổng kết nối',
    info: '3 x USB 3.2 , 1 x Thunderbolt 4 , LAN 1 Gb/s',
  ),
  SpecificationsInfo(
    config: 'Kết nối không dây',
    info: 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0',
  ),
  SpecificationsInfo(
    config: 'Bàn phím',
    info: 'thường , không phím số , RGB',
  ),
  SpecificationsInfo(
    config: 'Hệ điều hành',
    info: 'Windows 10 Home 64-bit',
  ),
  SpecificationsInfo(
    config: 'Kích thước',
    info: '35.6 x 27.75 x 1.29 ~ 1.92 cm',
  ),
  SpecificationsInfo(
    config: 'Pin',
    info: '6 cell 86 Wh , Pin liền',
  ),
  SpecificationsInfo(
    config: 'Khối lượng',
    info: '2.7 kg',
  ),
];

final List<Widget> SpecificationsWidget = _specifications
    .map((e) => Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 160,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Text(
                  e.config,
                  style: style,
                ),
              ),
            ),

            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Text(
                  e.info,
                  style: style,
                ),
              ),
            ),
            // Text('MSI'),
          ],
        ))
    .toList();

const TextStyle style = TextStyle(
  fontSize: 18,
  color: primaryTextColor,
);

class Specifications extends StatelessWidget {
  const Specifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding / 2),
      color: Colors.white,
      // height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              'Thông số kỹ thuật',
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Divider(color: Colors.grey),
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: SpecificationsWidget,
            ),
          )
        ],
      ),
    );
  }
}

// Widget myListView(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.all(defaultPadding),
//     child: ListView.builder(
//       itemCount: _specifications.length,
//       itemBuilder: (context, index) {
//         return Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             SizedBox(
//               width: 160,
//               child: Text(
//                 _specifications[index].config,
//                 style: style,
//               ),
//             ),
//             Text(
//               _specifications[index].info,
//               style: style,
//             ),
//             // Text('MSI'),
//           ],
//         );
//       },
//     ),
//   );
// }
