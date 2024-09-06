import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/common/app_constants.dart';
import 'package:news_app/modules/home/models/news_feed_response.dart';

class NewFeedService {
  static Future<NewFeedListResponse?> fetchNewsFeeds() async {
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=${AppConstants.API_KEY}");
    var completer = Completer<NewFeedListResponse?>();
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final model = NewFeedListResponse.fromJson(data);
        completer.complete(model);
      }
    } on TimeoutException catch (error) {
      String em = error.message ?? "Something went wrong";
      completer.completeError(em);
    } on SocketException catch (error) {
      String em = error.message;
      completer.completeError(em);
    } on HttpException catch (error) {
      String em = error.message;
      completer.completeError(em);
    } on Error catch (error) {
      print(error);
      completer.completeError("Something went wrong");
    } catch (e) {
      completer.completeError("Something went wrong");
    }
    return completer.future;
  }
}
