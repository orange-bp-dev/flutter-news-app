import 'dart:convert';
import 'package:flutter_news_hacker/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final response = await client.get('$_root/topstories.json');
    final ids = json.decode(response.body);

    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get('$_root/itbem/$id.json?print=pretty');
    final parsedJson = json.decode(response.body);
    final modeledData = ItemModel.fromJson(parsedJson);

    //モデルを通す前と後とではどう違いますか？？
    print(parsedJson);
    print(modeledData);

    return modeledData;
  }
}
