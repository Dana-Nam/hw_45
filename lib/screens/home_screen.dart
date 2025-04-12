import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> names = List.generate(12, (index) => 'Name ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Tracker')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: names.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(names[index]),
            );
          },
        ),
      ),
    );
  }
}
