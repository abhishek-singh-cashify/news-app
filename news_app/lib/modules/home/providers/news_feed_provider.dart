import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/news_feed_response.dart';
import '../services/news_feed_service.dart';

class NewsFeedProvider extends ChangeNotifier {
  static NewsFeedProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<NewsFeedProvider>(context, listen: listen);
  }

  String? errorMessage;
  bool isDataLoading = true;
  List<NewsFeedResponse> newsFeeds = [];

  NewsFeedProvider() {
    _fetchNewsFeeds();
  }

  refreshContent() {
    isDataLoading = true;
    notifyListeners();
    _fetchNewsFeeds();
  }

  _fetchNewsFeeds() {
    errorMessage = null;
    NewFeedService.fetchNewsFeeds().then((value) {
      isDataLoading = false;
      if (value != null && value.feeds != null) {
        newsFeeds = value.feeds!;
        for (var element in newsFeeds) {
          print(element.toJson());
        }
      }
      notifyListeners();
    }, onError: (error) {
      isDataLoading = false;
      errorMessage = error.toString();
      print("Error message->$errorMessage");
      notifyListeners();
    });
  }
}
