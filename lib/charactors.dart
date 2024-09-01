import 'dart:ui';

import 'package:blurbox/blurbox.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:three_dimension_model/list_of_chars.dart';

class Chars extends StatefulWidget {
  const Chars({super.key});

  @override
  State<Chars> createState() => Caharactors();
}

class Caharactors extends State<Chars> {
  O3DController o3 = O3DController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xfff0abbf),
              Color(0xffbc68a2),
              Color(0xff351c63),
              Color(0xff374cbc),
              Color(0xff3babe4),
              Color(0xff213d7f),
            ],
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: transformers.length,
          itemBuilder: (context, index) {
            return Container(
              height: 300,
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              // padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Color(0xff6f315b),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: O3D.asset(
                          src: 'assets/three_d_models/transformers/${transformers[index]['name'].toString()}.glb',
                          controller: o3,
                          autoPlay: true,
                          cameraOrbit: CameraOrbit(10, 90, 50),
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: BlurBox(
                      child: Center(
                        child: Text(
                          transformers[index]['name'].toString(),
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      blur: 36,
                      height: 50,
                      elevation: 6,
                      // padding: const EdgeInsets.all(32),
                      color: Colors.grey.withOpacity(0.15),
                      padding: const EdgeInsets.all(8),
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
