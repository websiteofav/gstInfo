import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:gst_suvidha/models/gst_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gst_suvidha/gst_profile.dart';
import 'package:gst_suvidha/utils/swipable_button.dart';

class GSTSearchscreen extends StatefulWidget {
  const GSTSearchscreen({Key? key}) : super(key: key);

  _GSTSearchscreenState createState() => _GSTSearchscreenState();
}

class _GSTSearchscreenState extends State<GSTSearchscreen> {
  apiService(id) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          );
        });
    var url = 'https://pacific-hollows-46752.herokuapp.com/gst/$id';
    var response =
        await http.get(Uri.parse(url), headers: {"Content-Type": "text/plain"});

    if (response.body.contains('No Data Found')) {
      Navigator.of(context).pop();

      validationAlert(context, 'Please input the correct GST Value');
    } else {
      var data = json.decode(response.body);
      GSTResponseModel model = GSTResponseModel.fromJson(data);
      log(model.success.toString());
      Navigator.of(context).pop();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GSTProfile(
                    model: model.success,
                  )));
    }
  }

  bool gstNumber = true;
  TextEditingController gstInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: height * 0.3,
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: height * 0.1, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Select the type for',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    'GST Number Search Tool',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.1,
              margin: EdgeInsets.only(top: height * 0.18, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  border: Border.all(color: Colors.black)),
            ),
            Container(
              height: height * 0.1,
              margin: EdgeInsets.only(top: height * 0.18, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  border: Border.all(color: Colors.black)),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              left: gstNumber ? width * 0.02 : width * 0.48,
              child: Container(
                // padding: EdgeInsets.only(left: 10),
                width: width * 0.45,
                height: height * 0.09,
                margin:
                    EdgeInsets.only(top: height * 0.185, left: 10, right: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      topLeft: Radius.circular(19),
                      bottomLeft: Radius.circular(19),
                      bottomRight: Radius.circular(25.0)),
                  // shape: BoxShape.circle,
                  color: Colors.white,
                ),
                // child: widget.thumb,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.22, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gstNumber = true;
                      });
                    },
                    child: SizedBox(
                      height: height * 0.05,
                      child: const Text(
                        'Search GST Number',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gstNumber = false;
                      });
                    },
                    child: SizedBox(
                      height: height * 0.05,
                      child: const Text(
                        'Get Return Status',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * 0.35,
              ),
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter GST Number',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: width * 0.05,
                  ),
                  Material(
                    child: TextField(
                      controller: gstInput,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          labelText: "Ex: AGJDF5656JJ",
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.05,
                  ),
                  GestureDetector(
                    onTap: () async {
                      apiService(gstInput.text);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(30.0)),
                        width: width * 0.9, // <-- match_parent
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text('Search',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 18,
                                color: Colors.white))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  validationAlert(BuildContext context, msg) {
    // Create button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Alert",
        style: TextStyle(color: Colors.black),
      ),
      content: Text(msg, style: const TextStyle(color: Colors.black)),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
