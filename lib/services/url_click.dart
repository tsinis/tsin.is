import 'dart:html' as html;

void openURL(String _url, {String name = ''}) => html.window.open(
    'https://' + _url.toLowerCase() + (name.isEmpty ? '' : 'tsinis'),
    name.isEmpty ? _url : name);
