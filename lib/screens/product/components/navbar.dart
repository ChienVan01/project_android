import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_android/constants.dart';

// Widget navBar() {
//   return Container(
//     padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
//     height: 30,
//     color: primaryColor,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       // crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ElevatedButton(
//           onPressed: () {},
//           child: Row(
//             children: const [
//               Text(
//                 'Sắp xếp',
//                 style: TextStyle(fontSize: 18, color: backgroundColor),
//               ),
//               Icon(Icons.arrow_drop_down, color: backgroundColor, size: 30),
//             ],
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           child: Row(
//             children: const [
//               Text(
//                 'Bộ lọc',
//                 style: TextStyle(fontSize: 18, color: backgroundColor),
//               ),
//               Icon(Icons.filter_alt_outlined, color: backgroundColor, size: 23)
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String dropdownValue = 'Sắp xếp';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
      // height: 30,
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: backgroundColor,
            ),
            underline: Container(
              height: 0,
            ),
            iconSize: 26,
            isDense: true,
            elevation: 20,
            borderRadius: BorderRadius.circular(10),
            dropdownColor: primaryColor,
            style: const TextStyle(color: backgroundColor, fontSize: 18),
            alignment: AlignmentDirectional.topStart,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              'Sắp xếp',
              'Giá (thấp - cao)',
              'Giá (cao - thấp)',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: defaultPadding / 4),
                  child: Text(
                    'Bộ lọc',
                    style: TextStyle(fontSize: 18, color: backgroundColor),
                  ),
                ),
                SvgPicture.asset(
                  'assets/svg/filter.svg',
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
