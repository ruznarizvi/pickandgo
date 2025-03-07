import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/databasehelper.dart';
import 'package:pickandgo/screens/user/sendpackage/packagedetails.dart';
import 'package:pickandgo/services/routingpage.dart';
import 'package:universal_io/io.dart' as u;

class ReceiverDetails extends StatefulWidget {
  @override
  _ReceiverDetailsState createState() => _ReceiverDetailsState();
}

class _ReceiverDetailsState extends State<ReceiverDetails> {
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController recNameController = TextEditingController();
  final TextEditingController recEmailController = TextEditingController();
  final TextEditingController recAddressController = TextEditingController();
  final TextEditingController recPostalCodeController = TextEditingController();
  final TextEditingController recContactController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return (u.Platform.operatingSystem == "android")
        ? SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black87,
                title: Text('Pick Up Request'),
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (_) => RoutePage(),
                          ),
                        );
                      },
                      // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                    );
                  },
                ),
              ),
              //body: ReceiverDetailsForm(),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white10,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.98,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.all(22),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(1),
                                        child: Text(
                                          'Who is receiving the package?',
                                          style: TextStyle(fontSize: 40.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        'The pickupdriver may contact the recipient to complete the delivery.',
                                        style: TextStyle(fontSize: 17.0),
                                      )
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  controller: recNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Name',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return "Receiver name cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recNameController.text = value!;
                                    // setState(() {
                                    //   recNameController.text = value!;
                                    // });
                                  },
                                  keyboardType: TextInputType.name,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: recEmailController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Email',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return "Receiver email cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recEmailController.text = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: recAddressController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Address',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Receiver address cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recAddressController.text = value!;
                                  },
                                  keyboardType: TextInputType.streetAddress,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: recPostalCodeController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Postal Code',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Receiver postal code cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recPostalCodeController.text = value!;
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: recContactController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Contact No',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return "Receiver name cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recContactController.text = value!;
                                  },
                                  keyboardType: TextInputType.phone,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MaterialButton(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      elevation: 5.0,
                                      height: 40,
                                      onPressed: () {
                                        if (_formkey.currentState!.validate()) {
                                          _formkey.currentState!.save();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PackageDetails(
                                                      recNameController.text,
                                                      recEmailController.text,
                                                      recAddressController.text,
                                                      recPostalCodeController
                                                          .text,
                                                      recContactController
                                                          .text),
                                            ),
                                          );
                                        }
                                      },
                                      color: Colors.black,
                                      child: const Text(
                                        "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Text('Pick Up Request'),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (_) => RoutePage(),
                        ),
                      );
                    },
                    // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    _db.logout(context);
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (_) => RoutePage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
            //body: ReceiverDetailsForm(),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.white10,
                      width: MediaQuery.of(context).size.width * 0.50,
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: Center(
                        child: Container(
                          child: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(1),
                                        child: Text(
                                          'Who is receiving the package?',
                                          style: TextStyle(fontSize: 40.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'The pickupdriver may contact the recipient to complete the delivery.',
                                        style: TextStyle(fontSize: 17.0),
                                      )
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                //Text('${widget.receiverName}'),
                                TextFormField(
                                  controller: recNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Name',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 8.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return "Receiver name cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recNameController.text = value!;
                                    // setState(() {
                                    //   recNameController.text = value!;
                                    // });
                                  },
                                  keyboardType: TextInputType.name,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                TextFormField(
                                  controller: recEmailController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Email',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return "Receiver email cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recEmailController.text = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: recAddressController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Address',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Receiver address cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recAddressController.text = value!;
                                  },
                                  keyboardType: TextInputType.streetAddress,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: recPostalCodeController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Postal Code',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Receiver postal code cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recPostalCodeController.text = value!;
                                  },
                                  keyboardType: TextInputType.number,
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: recContactController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Receiver Contact No',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.green),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return "Receiver name cannot be empty";
                                    }
                                  },
                                  onSaved: (value) {
                                    recContactController.text = value!;
                                  },
                                  keyboardType: TextInputType.phone,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MaterialButton(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      elevation: 5.0,
                                      height: 40,
                                      onPressed: () {
                                        if (_formkey.currentState!.validate()) {
                                          _formkey.currentState!.save();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PackageDetails(
                                                      recNameController.text,
                                                      recEmailController.text,
                                                      recAddressController.text,
                                                      recPostalCodeController
                                                          .text,
                                                      recContactController
                                                          .text),
                                            ),
                                          );
                                        }
                                      },
                                      color: Colors.black,
                                      child: const Text(
                                        "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
