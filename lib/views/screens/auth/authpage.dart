import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/auth_switch_button.dart';
import 'package:flymedia_admin/views/common/slidefadeswitcher.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _showSignin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double width = constraints.maxWidth;

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Stack(
                  children: [
                    SizedBox(
                      width: width * 0.4,
                      height: height,
                      child: Image.asset(
                        'assets/images/photo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: width * 0.4,
                        height: height,
                        child: Image.asset(
                          'assets/images/logo_frame.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: width,
                  child: GestureDetector(
                    onTap: FocusScope.of(context).unfocus,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.r),
                          child: SlideFadeSwitcher(
                            child: _showSignin
                                ? const SignInWidget()
                                : const SignUpWidget(),
                          ),
                        ),
                        AuthSwitchButton(
                          showSignIn: _showSignin,
                          onTap: () {
                            setState(() {
                              _showSignin = !_showSignin;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('up'),
    );
  }
}

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('in'),
    );
  }
}
