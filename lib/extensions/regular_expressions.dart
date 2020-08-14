extension StringExtension on String {
  String capitalizeFirstLetter() => '${this[0].toUpperCase()}${substring(1)}';

  String shorten() => replaceAll(RegExp('[0-9]'), ' ').replaceAll(RegExp(r'\s+'), '…');
}
