import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';



void main() {
  runApp(const Fitbittest());
}

class Fitbittest extends StatefulWidget {
  const Fitbittest({super.key});

  @override
  State<Fitbittest> createState() => _FitbittestState();
}

class _FitbittestState extends State<Fitbittest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeScreen(title: "new",),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({super.key, required this.title});
  final String title;
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}
class _MyHomeScreenState extends State<MyHomeScreen> {
  late TwilioFlutter twilioFlutter;
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACf3126ae3731c0b9f631bfef792d2690f',
        authToken: 'ecc6ac68af4ef6324e931ad557cc4cb9',
        twilioNumber: '+12766630291');
    super.initState();
  }
  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: ' +237653132183', messageBody: 'Wahhh boy Montero\nWe work how nor pa?.');
  }
  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);
    await twilioFlutter.getSMS('***************************');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Press the button to send SMS.',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}