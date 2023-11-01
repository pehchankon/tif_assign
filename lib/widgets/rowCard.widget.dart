import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowCard extends StatelessWidget {
  const RowCard({
    super.key,
  });

  final String imgSrc = 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8ff3d381-347b-45d7-a319-29aaa01999a4/deh6xlx-1c3f6f68-1fe1-42f7-ac15-f5281996197d.jpg/v1/fill/w_1012,h_790,q_70,strp/random_abstract_art_by_kasicookie18_deh6xlx-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTk5IiwicGF0aCI6IlwvZlwvOGZmM2QzODEtMzQ3Yi00NWQ3LWEzMTktMjlhYWEwMTk5OWE0XC9kZWg2eGx4LTFjM2Y2ZjY4LTFmZTEtNDJmNy1hYzE1LWY1MjgxOTk2MTk3ZC5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.P_Eub4PiJD9VFnwB_S0t92Z5iwFqlggoIeYlB9MHgig';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      height: 106,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red[50],
        // color:Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(87, 92, 138, 0.06),
            offset: Offset(0, 10),
            blurRadius: 35,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imgSrc,
              fit: BoxFit.cover,
              width: 80,
              height: 92,
            ),
          ),
          SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wed, Apr 28 • 5:30 PM',
                      style: GoogleFonts.inter(
                        color: Color.fromRGBO(86, 105, 255, 1),
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                        'Jo Malone London’s Mother’s Day Presents',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color.fromRGBO(18, 13, 38, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  Icon(
                    Icons.location_on,
                    size: 18,
                    color: Color.fromRGBO(116, 118, 136, 1),
                  ),
                  Text(
                    'Radius Gallery • Santa Cruz, CA',
                    style: GoogleFonts.inter(
                      color: Color.fromRGBO(116, 118, 136, 1),
                    ),
                  ),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
