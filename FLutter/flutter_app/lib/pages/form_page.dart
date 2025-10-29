import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/api_service.dart';

class FormPage extends StatefulWidget {
  final User? user;
  FormPage({this.user});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.user?.name ?? '');
    _emailController =
        TextEditingController(text: widget.user?.email ?? '');
    _ageController =
        TextEditingController(text: widget.user?.age.toString() ?? '');
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        id: widget.user?.id,
        name: _nameController.text,
        email: _emailController.text,
        age: int.parse(_ageController.text),
      );

      if (widget.user == null) {
        await ApiService.createUser(user);
      } else {
        await ApiService.updateUser(user);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.user == null ? 'Add User' : 'Edit User')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (v) => v!.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (v) => v!.isEmpty ? 'Enter email' : null,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Enter age' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(widget.user == null ? 'Add' : 'Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
