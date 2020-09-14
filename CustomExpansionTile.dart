import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryExpansionTile extends StatelessWidget {
  final String title;
  final Color color;
  final List<Widget> children;

  CategoryExpansionTile({this.title, this.color, this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: color,
        child: ExpansionTile(
          trailing: Text(""),
          children: children,
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  "$title",
                  style: GoogleFonts.ibmPlexSans(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChildOfCategoryTile extends StatelessWidget {
  final String title;
  final bool fav;

  ChildOfCategoryTile({this.title, this.fav});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(32, 10, 10, 10),
      title: Text(
        this.title,
        style: GoogleFonts.ibmPlexSans(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      trailing: this.fav ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border),
      onTap: () {},
    );
  }
}
