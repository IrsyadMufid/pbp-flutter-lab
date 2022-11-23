import 'package:counter_7/models/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Mywatchlist>> fetchWatchlist() async {
  var url = Uri.parse('https://mocki.io/v1/9c50014e-7061-4f35-9852-d50a9a640dc6');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchlist
  List<Mywatchlist> listMyWatchlist = [];
  for (var d in data) {
    if (d != null) {
      listMyWatchlist.add(Mywatchlist.fromJson(d));
    }
  }

  return listMyWatchlist;
}