import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../widgets/social_icons.dart';
import '../extensions/hover_extensions.dart';


class Website extends FlatButton {
  Website(this.website);

  final IconData website;

  String get _url => _urls[website];

  String get _name => _url.substring(0, _url.indexOf("."));

  @override
  Widget build(BuildContext context) => FlatButton.icon(
      icon: Icon(website),
      label: Text(_name),
      onPressed: () => html.window.open('https://' + _url + 'tsinis', _name),).showCursorOnHover.moveUpOnHover;
}
final Map<IconData, String> _urls = {
  SocialIcons.dribbble: 'Dribbble.com/',
  SocialIcons.linkedin_squared: 'LinkedIn.com/in/',
  SocialIcons.github_squared: 'Github.com/',
  SocialIcons.medium: 'Medium.com/@',
  SocialIcons.cloud: 'Rive.app/a/',
  SocialIcons.vimeo_squared: 'Vimeo.com/',
};