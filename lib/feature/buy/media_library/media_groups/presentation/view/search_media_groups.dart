import 'package:advedro/common/common.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';

import '../../data/model/response/media_groups_model.dart';

class SearchMediaGroups extends SearchDelegate<GroupItem?> {
  final List<GroupItem> items;

  SearchMediaGroups(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if(query != "") IconButton(icon: const Icon(Icons.clear), onPressed: () {
        query = "";
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ), onPressed: () {
      close(context, null);
    },);
  }


  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  List<GroupItem> get _filtered =>
      query.isEmpty
          ? []
          : items.where((e) => e.name.toLowerCase().contains(query)).toList();

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _filtered;

    if(suggestions.isEmpty) {
      if(query.isEmpty) {
        return const NoData(
          icon: Icons.search,
          title: "Search for existing groups",
          subtitle: "Start typing for searching groups",
        );
      } else {
        return const NoData(
          icon: Icons.search_off,
          title: "No group found!",
          subtitle: "Enter new searing phrase!",
        );
      }
    } else {
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (content, index) {
          final item = suggestions[index];
          return ListTile(
            // dense: true,
            onTap: () => close(context, item),
            leading: const Icon(Icons.circle,),
            title: Text(item.name),
            // subtitle: Text(item.status.name),
          );
        },
      );
    }
  }


  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    final theme = super.appBarTheme(context);
    final appBarTheme = theme.appBarTheme.copyWith(
      shape: AppDesigns.titleBarShape,
      toolbarHeight: 70,
    );
    return theme.copyWith(appBarTheme: appBarTheme);
  }
}