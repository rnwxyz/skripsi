import 'package:flutter/material.dart';

class ApproveScreen extends StatefulWidget {
  const ApproveScreen({super.key});

  @override
  State<ApproveScreen> createState() => _ApproveScreenState();
}

class _ApproveScreenState extends State<ApproveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SafeArea(
        minimum: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selamat Anda Diterima !',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.check_circle,
                size: 200,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              Text(
                'Anda layak untuk mengajukan kredit. Untuk informasi lebih lanjut, silahkan hubungi customer service kami, atau datang langsung ke kantor kami.',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              // infromasi kontak dan alamat kantor
              Text(
                'PT. Kredit Nusantara',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
              Text(
                'Jl. Jendral Sudirman No. 1, Jimbaran',
                style: TextStyle(
                  fontSize: 15,
                ),
                // textAlign: TextAlign.end,
              ),
              Text(
                'Telp. (021) 1234567',
                style: TextStyle(
                  fontSize: 15,
                ),
                // textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
