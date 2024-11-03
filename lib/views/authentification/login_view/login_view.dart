import 'package:flutter/material.dart';
import 'package:todo_list/views/authentification/signIn_view/signIn_view.dart';
import 'package:todo_list/views/home_view/home_view.dart';
import 'package:todo_list/widgets/boutons/default_bouton.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  ///Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header,
                _inputField,
                _forgotPassword,
                _signup,
              ]),
        ),
      ),
    );
  }

  ///Get header
  Column get _header {
    return const Column(
      children: [
        Text(
          "Bienvenue à vous",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Entrer vos identifiants pour vous connecter!"),
      ],
    );
  }

  ///Get input fields
  Column get _inputField {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Colors.deepPurple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
          validator: (value) {
            if (value!.isEmpty) {
              return "L'email est obligatoire";
            }
            if (!value.contains('@')) {
              return "L'email n'est pas correct";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              hintText: "Mot de passe",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Colors.deepPurple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.password),
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              )),
          obscureText: obscurePassword,
          validator: (value) {
            if (value!.isEmpty) {
              return "Le mot de passe est obligatoire";
            }
            if (value.length < 6) {
              return "Le mot de passe doit contenir au moins 6 caractères";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        defaultButton(
          onPressed: () {
            //Vérifier si les champs sont renseignés et validés
            // if (_formKey.currentState!.validate()) {
            //   String email = _emailController.text.trim();
            //   String passWord = _passwordController.text.trim();

            Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomeView()),
              ModalRoute.withName('/'),
            );
            // }
          },
          btnText: "Se Connecter",
        ),
      ],
    );
  }

  ///Get forgot password
  TextButton get _forgotPassword {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Mot de passe Oublié ?",
        style: TextStyle(color: Colors.deepPurple),
      ),
    );
  }

  ///Get signup
  Row get _signup {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Je n'ai pas de compte ? "),
      TextButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const SignInView(),
              ),
            );
          },
          child: const Text(
            "S'inscrire",
            style: TextStyle(color: Colors.deepPurple),
          ))
    ]);
  }
}
