import 'package:flutter/material.dart';
import 'package:pr1/providers/menu_provider.dart';
import 'package:pr1/utils/icono_string.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Componente HomePage')),
      body: _lista(),
    );
  }

  Widget _lista() {
    // print(menuProvider.opciones);
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: const [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItems(snapshot.data,context),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic>? data,BuildContext context) {
    final List<Widget> opciones = [];
    if (data != null) {
      data.forEach((opt) {
        final widgetTemp = ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.pushNamed(context, opt['ruta']);
          /*  final route = MaterialPageRoute(
              builder: (context){
                return const AlertPage();
              }
              );
             Navigator.push(context, route) ;
*/
          },
        );
        opciones
          ..add(widgetTemp)
          ..add(const Divider());
      });
    }
    return opciones;
  }
}
