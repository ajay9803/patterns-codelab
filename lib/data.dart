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
  (String, {DateTime modified}) get metaData {
    if (_json
        case {
          "metadata": {
            "title": String title,
            "modified": String modified,
          }
        }) {
      return (title, modified: DateTime.parse(modified));
    } else {
      throw const FormatException("Unexpected JSON");
    }
  }
}
