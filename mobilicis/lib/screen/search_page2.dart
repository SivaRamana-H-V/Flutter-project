import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> suggestions;

  CustomSearchDelegate(this.suggestions);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          close(context, '');
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results page here
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredSuggestions = query.isEmpty
        ? suggestions
        : suggestions.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: filteredSuggestions.length,
            itemBuilder: (context, index) {
              final suggestion = filteredSuggestions[index];
              return ListTile(
                title: Text(suggestion),
                onTap: () {
                  // Perform an action when a suggestion is tapped
                  close(context, suggestion);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
