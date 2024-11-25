import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'reset_password_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      // Логіка авторизації
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Успішна авторизація")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Авторизація')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Логотип на екрані
              Center(
                child: Image.asset(
                  'assets/pngtree-wolf-logo-png-image_2306634.jpg',
                  height: 100, // Висота логотипу
                  width: 100,  // Ширина логотипу
                ),
              ),
              const SizedBox(height: 32), // Відступ між логотипом і полями

              // Поле для вводу email
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

              // Поле для вводу пароля
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

              // Кнопка для авторизації
              ElevatedButton(
                onPressed: _validateAndSubmit,
                child: const Text('Увійти'),
              ),
              const SizedBox(height: 16),

              // Кнопка для переходу до екрану реєстрації
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: const Text('Зареєструватися'),
              ),

              // Кнопка для переходу до екрану відновлення паролю
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                  );
                },
                child: const Text('Відновити пароль'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
