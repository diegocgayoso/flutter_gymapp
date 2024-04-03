import 'package:flutter/material.dart';
import 'package:flutter_my_first_app/_core/my_colors.dart';
import 'package:flutter_my_first_app/models/exercicio_model.dart';
import 'package:flutter_my_first_app/models/sentimento_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final ExercicioModel exercicioModel = ExercicioModel(
      id: "EX001",
      name: 'Supino Inclinado com Halteres',
      treino: "Peito",
      comoFazer:
          "Halteres empurrando pra cima sentadio no banco no angulo de 45 graus");
  final List<SentimentoModel> listaSentimentos = [
    SentimentoModel(
        id: "SE001",
        sentimento: "Muita ativação no meio do peito",
        data: "2022-02-17"),
    SentimentoModel(
        id: "SE002",
        sentimento:
            "Muita ativação na parte supeitos do peito e fadiga dos ombros",
        data: "2022-02-17")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              exercicioModel.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Raleway',
                  color: Color(0xFFF8F8F8)),
            ),
            Text(
              exercicioModel.treino,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Color(0xFFF8F8F8),
                ),
              ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: MyColors.blueDark,
        elevation: 0,
        toolbarHeight: 92,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FAB Foi clicado');
          },
          child: const Icon(Icons.add)),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Enviar foto"),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Tirar foto"))
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Como fazer?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(exercicioModel.comoFazer),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.blueGrey,
              ),
            ),
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index) {
                SentimentoModel sentimentoAgora = listaSentimentos[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(sentimentoAgora.sentimento),
                  subtitle: Text(sentimentoAgora.data),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      print("DELETAR ${sentimentoAgora.sentimento}");
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
