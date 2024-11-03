import 'package:flutter/material.dart';
import 'package:todo_list/views/authentification/login_view/login_view.dart';
import 'package:todo_list/widgets/boutons/default_bouton.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();

  //Les Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _header(),
                  _inputFields(),
                  defaultButton(
                    onPressed: () {},
                    btnText: "S'enregistrer",
                  ),
                  _login(context)
                ]),
          ),
        ),
      ),
    );
  }

  Column _inputFields() {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
              hintText: "Nom d'utilisateur",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Colors.deepPurple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Colors.deepPurple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.email)),
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
        const SizedBox(height: 12),
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
        const SizedBox(height: 12),
        TextFormField(
          controller: _confirmPasswordController,
          decoration: InputDecoration(
              hintText: "Confirmer Mot de passe",
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
            if (value != _passwordController.text) {
              return "Les mots de passe ne sont pas identiques";
            }
            return null;
          },
        ),
      ],
    );
  }

  Row _login(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      const Text("J'ai un déjà un compte ! "),
      TextButton(
          onPressed: () {
            //Vérifier si les champs sont renseignés et validés
            if (_formKey.currentState!.validate()) {
              String name = _nameController.text.trim();
              String email = _emailController.text.trim();
              String password = _passwordController.text.trim();
              String confirmPassword = _confirmPasswordController.text.trim();
            }
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const LoginView(),
              ),
            );
          },
          child: const Text(
            "Se Connecter",
            style: TextStyle(color: Colors.deepPurple),
          ))
    ]);
  }

  Column _header() {
    return Column(children: <Widget>[
      const SizedBox(height: 60.0),
      const Text(
        "S'inscrire",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        "Creer un compte pour commencer",
        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
      )
    ]);
  }
}
