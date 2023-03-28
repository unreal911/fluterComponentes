import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  HomePageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components Temp'),
      ),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];
    for (String opt in opciones) {
      final temWidget = ListTile(
        title: Text(opt),
      );
      lista
        ..add(temWidget)
        ..add(const Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('$item !'),
            subtitle: const Text('subtitle cpmst'),
            leading: const Icon(Icons.account_balance_rounded),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          const Divider()
        ],
      );
    }).toList();
  }
}
