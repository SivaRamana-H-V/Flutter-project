import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  final String searchQuery;

  const SearchResultPage(this.searchQuery, {super.key});

  @override
  Widget build(BuildContext context) {
    // Implement your search result page here
    // You can use the searchQuery to fetch data and display the results
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: Center(
        child: Text('Search results for: $searchQuery'),
      ),
    );
  }
}
