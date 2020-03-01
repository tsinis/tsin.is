import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Color _backgroundColor;
  const Header(this._backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Row(
        children: <Widget>[
          Text(
            'tsin.is',
            style: Theme.of(context).textTheme.caption,
          ),
          Spacer(),
          if (MediaQuery.of(context).size.width > 900) ...[
            Text('Home'),
            SizedBox(width: 32),
            Text('Portfolio'),
            SizedBox(width: 32),
            Text('About'),
            SizedBox(width: 32),
            // Text('Gallery'),
            // SizedBox(width: 32),
            Text('Contact'),
            SizedBox(width: 64),
          ],
          Icon(
            Icons.menu,
            // color: _backgroundColor,
            size: 32,
          ),
        ],
      ),
    );
  }
}
