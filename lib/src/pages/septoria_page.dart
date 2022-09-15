import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/style_model.dart';

final Uri _fuenteURL = Uri.parse(
    'https://plantix.net/es/library/plant-diseases/100152/septoria-leaf-spot');

class SeptoriaPage extends StatelessWidget {
  const SeptoriaPage({Key? key}) : super(key: key);

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
          'Septiorosis o Septoria lycopersici',
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
                              text: 'Septoria lycopersici',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 30),
                              children: [
                            TextSpan(text: ' o Septiorosis', style: titleFont)
                          ])),
                    )
                  ],
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text:
                              "Generalmente, la septoriosis aparece durante y después de la formación de los frutos, pero los riesgos existen durante toda la temporada. La mayoría de las infecciones comienzan a partir de los escombros de plantas infectadas que fueron dejados en la tierra durante el invierno. Las esporas se esparcen hacia las plantas a través de las salpicaduras del agua debido al riego o la lluvia. Los períodos prolongados de calor y condiciones húmedas crean el ambiente perfecto para esta plaga causada por los hongos.",
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
                              "Los síntomas se propagan desde los brotes más viejos a los más jóvenes. En la parte inferior de las hojas viejas aparecen pequeñas manchas circulares grises y acuosas con márgenes de color marrón oscuro. En las fases posteriores de la enfermedad, las manchas se agrandan, se aglutinan y aparecen puntos negros en sus centros. El mismo patrón también se puede observar en tallos y flores, pero rara vez en las frutas. Las hojas más infectadas se tornan ligeramente amarillas, se marchitan y se caen. La defoliación provoca quemaduras solares en las frutas. ",
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
                              "Opte siempre por un método integral de medidas preventivas con tratamientos biológicos, de ser posible. Los fungicidas que contienen maneb, mancozeb y clorotalonil controlan eficazmente la mancha foliar por Septoria. Aplíquelos en intervalos de 7 a 10 días a lo largo de la temporada, principalmente durante la floración y el cuajado de las frutas. Acate las restricciones indicadas en la etiqueta del pesticida. ",
                          style: bodyFont),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Fuente: ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' plantix.net',
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
