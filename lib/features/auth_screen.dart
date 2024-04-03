import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_my_first_app/_core/components/decoration_auth_field.dart';
import 'package:flutter_my_first_app/_core/my_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool wantIn = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [MyColors.blueBottomGradient, MyColors.blueGradient],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/gaming.jpg",
                        height: 128,
                      ),
                      const Text(
                        "GymApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        decoration: getAuthInputDecoration("Email"),
                        validator: (String? value) {
                          if (value == null) {
                            return "o email não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "o email está muito curto.";
                          }
                          if (!value.contains("@")) {
                            return "falta o @.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: getAuthInputDecoration("Senha"),
                        validator: (String? value) {
                          if (value == null) {
                            return "o senha não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "o senha deve ter mais de 5 caracteres.";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 12),
                      Visibility(
                          visible: !wantIn,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: getAuthInputDecoration(
                                    "Confirme sua senha"),
                                validator: (String? value) {
                                  if (value == null) {
                                    return "o senha não pode ser vazio";
                                  }
                                  if (value.length < 5) {
                                    return "o senha deve ter mais de 5 caracteres.";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                decoration: getAuthInputDecoration("Nome"),
                                validator: (String? value) {
                                  if (value == null) {
                                    return "nome muito curto";
                                  }
                                  if (value!.length < 5) {
                                    return "nome muito curto";
                                  }
                                  // O null
                                  return null;
                                },
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 32,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          buttonPrincipalClicado();
                        },
                        child: Text((wantIn) ? 'Entrar' : 'Cadastrar'),
                      ),
                      Divider(),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              wantIn = !wantIn;
                            });
                          },
                          child: Text((wantIn)
                              ? "Quero me cadastrar."
                              : "Quero entrar"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buttonPrincipalClicado() {
    if (_formKey.currentState!.validate()) {
      print("Form valido");
    } else {
      print("invalido");
    }
  }
}
