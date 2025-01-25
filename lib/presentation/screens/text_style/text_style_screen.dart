// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/card_container.dart';

class TextStyleScreen extends StatelessWidget {
  static const String name = 'text_style';

  const TextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estilos de Texto'),
      ),
      body: const _TextStyleView(),
    );
  }
}

class _TextStyleView extends StatelessWidget {
  const _TextStyleView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        spacing: 10,
        children: [
          CardContainer(content: _TextStyleExample1(), icon: Icons.code_outlined),
          CardContainer(content: _TextStyleExample2(), icon: Icons.code_outlined),
        ],
      ),
    );
  }
}

class _TextStyleExample2 extends StatelessWidget {
  const _TextStyleExample2();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        spacing: 60,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Balance\n',
              style: TextStyle(fontSize: 20, color: Colors.black87),
              children: [
                TextSpan(
                  text: '₹ 9,12,735',
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
              children: [
                TextSpan(
                    text: 'Register',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('You tapped on Register');
                      })
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'Please subscribe ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.notifications_active_outlined,
                    size: 30,
                    color: Colors.red,
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TextStyleExample1 extends StatelessWidget {
  const _TextStyleExample1();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text.rich(
        TextSpan(
          text: 'Hello\n',
          style: const TextStyle(fontSize: 20, color: Colors.black54),
          children: [
            const TextSpan(
              text: 'Siddharth',
              style: TextStyle(fontSize: 30, color: Colors.black87),
            ),
            TextSpan(
              text: '\n\n\nDon\'t have an account? ',
              style: const TextStyle(fontSize: 20),
              children: [
                TextSpan(
                    text: 'Sign Up',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('You tapped on Sign Up');
                      }),
              ],
            ),
            const TextSpan(
              text: '\n\n\nI ',
              style: TextStyle(fontSize: 20, color: Colors.black87),
              children: [
                WidgetSpan(
                  child: Icon(Icons.favorite_outline, color: Colors.blue),
                ),
                TextSpan(
                  text: ' Flutter',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
