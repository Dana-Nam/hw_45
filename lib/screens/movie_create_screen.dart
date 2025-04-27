import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCreateScreen extends StatefulWidget {
  @override
  State<MovieCreateScreen> createState() => _MovieCreateScreenState();
}

class _MovieCreateScreenState extends State<MovieCreateScreen> {
  final titleController = TextEditingController();
  final yearController = TextEditingController();
  final descriptionController = TextEditingController();
  final posterUrlController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    yearController.dispose();
    descriptionController.dispose();
    posterUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить фильм')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Название фильма'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: 'Год выпуска'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Описание'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: posterUrlController,
              decoration: InputDecoration(labelText: 'URL постера'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    yearController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Movie(
                      title: titleController.text,
                      year: yearController.text,
                      description: descriptionController.text,
                      posterUrl: posterUrlController.text,
                    ),
                  );
                }
              },
              child: Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }
}
