import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
          const SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Soy el titulo'),
            subtitle: Text(
                'soy un titulo que esta a cargo de solo mostrar lo necesario para la prueba'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(child: const Text('cancelar'), onPressed: () {}),
              TextButton(child: const Text('ok'), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}

Widget _cardTipo2() {
  final card = Container(
    child: Column(
      children: <Widget>[
        const FadeInImage(
            image: NetworkImage(
                'https://www.tuexperto.com/wp-content/uploads/2022/01/paginas-descargar-fondos-de-pantalla.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.contain),

        /*  const Image(
            image: NetworkImage(
                'https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg')),*/
        Container(
            padding: const EdgeInsets.all(10.0), child: const Text('data'))
      ],
    ),
  );
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 2.0))
        ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: card,
    ),
  );
}
