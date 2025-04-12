import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCreateScreen extends StatefulWidget {
  @override
  State<MovieCreateScreen> createState() => _MovieCreateScreenState();
}

class _MovieCreateScreenState extends State<MovieCreateScreen> {
  final formKey = GlobalKey<FormState>();

  String title = '';
  String posterUrl = '';
  String year = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить фильм')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Название'),
                onSaved: (value) => title = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Год'),
                onSaved: (value) => year = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ссылка на постер'),
                onSaved: (value) => posterUrl = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Описание'),
                onSaved: (value) => description = value ?? '',
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState?.save();
                  Navigator.pop(
                    context,
                    Movie(
                      title: title,
                      year: year,
                      posterUrl: posterUrl,
                      description: description,
                    ),
                  );
                },
                child: Text('Создать'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
