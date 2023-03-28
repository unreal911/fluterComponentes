import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  final _nombreController = TextEditingController(); //
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'volar';
  List<String> _poderes = ['volar', 'rayos x', 'super aliento', 'super fuerza'];
  TextEditingController _inputFieldController = new TextEditingController();
  @override
  void initState() {
    super.initState(); //para detener el backspace al inicio
    _nombreController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    //para detener el backspace al inicio
    _nombreController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    //para detener el backspace al inicio
    final newValue = _nombreController.text;
    if (newValue != null && newValue.isNotEmpty) {
      setState(() {
        _nombre = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input de texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _creaPassword(),
          const Divider(),
          _crearDatepicker(context),
          const Divider(),
          _crearDropdown(),
          //
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      controller: _nombreController, //para detener el backspace al inicio
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es le nombre',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle)),
      onChanged: (valor) {
        if (valor != null && valor.isNotEmpty) {
          setState(() {
            _nombre = valor;
          });
        }
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      //para detener el backspace al inicio
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_email.length}'),
          hintText: 'Email de la persona',
          labelText: 'Email',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle)),
      onChanged: (valor) {
        if (valor != null && valor.isNotEmpty) {
          setState(() {
            _email = valor;
          });
        }
      },
    );
  }

  Widget _creaPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es le nombre',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle)),
      onChanged: (valor) {
        if (valor != null && valor.isNotEmpty) {
          setState(() {
            _nombre = valor;
          });
        }
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdonw() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        const Icon(Icons.select_all),
        const SizedBox(),
        Expanded(
          child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesDropdonw(),
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt!;
                });
              }),
        )
      ],
    );
  }

  Widget _crearDatepicker(BuildContext context) {
    return TextField(
      controller: _inputFieldController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'fecha nacimiento',
          labelText: 'fecha',
          suffixIcon: const Icon(Icons.perm_contact_cal),
          icon: const Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: const Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldController.text =
            _fecha; //ver esto no le entiendo donde saca el
      });
    }
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('nombre es: $_nombre'),
      subtitle: Text('email : $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }
}
