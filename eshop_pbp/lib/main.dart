import 'package:flutter/material.dart';
import 'package:eshop_pbp/screens/login.dart';
import 'package:eshop_pbp/screens/menu.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'YumYum Bakeshop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red, 
          ).copyWith(
            primary: Colors.red.shade900,
            secondary: Colors.red.shade700, 
          ),  
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
