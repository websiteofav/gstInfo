import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gst_suvidha/models/gst_response_model.dart';

class GSTProfile extends StatelessWidget {
  final Success model;
  const GSTProfile({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: GestureDetector(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.green[400],
              // borderRadius: BorderRadius.circular(30.0),
            ),
            width: width * 0.9, // <-- match_parent
            height: 50,
            alignment: Alignment.center,
            child: const Text('Get Return Filing Status',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    color: Colors.white))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 60),
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                height: 300,
                width: width,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                  ),
                  color: Colors.green[800],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 20,
                              ),
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'GST Profile',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),

                        //   ],),
                        const Text(
                          'GSTN of the Tax Payer',
                          style: TextStyle(color: Colors.white38, fontSize: 14),
                        ),
                        Text(
                          model.gstNumber,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          model.comapnyName,
                          style: const TextStyle(
                              color: Colors.white54, fontSize: 14),
                        ),

                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 20,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green[900]),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'Active',
                                  style: TextStyle(
                                      color: Colors.green[900], fontSize: 14),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.05, horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 300,
                width: width,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[100],
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Pricilple Place of Business',
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 80,
                              width: 1,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Flexible(
                              child: Text(
                                model.businessPlace,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[100],
                              ),
                              child: const Icon(
                                Icons.business,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Additional Place of Business',
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Text(
                            model.additionalPlace,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.05, horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: 150,
                      width: width * 0.3,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'State Jurisdiction',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model.stateJurisdiction,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.05, horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: 150,
                      width: width * 0.3,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Center Jurisdiction',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model.stateJurisdiction,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.05, horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: 150,
                      width: width * 0.3,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Taxpayer Type',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model.taxPayerType,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.05, horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 150,
                width: width,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Condition of Business',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          model.businessCondition,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.05, horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 150,
                width: width,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Date of Registration',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model.registartionDate,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Date of Cancellation',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model.cancellationDate,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
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
