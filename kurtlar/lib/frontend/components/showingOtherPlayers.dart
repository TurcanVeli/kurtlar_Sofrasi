import 'package:flutter/material.dart';

import '../models/players.dart';

Container OtherMafiasShowingContainer(double height, List<Players> mafias) {
  return Container(
      height: height,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 3 / 6,
              crossAxisSpacing: 30,
              mainAxisSpacing: 34),
          itemCount: mafias.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Image.asset('assets/images/deafultAvatar.png'),
                  ),
                  Text(mafias[index].GetName),
                ],
              ),
            );
          }));
}
