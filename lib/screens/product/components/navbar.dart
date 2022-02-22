import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/product/components/product_provider.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
// @override
//   void initState() {
//     super.initState();
//     if (widget.id == '') {
//       final products = Provider.of<ProductProvider>(context, listen: false);
//       products.getProduct(context);
//     } else {
//       final products = Provider.of<ProductProvider>(context, listen: false);
//       products.getProductbyProductType(context, widget.id);
//     }
//     widget.nameProduct;
//   }

  String dropdownValue = 'Sắp xếp';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          bottom: defaultPadding / 2),
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
                print('filter: $newValue');
                if (newValue == 'Sắp xếp') {
                  final products =
                      Provider.of<ProductProvider>(context, listen: false);
                  products.getProduct(context);
                }
                if (newValue == 'Giá (thấp - cao)') {
                  final products =
                      Provider.of<ProductProvider>(context, listen: false);
                  products.getProductByFliterByPriceAsc(context);
                }
                if (newValue == 'Giá (cao - thấp)') {
                  final products =
                      Provider.of<ProductProvider>(context, listen: false);
                  products.getProductByFliterByPriceDesc(context);
                }
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
          InkWell(
            onTap: () {},
            // style: ButtonStyle(
            //   shadowColor: MaterialStateProperty.all(Colors.transparent),
            // ),
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
          ),
        ],
      ),
    );
  }
}
