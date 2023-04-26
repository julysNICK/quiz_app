import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:websafe_svg/websafe_svg.dart';

import '../../constrants.dart';
import '../../models/User.dart';
import '../../repositories/user.dart';
import '../results_forms/results_forms_screen.dart';

class WelcomeEnterpriseScreen extends StatefulWidget {
  const WelcomeEnterpriseScreen({super.key});

  @override
  State<WelcomeEnterpriseScreen> createState() =>
      _WelcomeEnterpriseScreenState();
}

class _WelcomeEnterpriseScreenState extends State<WelcomeEnterpriseScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isPasswordVisible = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await UserRepoService().getUserAdmin(
          UserAdmin(
            email: controllerEmail.text.trim(),
            password: controllerPassword.text.trim(),
          ),
        );

        Get.to(() => const ResultsForms());
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      "Antes de começar",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      "Preencha seus dados abaixo para continuar",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const Spacer(),
                    TextFormField(
                      controller: controllerEmail,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "Email corporativo",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira um email válido';
                        }

                        if (!value.contains('@')) {
                          return 'Por favor, insira um email válido';
                        }

                        if (!value.contains('.com')) {
                          return 'Por favor, insira um email válido';
                        }

                        return null;
                      },
                    ),
                    Container(
                      height: 50,
                    ),
                    TextFormField(
                      obscureText: isPasswordVisible,
                      controller: controllerPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF1C2341),
                        hintText: "Senha",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira uma senha válida';
                        }

                        if (value.length < 6) {
                          return 'Por favor, insira uma senha válida';
                        }

                        return null;
                      },
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        login();
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding:
                            const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                        decoration: const BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Começar",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
