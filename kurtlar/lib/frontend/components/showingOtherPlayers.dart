import 'package:flutter/material.dart';

import '../models/players.dart';

Container OtherMafiasShowingContainer(double height, List<Players> mafias) {
  return Container(
      height: height,
      color: Colors.amber,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3),
          itemCount: mafias.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              child: Column(
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/images/deafultAvatar.png'),
                  ),
                  Text(mafias[index].GetName),
                ],
              ),
            );
          }));
}
