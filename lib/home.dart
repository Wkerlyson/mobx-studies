import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_studies/controller.dart';

class MyHomePage extends StatelessWidget {
  final controller = Controller();

  _textField({
    String labelText,
    onChanged,
    String Function() errorText,
    TextInputType type,
  }) {
    return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText(),
        ),
        keyboardType: type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Observer(builder: (_) {
              return _textField(
                labelText: "Name",
                onChanged: controller.client.chageName,
                errorText: controller.validateName,
              );
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return _textField(
                  labelText: "Email",
                  onChanged: controller.client.chageEmail,
                  errorText: controller.validateEmail,
                  type: TextInputType.emailAddress);
            }),
            SizedBox(height: 50),
            Observer(builder: (_) {
              return RaisedButton(
                onPressed: controller.isValid ? () {} : null,
                child: Text('Salvar'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
