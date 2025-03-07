import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawercenter.dart';
import 'package:pickandgo/services/routingpage.dart';
import '../../databasehelper.dart';


class AddPackagesDropOffDriver extends StatefulWidget {
  //const AddPackagesDropOffDriver({Key? key}) : super(key: key);

  String id;
  String driverid;
  String? operationalcenterid;
  String? email;
  String? name;
  String? mobile;
  String? address;
  String? status;

  AddPackagesDropOffDriver(
  this.id,
  this.operationalcenterid,
  this.driverid,
  this.name,
  this.email,
  this.mobile,
  this.address,
  this.status,);



  @override
  _AddPackagesDropOffDriverState createState() => _AddPackagesDropOffDriverState();
}


class _AddPackagesDropOffDriverState extends State<AddPackagesDropOffDriver> {
  DatabaseHelper _db = DatabaseHelper();
  final controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      drawer: NavigationDrawerWidgetCenter(widget.id, widget.operationalcenterid, widget.name, widget.email!,
          widget.mobile!, widget.status!, widget.address!, widget.driverid),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('PickandGO - Operational Center'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),

          Padding(
            padding: EdgeInsets.all(1),
            child: Text(
              'Package Details',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          TextField(
            controller: controllers,
            decoration: InputDecoration(
              labelText: "Package ID..",
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 8.0, top: 15.0),
              enabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.black),
                borderRadius: new BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.black),
                borderRadius: new BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          MaterialButton(
              minWidth: 160,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              onPressed: () {
                // //assign the package id into a list
                // var list = [controllers.text];
                // FirebaseFirestore.instance
                //     .collection('users')
                // //pass the driver id to know which document/record to update
                //     .doc(widget.driverid)
                // //update method
                //     .update({
                //   //add the details inside the packages/orders array
                //   "packages": FieldValue.arrayUnion(list)
                // });
                // print("Package Added Successfully, Package: ${controllers.text}");
                // controllers.text = "";
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Row(
                //     children: const [
                //       Icon(
                //         Icons.playlist_add_check,
                //         color: Colors.greenAccent,
                //       ),
                //       SizedBox(width: 20),
                //       Expanded(child: Text('Package Added Successfully!')),
                //     ],
                //   ),
                // ));
                FirebaseFirestore.instance
                    .collection('package')
                //pass the package id to know which document/record to update
                    .doc(controllers.text)
                //update method
                    .update({
                  //update id
                  "deliverydriverid": widget.id
                });
              },
              color: Colors.black,
              child: const Text(
                '+ Add Package',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )),




        ],
      ),
    ));
  }
}
