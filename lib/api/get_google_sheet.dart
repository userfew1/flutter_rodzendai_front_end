import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GetDataGoogleSheets extends StatefulWidget {
  const GetDataGoogleSheets({super.key});

  @override
  State<GetDataGoogleSheets> createState() => _GetDataGoogleSheetsState();
}

class _GetDataGoogleSheetsState extends State<GetDataGoogleSheets> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    fetchGoogleSheetsData();
  }

  Future<void> fetchGoogleSheetsData() async {
    final url = Uri.parse(
        'https://docs.google.com/spreadsheets/d/1Po1EqeHklF4skRfn_Mm6nc88883P-BST-a6_nDN8qCU/gviz/tq?tqx=out:json');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonString = response.body.substring(47, response.body.length - 2); // ลบส่วนเกินของ JSON
      final jsonData = json.decode(jsonString);

      List<Map<String, dynamic>> extractedData = [];
      for (var i = 1; i < jsonData['table']['rows'].length; i++) { // เริ่มที่ row 2
        var row = jsonData['table']['rows'][i]['c'];

        extractedData.add({
          "I": row[8] != null ? row[8]['v'] : "",
          "J": row[9] != null ? row[9]['v'] : "",
          "D": row[3] != null ? row[3]['v'] : "",
          "Q": row[16] != null ? row[16]['v'] : "",
          "B": row[1] != null ? row[1]['v'] : "",
        });
      }

      setState(() {
        data = extractedData;
      });
    } else {
      throw Exception('Failed to load data from Google Sheets');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Sheets Data')),
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text("I: ${data[index]['I']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("J: ${data[index]['J']}"),
                        Text("D: ${data[index]['D']}"),
                        Text("Q: ${data[index]['Q']}"),
                        Text("B: ${data[index]['B']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
