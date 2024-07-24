import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common_widgets/info_card.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

const url = 'https://pub.dev';
const email = '6GqFP@example.com';
const phone = '9999999999';
const location = 'Karnataka, India';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
            const Text(
              'Pavana NR',
              style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
            const Text(
              'Software Engineer',
              style: TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'SourceCodePro'),
            ),
            const SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Color.fromRGBO(0, 121, 107, 1),
              ),
            ),
            InfoCard(
              text: phone,
              icon: Icons.phone,
              onPressed: () {
                String removeSpaceFromPhoneNumber =
                    phone.replaceAll(RegExp(r"\s+\b|\b\s"), '');
                var phoneCall = 'tel:$removeSpaceFromPhoneNumber';

                _launchUrl(context, phoneCall);
              },
            ),
            InfoCard(
              text: email,
              icon: Icons.email,
              onPressed: () {
                _launchUrl(context, email);
              },
            ),
            InfoCard(
              text: url.toString(),
              icon: Icons.web,
              onPressed: () {
                _launchUrl(context, url);
              },
            ),
            InfoCard(
              text: location,
              icon: Icons.location_city,
              onPressed: () => 'Karnataka, India',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context, dynamic destination) async {
    try {
      if (destination is String) {
        // Check if it's a valid URL
        final uri = Uri.tryParse(destination);
        if (uri != null) {
          if (await launcher.launchUrl(uri)) {
            await launcher.launchUrl(uri);
          } else {
            throw Exception('Could not launch URL: $destination');
          }
        } else {
          // It's not a valid URL; let's check if it's an email address
          if (destination.contains('@')) {
            final emailUri = Uri(scheme: 'mailto', path: destination);
            if (await launcher.launchUrl(emailUri)) {
              await launcher.launchUrl(emailUri);
            } else {
              throw Exception('Could not launch email: $destination');
            }
          } else {
            // Assume it's a phone number
            final phoneUri = Uri(scheme: 'tel', path: destination);
            if (await launcher.launchUrl(phoneUri)) {
              await launcher.launchUrl(phoneUri);
            } else {
              throw Exception('Could not launch phone number: $destination');
            }
          }
        }
      } else {
        throw Exception('Invalid input type. Expected String.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error launching: $e');
      }
      _showDialog(context, title: e.toString(), content: e.toString());
      // Handle the error gracefully (maybe show a toast or log it)
    }
  }

  void _showDialog(BuildContext context, {String? title, String? content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(content!),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
