import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  Color whiteColor = const Color(0XFFF2F2F2);
  Color blackColor = const Color(0XFF0C110F);
  Color buttonColor = const Color(0XFF42A5F5);

  String qrData = 'https://github.com/studio-xd/Flutter';
  TextEditingController qrDataController = TextEditingController();
  final qrKey = GlobalKey();

  @override
  void dispose() {
    qrDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(child:  Text('Create your QR Code', style: TextStyle(color: Colors.white),),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 60,),

            const SizedBox(
              height: 20,
            ),
            Container(
              height: 295,
              width: 295,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(0),
              ),
              child: RepaintBoundary(
                key: qrKey,
                child: QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 300,
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.circle,
                    color: blackColor,
                  ),
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: blackColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: qrDataController,
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
              cursorColor: blackColor,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(200),
                  ),
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(200),
                  ),
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (qrDataController.text.isNotEmpty) {
                  setState(() {
                    qrData = qrDataController.text;
                  });
                }
              },
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    'Generate',
                    style:  GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
