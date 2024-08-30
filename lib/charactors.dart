import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class Caharactors extends StatelessWidget {
  Caharactors({super.key});
  O3DController o3 = O3DController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 200,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: 300,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: O3D.asset(
                            src: 'assets/three_d_models/earth_warsg1_optimus-prime_style_rotbtf7.glb',
                            controller: o3,
                            autoPlay: true,
                            cameraOrbit: CameraOrbit(90, 90, 100),
                          )
                          ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 12,
                          color: Colors.black.withOpacity(0.1),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
