import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:realtoonflix/models/webtoon_detail_model.dart';
import 'package:realtoonflix/models/webtoon_episode_model.dart';
import 'package:realtoonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> weebtoonInstance = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        weebtoonInstance.add(WebtoonModel.fromJson(webtoon));
        //print(WebtoonModel.fromJson(webtoon).title);
      }

      return weebtoonInstance;
    } else {
      throw Error();
    }
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    } else {
      throw Error();
    }
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesByID(
      String id) async {
    List<WebtoonEpisodeModel> episodeInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        episodeInstances.add(WebtoonEpisodeModel.fromJson(webtoon));
      }
      return episodeInstances;
    } else {
      throw Error();
    }
  }
}
