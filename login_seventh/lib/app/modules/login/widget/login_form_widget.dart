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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomInputWidget(
                textLabel: 'Username',
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
                textLabel: 'Password',
                obscure: controller.obscureValue,
                keyboardType: TextInputType.text,
                controller: controller.passwordController,
                onChanged: (value) {
                  controller.loginModel.password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o password';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () => controller.changeObscure(),
                  icon: Icon(
                    controller.obscureIcon,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5),
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
                                  Color(0xFFB9F6CA),
                                  Color(0xFF00E676),
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
                          await controller.login(
                            context,
                            controller.loginModel.username!,
                            controller.loginModel.password!,
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
