import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [Text('BuildACtions')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('BuildLeading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('BuildSuggestions');
  }

}