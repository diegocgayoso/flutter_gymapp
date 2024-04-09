import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_my_first_app/features/exercicios_tela.dart";
import "package:flutter_my_first_app/models/exercicio_model.dart";
import "package:flutter_my_first_app/services/auth_service.dart";

class InitialScreen extends StatefulWidget {
  final User user;
  InitialScreen({super.key, required this.user});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final List<ExercicioModel> listWorkout = [
    ExercicioModel(
        id: "EX01",
        name: "Pull Down Corda + Barra Fixa",
        treino: "Costas",
        comoFazer:
            "Usar a polia, ficar afastado com o tronco inclinado, braços esticados sendo uma extensão do corpo. Puxar a corda fazendo um arco até que os braços fiquem paralelos ao tronco."),
    ExercicioModel(
        id: "EX02",
        name: "Puxada Alta Triângulo",
        treino: "Costas",
        comoFazer:
            "Usar a Triângulo, ficar sentado com o tronco reto, braços esticados para cima, estabilizar os ombros. Puxar o triangulo até a altura do queixo."),
    ExercicioModel(
        id: "EX03",
        name: "Puxada Aberta + Supinada",
        treino: "Costas",
        comoFazer:
            "Usar a barra, ficar sentado com o tronco reto, braços esticados para cima mais abertos, estabilizar os ombros. Puxar a barra triangulo até a altura do queixo."),
    ExercicioModel(
        id: "EX01",
        name: "Pull Down Corda + Barra Fixa",
        treino: "Costas",
        comoFazer:
            "Usar a polia, ficar afastado com o tronco inclinado, braços esticados sendo uma extensão do corpo. Puxar a corda fazendo um arco até que os braços fiquem paralelos ao tronco."),
    ExercicioModel(
        id: "EX02",
        name: "Puxada Alta Triângulo",
        treino: "Costas",
        comoFazer:
            "Usar a Triângulo, ficar sentado com o tronco reto, braços esticados para cima, estabilizar os ombros. Puxar o triangulo até a altura do queixo."),
    ExercicioModel(
        id: "EX03",
        name: "Puxada Aberta + Supinada",
        treino: "Costas",
        comoFazer:
            "Usar a barra, ficar sentado com o tronco reto, braços esticados para cima mais abertos, estabilizar os ombros. Puxar a barra triangulo até a altura do queixo."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Workouts"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text((widget.user.displayName != null)
                    ? widget.user.displayName!
                    : ""),
                accountEmail: Text(widget.user.email!)),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log out"),
              onTap: () {
                AuthenticationService().logoutUsers();
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: List.generate(
          listWorkout.length,
          (index) {
            ExercicioModel exercicioModel = listWorkout[index];
            return ListTile(
              title: Text(exercicioModel.name),
              subtitle: Text(exercicioModel.treino),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ExercicioTela(exercicioModel: exercicioModel),
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}
