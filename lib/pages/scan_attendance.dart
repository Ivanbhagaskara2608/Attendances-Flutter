import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/status_radio.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:flutter_application_1/widgets/camera_zoom.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AttendanceScanner extends StatefulWidget {
  const AttendanceScanner({super.key});

  @override
  State<AttendanceScanner> createState() => _AttendanceScannerState();
}

class _AttendanceScannerState extends State<AttendanceScanner> {
  bool isScanCompleted = false;
  bool isFlashOn = false;
  MobileScannerController scannerController = MobileScannerController();
  List<StatusRadio> radioItems = [];

  @override
  void initState() {
    super.initState();
    radioItems.add(StatusRadio(true, "1X"));
    radioItems.add(StatusRadio(false, "2X"));
    radioItems.add(StatusRadio(false, "5X"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isFlashOn = !isFlashOn;
                  });
                  scannerController.toggleTorch();
                },
                icon: Icon(
                  Icons.flash_on,
                  color:
                      isFlashOn ? Color.fromARGB(255, 44, 62, 80) : Colors.grey,
                ))
          ],
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color.fromARGB(255, 44, 62, 80),
              )),
          centerTitle: true,
          title: Text(
            "Scan Attendance Code",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 44, 62, 80)),
          ),
          elevation: 1),
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 40),
        child: Center(
          child: Column(
            children: [
              Text(
                "Scan QR",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 44, 62, 80)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  textAlign: TextAlign.center,
                  "Please point your camera at the QR code to scan for attendance.",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 44, 62, 80)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Stack(
                      children: [
                        // Widget pertama (MobileScanner)
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: MobileScanner(
                              controller: scannerController,
                              onDetect: (barcode) {
                                if (!isScanCompleted) {
                                  String code = barcode.barcodes.toString();

                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Barcode Detected'),
                                        content: Text('Code: $code'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: Text('Close'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),

                        // Widget kedua (ListView.builder)
                        Positioned(
                          bottom: 10, // Atur ke bawah
                          left: 140, // Atur ke kiri
                          right: 0, // Atur ke kanan
                          child: SizedBox(
                            height: 40, // Sesuaikan tinggi sesuai kebutuhan
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: radioItems.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      for (var element in radioItems) {
                                        element.isSelected = false;
                                      }
                                      radioItems[index].isSelected = true;
                                    });
                                  },
                                  child: CameraZoomIndicator(radioItems[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 2,
                            child: Container(
                              color: Color.fromARGB(255, 44, 62, 80),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text("OR"),
                          ),
                          SizedBox(
                            width: 30,
                            height: 2,
                            child: Container(
                              color: Color.fromARGB(255, 44, 62, 80),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 44, 62, 80),
                              minimumSize: Size.fromHeight(35),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.headset_mic_rounded,
                              color: Color.fromARGB(255, 44, 62, 80),
                            ),
                            Text(
                              "Need help?",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 44, 62, 80)),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
