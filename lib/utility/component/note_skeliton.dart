import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Skeliton extends StatelessWidget {
  const Skeliton({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      itemCount: 7,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade700),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade700),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade700),
              ),
            ],
          ),
        );
      },
    );
  }
}
