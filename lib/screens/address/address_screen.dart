import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class ChooseAddressScreen extends StatelessWidget {
  const ChooseAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 30.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.navigate_before_outlined, size: 30)),
          title:
              const Text("Chọn Địa Chỉ Giao Hàng", textAlign: TextAlign.center),
          backgroundColor: primaryColor,
        ),
        body: const _AddressScreen(),
      ),
    );
  }
}

class _AddressScreen extends StatefulWidget {
  const _AddressScreen({Key? key}) : super(key: key);

  @override
  State<_AddressScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_AddressScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _address.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: const EdgeInsets.only(bottom: 10),
                leading: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: primaryColor,
                ),
                title: Align(
                  child: Column(
                    children: [
                      Text(
                          _address[index].name +
                              ' | ' +
                              _address[index].phoneNumber,
                          style: const TextStyle(
                              height: 2,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Text(_address[index].address,
                          style: const TextStyle(
                              height: 2,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ],
                  ),
                  alignment: const Alignment(-1.2, 0),
                ),
                selectedTileColor: Colors.grey[200],
                selected: index == _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              minimumSize: const Size.fromHeight(52),
            ),
            child: const Center(
              child: Text(
                'Đồng Ý',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

class Address {
  String name;
  String phoneNumber;
  String address;
  Address({
    required this.name,
    required this.phoneNumber,
    required this.address,
  });
}

final List<Address> _address = [
  Address(
      name: "Trương Văn Chiến",
      phoneNumber: "0326465173",
      address: "141 Tám Danh, phường 4, quận 8, TP Hồ Chí Minh"),
  Address(
      name: "Trương Văn Chiến",
      phoneNumber: "0326465173",
      address: "341 Tám Danh, phường 5, quận 8, TP Hồ Chí Minh"),
  Address(
      name: "Trương Văn Chiến",
      phoneNumber: "0326465173",
      address: "41 Tám Danh, phường 6, quận 8, TP Hồ Chí Minh"),
];
