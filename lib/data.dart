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
      "checked": true,
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

  List<Block> getBlocks() {
    if (_json case {"blocks": List blockJsonList}) {
      return [for (final blockJson in blockJsonList) Block.fromJson(blockJson)];
    } else {
      throw const FormatException("Unexpected JSON");
    }
  }
}

sealed class Block {
  Block();

  factory Block.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {'type': 'h1', 'text': String text} => HeaderBlock(text),
      {'type': 'p', 'text': String text} => ParagraphBlock(text),
      {'type': 'checkbox', 'text': String text, 'checked': bool checked} =>
        CheckboxBlock(text, checked),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
}

class HeaderBlock extends Block {
  final String text;
  HeaderBlock(this.text);
}

class ParagraphBlock extends Block {
  final String text;
  ParagraphBlock(this.text);
}

class CheckboxBlock extends Block {
  final String text;
  final bool isChecked;
  CheckboxBlock(this.text, this.isChecked);
}
