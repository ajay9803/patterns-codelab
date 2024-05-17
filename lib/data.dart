import 'dart:convert';

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';

class Document {
  final Map<String, Object?> _json;
  Document() : _json = jsonDecode(documentJson);

  // record - getter
  // access un-named field with metaData.$1
  // access named filed with metaData.date
  (String, {DateTime date}) get metaData {
    return ("My Document", date: DateTime.now());
  }
}
