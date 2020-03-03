import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Color _backgroundColor;
  const Header(this._backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        children: <Widget>[
          Text(
            'tsin.',
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.grey[400]),
          ),
          Text(
            'IS',
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey[400]),
          ),
          Spacer(),
          if (MediaQuery.of(context).size.width > 640) ...[
            // Text('Home'),
            // SizedBox(width: 32),
            Text(
              'About',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(width: 32),
            Text(
              'Portfolio',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(width: 32),
            // Text('Gallery'),
            // SizedBox(width: 32),
            Text(
              'Contact',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            // SizedBox(width: 64),
          ] else
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
