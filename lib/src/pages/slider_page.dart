import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});
  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            const Divider(),
            _checkBox(),
            const Divider(),
            _swicthTile(),
            const Divider(),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  Widget _checkBox() {
    return CheckboxListTile(
      title: const Text('Bloquear slider'),
       value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        }
    );
    
    
    /*Checkbox(
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        });*/
  }
  Widget  _swicthTile(){
     return SwitchListTile(
      title: const Text('Bloquear slider'),
       value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        }
    );
  }

  Widget _crearImagen() {
    return Image(
      image: const NetworkImage(
          'https://pbs.twimg.com/profile_images/704541600408539136/cyRUHn4R_400x400.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
