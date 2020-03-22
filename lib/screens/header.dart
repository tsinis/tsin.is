import 'package:flutter/material.dart';
import '../extensions/hover_extensions.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var showCursorOnHover;
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Row(
        children: <Widget>[
          // RichText(
          //   text: TextSpan(
          //     // text: 'tsin.is ',
          //     style: Theme.of(context)
          //         .textTheme
          //         .caption
          //         .copyWith(color: Theme.of(context).primaryColorLight),
          //     children: <TextSpan>[
          //       TextSpan(text: 'tsin.'),
          //       TextSpan(
          //           text: 'IS',
          //           style:
          //               TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
          //     ],
          //   ),
          // ),
          // Text(
          //   'IS',
          //   style: Theme.of(context).textTheme.headline1.copyWith(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.grey[400]),
          // ),

          if (MediaQuery.of(context).size.width > 640.0) ...[
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => print('About Click'),
              child: Text(
                'About',
              ).showCursorOnHover.moveUpOnHover,
            ),
            SizedBox(width: 30.0),
            Text(
              'Portfolio',
            ).showCursorOnHover.moveUpOnHover,
            SizedBox(width: 30.0),
            Text(
              'Contact',
            ).showCursorOnHover.moveUpOnHover,
          ],
        ],
      ),
    );
  }
}
