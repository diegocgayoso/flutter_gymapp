import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_my_first_app/_core/components/decoration_auth_field.dart';
import 'package:flutter_my_first_app/_core/components/my_snackbar.dart';
import 'package:flutter_my_first_app/_core/my_colors.dart';
import 'package:flutter_my_first_app/services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool wantIn = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  AuthenticationService _authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [MyColors.pink01, MyColors.purple01, MyColors.blue01],
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
                        "assets/logo-gym.png",
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
                        controller: _emailController,
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
                        controller: _passwordController,
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
                                controller: _passwordController,
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
                                obscureText: true,
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: _nameController,
                                decoration: getAuthInputDecoration("Nome"),
                                validator: (String? value) {
                                  if (value == null) {
                                    return "nome muito curto";
                                  }
                                  if (value.length < 5) {
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
                        child: Text(
                          (wantIn) ? 'Entrar' : 'Cadastrar',
                        ),
                      ),
                      Divider(),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              wantIn = !wantIn;
                            });
                          },
                          child: Text(
                            (wantIn) ? "Quero me cadastrar." : "Quero entrar",
                            style: TextStyle(color: Colors.grey[300]),
                          ))
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
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      if (wantIn) {
        print('Entrada validada');
      } else {
        print('Cadrastro Validado ');
        print(
            '${_emailController.text}, ${_passwordController.text}, ${_nameController.text},');
        _authService
            .registerUser(name: name, email: email, password: password)
            .then((String? err) {
          if (err != null) {
            // Voltou com erro
            showSnackBar(context: context, text: err);
          } else {
            // Deu bom
            showSnackBar(
                context: context,
                text: "Cadastro efetuado com sucesso",
                isErr: false);
          }
        });
      }
    } else {
      print("invalido");
    }
  }
}
