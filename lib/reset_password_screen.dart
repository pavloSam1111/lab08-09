import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _resetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Логіка скидання пароля
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Інструкції відправлено на пошту")),
      );
      Navigator.pop(context); // Повернення до екрану авторизації
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Відновлення пароля')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              ElevatedButton(
                onPressed: () => _resetPassword(context),
                child: const Text('Скинути пароль'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
