import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBarError(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        content: Text(message, style: GoogleFonts.roboto(color: Colors.white, fontSize: 20)));

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackSuccess(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.greenAccent.withOpacity(0.9),
        content: Text(message, style: GoogleFonts.roboto(color: Colors.white, fontSize: 20)));

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showProcessingIndicator(BuildContext context) {
    const AlertDialog dialog = AlertDialog(
      content: SizedBox(
        width: 100,
        height: 100,
        child: Center(child: Image(image: AssetImage('assets/football-soccer.gif'))),
        //     child: Center(child: CircularProgressIndicator(color: Colors.green, strokeWidth: 10)),
      ),
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
