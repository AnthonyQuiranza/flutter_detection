import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/style_model.dart';

final Uri _fuenteURL = Uri.parse(
    'https://cipotato.org/papaenecuador/manejo-de-lancha/#:~:text=La%20lancha%20es%20una%20enfermedad,entre%203%20y%2015%20días.');

class lanchaPage extends StatelessWidget {
  const lanchaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _menuList(context),
    );
  }

  Widget _menuList(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        title: Text(
          'Lancha o Tizón Tardío',
          textAlign: TextAlign.center,
          textScaleFactor: 1.2,
        ),
        toolbarTextStyle: TextStyle(fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: 'Tizón tardío',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 30),
                              children: [
                            TextSpan(text: ' o lancha', style: titleFont)
                          ])),
                    )
                  ],
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text:
                              "El tizón tardío de la papa, causado por Phytophthora infestans (Mont de Bary), es una de las enfermedades más devastadoras de la papa a nivel mundial. En el país se la conoce como lancha y se la considera la enfermedad más importante debido a que se presenta en todas las áreas paperas y por las pérdidas que causa. Las condiciones climáticas de la sierra favorecen su desarrollo al presentar temperaturas moderadas entre 12° a 18° C, alta humedad en las mañanas y periodos de sol",
                          style: bodyFont),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Síntomas',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontSize: 30))),
                  ],
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text:
                              "Aparecen manchas de color marrón claro a oscuro, no limitadas por las nervaduras, de apariencia húmeda, de forma irregular, algunas veces rodeadas por un halo amarillento. Estos síntomas se presentan inicialmente en los bordes y puntas de las hojas.",
                          style: bodyFont),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Control Químico',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontSize: 30))),
                  ],
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text:
                              "Es la reducción de la enfermedad por interacción de uno o más organismos vivos con el patógeno causante de la enfermedad. Pérez y Forbes (2008) mencionan que numerosos trabajos han reportado el efecto antagonista de varios microorganismos contra P. infestans, entre los que se mencionan Serratia spp., Streptomyces spp., Pseudomonas spp., Bacillus spp., Trichoderma spp., Fusarium spp., Aspergillus spp., Penicillium spp., Myrothecium spp., entre otros. El uso de control biológico no es común y los reportes de control exitoso son raros. El uso de extracto de infusiones o fermentos de algunos vegetales como: cebada, trigo, ajo y cebolla han dado resultados exitosos bajo condiciones de laboratorio e invernadero.",
                          style: bodyFont),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Fuente: ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' cipotato.org',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 15),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchUrl();
                                  })
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

void _launchUrl() async {
  if (!await launchUrl(_fuenteURL)) throw 'No se puede abrir $_fuenteURL';
}
