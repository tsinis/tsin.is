import 'dart:html' as html;

void click(String _url, {String name = ''}) => html.window.open(
    'https://' + _url.toLowerCase() + (name.isEmpty ? '' : 'tsinis'),
    name.isEmpty ? _url : name);
