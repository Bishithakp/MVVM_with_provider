import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/users_view_model.dart';

class AddUserScreen extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();
  //const
  AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewmodel>(builder: (_, mod, __) {
      return Scaffold(
          appBar: AppBar(
            title: Text('AddUserScreen'),
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter name';
                      }
                    },
                    controller: mod.controllerName,
                    onChanged: (value) {
                      mod.setName(value);
                    },
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter a valid email';
                      }
                    },
                    controller: mod.controllerEmail,
                    onChanged: (value) {
                      mod.setEmail(value);
                    },
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter City';
                      }
                    },
                    controller: mod.controller1City,
                    onChanged: (value) {
                      mod.setCity(value);
                    },
                    decoration: const InputDecoration(hintText: 'city'),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();
                              mod.setnewUser();
                            }
                          },
                          child: Text('AddUser'))),
                ],
              ),
            ),
          ));
    });
  }
}
