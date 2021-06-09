import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_study/screens/list_screen.dart';
import 'package:mobx_study/stores/login_store.dart';
import 'package:mobx_study/widgets/custom_icon_button.dart';
import 'package:mobx_study/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late LoginStore loginStore;

  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loginStore = Provider.of<LoginStore>(context);

    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      if (loggedIn != null)
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ListScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(builder: (_) {
                      return CustomTextField(
                        controller: _emailController,
                        suffix: SizedBox(),
                        hint: 'E-mail',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                        enabled: !loginStore.loading,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return CustomTextField(
                        controller: _passwordController,
                        textInputType: TextInputType.text,
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: !loginStore.obscure,
                        onChanged: loginStore.setPassword,
                        enabled: !loginStore.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: !loginStore.obscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: loginStore.setObscure,
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            )),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(color: Colors.white)),
                          ),
                          child: loginStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('Login'),
                          onPressed:
                              loginStore.isFormValid && !loginStore.loading
                                  ? () {
                                      loginStore.login();
                                      /*Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context)=>ListScreen())
                                  );*/
                                    }
                                  : null,
                        ),
                      );
                    }),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
