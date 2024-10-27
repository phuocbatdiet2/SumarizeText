import 'package:app_bert/app/chart.dart';
import 'package:app_bert/app/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController fileController = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  Future<void> fetchSummary() async {
    String textToSummarize = fileController.text;
    if (textToSummarize.isEmpty) {
      // You might want to show a snackbar or a dialog
      return;
    }

  final url = Uri.parse('http://192.168.2.13:5000/summarize');
      try {
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'text': textToSummarize}));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        resultController.text = jsonResponse['summary'];
      } else {
        // Handle error response
        final jsonResponse = json.decode(response.body);
        resultController.text = 'Error: ${jsonResponse['error']}';
      }
    } catch (e) {
      // Handle network error
      resultController.text = 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: Colors.blueAccent,
            elevation: 8,
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo.png', height: 50),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.show_chart),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ChartScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.person),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'File Văn Bản Cần Dịch',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Colors.white, Color(0xFFE0F7FA)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: fileController,
                      maxLines: null,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập nội dung cần dịch...',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.blueAccent,
                    size: 50,
                  ),
                  onPressed: () {
                    // Add your file picker logic here
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: fetchSummary, // Call fetchSummary on button press
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                  backgroundColor: Colors.blueAccent,
                  shadowColor: Colors.blueAccent.withOpacity(0.5),
                ),
                child: const Text(
                  'Xử Lý',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [Colors.white, Color(0xFFE0F7FA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: TextFormField(
                controller: resultController,
                maxLines: null,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Kết quả sẽ được hiển thị ở đây...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
