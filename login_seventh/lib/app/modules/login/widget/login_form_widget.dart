import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_seventh/app/core/widgets/custom_input_widget.dart';
import 'package:login_seventh/app/core/widgets/logading_widget.dart';
import 'package:login_seventh/app/modules/login/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(70),
          topLeft: Radius.circular(70),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomInputWidget(
                hint: 'Username',
                initialValue: 'candidato-seventh',
                controller: controller.userNameController,
                onChanged: (value) {
                  controller.loginModel.username = value;
                },
                keyboardType: TextInputType.text,
                validator: (value) {
                  return value == null || value.isEmpty
                      ? "Preencha o campo username."
                      : null;
                },
              ),
              CustomInputWidget(
                hint: 'Senha',
                initialValue: '8n5zSrYq',
                keyboardType: TextInputType.text,
                controller: controller.passwordController,
                onChanged: (value) {
                  controller.loginModel.password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe sua senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              controller.isLoading
                  ? LoadingComponent()
                  : GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                offset: Offset(-3, 3),
                              )
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF29B6F6),
                                  Color(0xFF81D4FA),
                                ])),
                        child: const Icon(
                          color: Colors.white,
                          size: 40,
                          Icons.arrow_forward,
                        ),
                      ),
                      onTap: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (controller.formKey.currentState!.validate()) {
                          final response = await controller.login(
                            context, 'candidato-seventh', '8n5zSrYq',
                            //controller.loginModel.username!,
                            //controller.loginModel.password!,
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
