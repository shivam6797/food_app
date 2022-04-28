import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/colors.dart';
import 'package:food_ordering_app/provider/checkout_provider.dart';
import 'package:food_ordering_app/widget/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddDeliverAddress extends StatefulWidget {
  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloadding == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              labText: "First name",
              controller: checkoutProvider.firstName,
            ),
            CostomTextField(
              labText: "Last name",
              controller: checkoutProvider.lastName,
            ),
            CostomTextField(
              labText: "Mobile No",
              controller: checkoutProvider.mobileNo,
            ),
            CostomTextField(
              labText: "Alternate Mobile No",
              controller: checkoutProvider.alternateMobileNo,
            ),
            CostomTextField(
              labText: "Scoiety",
              controller: checkoutProvider.scoiety,
            ),
            CostomTextField(
              labText: "Street",
              controller: checkoutProvider.street,
            ),
            CostomTextField(
              labText: "Landmark",
              controller: checkoutProvider.landmark,
            ),
            CostomTextField(
              labText: "City",
              controller: checkoutProvider.city,
            ),
            CostomTextField(
              labText: "Aera",
              controller: checkoutProvider.aera,
            ),
            CostomTextField(
              labText: "Pincode",
              controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CostomGoogleMap(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLoaction == null? const Text("Set Loaction"):
                    const Text("Done!"),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: const Text("Home"),
              onChanged: (value) {
                setState(() {
                  myType = value as dynamic;
                });
              },
              secondary: Icon(
                Icons.home,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: const Text("Work"),
              onChanged: (value) {
                setState(() {
                  myType = value as dynamic;
                });
              },
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: const Text("Other"),
              onChanged: (value) {
                setState(() {
                  myType = value as dynamic;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}