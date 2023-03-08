import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey =  GlobalKey<FormState>();

    final Map<String, String> formValues ={
      'first_name': 'Christian',
      'last_name' : 'Arguello',
      'email'     : 'ChristianAgue@hotmail.com',
      'password'  : '09315363',
      'role'      : 'Admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                const SizedBox(height: 15),
                //Nombre del Usuario
                CustomInputField(hinText: 'Nombre del usuario', labelText: 'Nombre', suffixIcon: Icons.assignment_ind_rounded, formProperty: 'first_name', formValues: formValues,),
                const SizedBox(height: 20),
                //Apellido del Usuario
                CustomInputField(hinText: 'Apellido del usuario', labelText: 'Apellido', suffixIcon: Icons.assignment_ind_rounded, formProperty: 'last_name', formValues: formValues),
                const SizedBox(height: 20),
                //Correo del Ususario
                CustomInputField(hinText: 'Correo del usuario', labelText: 'Correo', suffixIcon: Icons.email_rounded, keyboardType: TextInputType.emailAddress, formProperty: 'email', formValues: formValues),
                const SizedBox(height: 20),
                //Contrasenia del Usuario
                CustomInputField(hinText: 'Contrasenia del usuario', labelText: 'Contrasenia', suffixIcon: Icons.password_rounded, obscureText: true, formProperty: 'password', formValues: formValues,),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: 'Admin',
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'Superuser', child: Text('Superuser')),
                    DropdownMenuItem(value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem(value: 'Jr. Developer', child: Text('Jr. Developer')),
                  ], 
                  onChanged: (value) {
                    print('value');
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                ElevatedButton(
                  child: const SizedBox(
                    width: 200,
                    child: Center(child: Text('Guardar'))
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if(!myFormKey.currentState!.validate()){
                      print('Formulario no valido');
                      return;
                    }
                    print(formValues);
                  }, 
                )
              ],
            ),
          ),
        ),
      )
   );
  }
}

