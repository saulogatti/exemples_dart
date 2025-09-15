// import 'package:exemplos_flutter/logs/widget/exemplo_erros.dart';
// import 'package:exemplos_flutter/logs/widget/line_log_widget.dart';
// import 'package:flutter/material.dart';

// class Over {
//   OverlayEntry? overlayEntry;
//   int currentPageIndex = 0;

//   void createHighlightOverlay({
//     required BuildContext context,
//     required Widget overlayChild,
//     required AlignmentDirectional alignment,
//     required Color borderColor,
//   }) {
//     // Remove the existing OverlayEntry.
//     removeHighlightOverlay();

//     assert(overlayEntry == null);

//     Widget builder(BuildContext context) {
//       final (String label, Color? color) = switch (currentPageIndex) {
//         0 => ('Explore page', Colors.red),
//         1 => ('Commute page', Colors.green),
//         2 => ('Saved page', Colors.orange),
//         _ => ('No page selected.', null),
//       };
//       if (color == null) {
//         return Text(label);
//       }
//       return Column(
//         children: <Widget>[
//           Text(label, style: TextStyle(color: color)),
//           Icon(Icons.arrow_downward, color: color),
//         ],
//       );
//     }

//     overlayEntry = OverlayEntry(
//       // Create a new OverlayEntry.
//       builder: (BuildContext context) {
//         // Align is used to position the highlight overlay
//         // relative to the NavigationBar destination.
//         return SafeArea(
//           child: Align(
//             alignment: alignment,
//             heightFactor: 1.0,
//             child: LineLogWidget(index: 0, log: listLog[0]),
//           ),
//         );
//       },
//     );

//     // Add the OverlayEntry to the Overlay.
//     Overlay.of(context, debugRequiredFor: overlayChild).insert(overlayEntry!);
//   }

//   // Remove the OverlayEntry.
//   void removeHighlightOverlay() {
//     overlayEntry?.remove();
//     overlayEntry?.dispose();
//     overlayEntry = null;
//   }
// }
