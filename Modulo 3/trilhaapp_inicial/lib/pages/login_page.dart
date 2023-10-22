import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.person_2,
                size: 150,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("Informe seu email:"),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text("Email"),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("Informe a senha:"),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text("Senha"),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.blue,
                height: 30,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                alignment: Alignment.center,
                child: const Text("Cadastrar"),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
