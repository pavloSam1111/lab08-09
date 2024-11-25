import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Логіка реєстрації
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Успішна реєстрація")),
      );
      Navigator.pop(context); // Повернення до екрану авторизації
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Реєстрація')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Ім’я'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле обов’язкове';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Електронна пошта'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле обов’язкове';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Неправильний формат email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Пароль'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле обов’язкове';
                  } else if (value.length < 7) {
                    return 'Пароль має містити не менше 7 символів';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _register(context),
                child: const Text('Зареєструватися'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
