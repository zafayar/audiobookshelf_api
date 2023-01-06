import 'dart:convert';

import 'package:audiobookshelf_api/audiobookshelf_api.dart';
import 'package:test/test.dart';

import '../../matchers.dart';
import '../schemas/json/collection_json.dart' as collection;

void main() {
  group('GetLibrarysCollectionsResponse', tags: [
    'has_dependencies',
    'depends_on_Collection',
  ], () {
    const int total = 1;
    const int limit = 1;
    const int page = 1;
    const bool minified = true;

    final json = {
      'results': [collection.json],
      'total': total,
      'limit': limit,
      'page': page,
      'minified': minified,
    };

    late GetLibrarysCollectionsResponse sut;

    setUp(() {
      sut = GetLibrarysCollectionsResponse(
        results: [collection.collection],
        total: total,
        limit: limit,
        page: page,
        minified: minified,
      );
    });

    test('fromJson', () {
      final fromJson = GetLibrarysCollectionsResponse.fromJson(json);
      expect(sut, fromJson);
    });

    test('toJson', () {
      expect(jsonDecode(jsonEncode(sut.toJson())), deepMapContains(json));
    });
  });
}
