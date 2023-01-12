import 'package:audiobookshelf_api/audiobookshelf_api.dart';
import 'package:audiobookshelf_api/src/utils/json_converters.dart';
import 'package:test/test.dart';

import '../../matchers.dart';
import 'json/device_info_json.dart' as device_info;
import 'json/podcast_metadata_json.dart' as podcast_metadata;
import 'json/session_user_json.dart' as session_user;
import 'json/library_item_json.dart' as library_item;

void main() {
  group('PlaybackSession', tags: [
    'has_dependencies',
    'depends_on_MediaMetadata',
    'depends_on_DeviceInfo',
    'depends_on_SessionUser',
    'depends_on_LibraryItem',
  ], () {
    const id = 'play_c786zm3qtjz6bd5q3n';
    const userId = 'root';
    const libraryId = 'lib_p9wkw2i85qy9oltijt';
    const libraryItemId = 'li_bufnnmp4y5o2gbbxfm';
    const episodeId = 'ep_lh6ko39pumnrma3dhv';
    const mediaTypeJson = 'podcast';
    const mediaType = MediaType.podcast;
    const displayTitle = '1 - Pilot';
    const displayAuthor = 'Night Vale Presents';
    const coverPath = '/metadata/items/li_bufnnmp4y5o2gbbxfm/cover.jpg';
    const durationJson = 1454.18449;
    final duration =
        const DurationPreciseSecondsConverter().fromJson(durationJson);
    const playMethodJson = 0;
    const playMethod = PlayMethod.directPlay;
    const mediaPlayer = 'unknown';
    const date = '2022-11-11';
    const dayOfWeek = 'Friday';
    const timeListeningJson = 0;
    const timeListening = Duration.zero;
    const startTimeJson = 0;
    const startTime = Duration.zero;
    const currentTimeJson = 0;
    const currentTime = Duration.zero;
    const startedAtJson = 1668206493239;
    final startedAt = const DateTimeEpochConverter().fromJson(startedAtJson);
    const updatedAtJson = 1668206493239;
    final updatedAt = const DateTimeEpochConverter().fromJson(updatedAtJson);

    const json = {
      'id': id,
      'userId': userId,
      'libraryId': libraryId,
      'libraryItemId': libraryItemId,
      'episodeId': episodeId,
      'mediaType': mediaTypeJson,
      'mediaMetadata': podcast_metadata.json,
      'chapters': <Map<String, Object?>>[],
      'displayTitle': displayTitle,
      'displayAuthor': displayAuthor,
      'coverPath': coverPath,
      'duration': durationJson,
      'playMethod': playMethodJson,
      'mediaPlayer': mediaPlayer,
      'deviceInfo': device_info.json,
      'date': date,
      'dayOfWeek': dayOfWeek,
      'timeListening': timeListeningJson,
      'startTime': startTimeJson,
      'currentTime': currentTimeJson,
      'startedAt': startedAtJson,
      'updatedAt': updatedAtJson,
      'user': session_user.json,
    };

    const jsonExpanded = {
      'id': id,
      'userId': userId,
      'libraryId': libraryId,
      'libraryItemId': libraryItemId,
      'episodeId': episodeId,
      'mediaType': mediaTypeJson,
      'mediaMetadata': podcast_metadata.json,
      'chapters': <Map<String, Object?>>[],
      'displayTitle': displayTitle,
      'displayAuthor': displayAuthor,
      'coverPath': coverPath,
      'duration': durationJson,
      'playMethod': playMethodJson,
      'mediaPlayer': mediaPlayer,
      'deviceInfo': device_info.json,
      'date': date,
      'dayOfWeek': dayOfWeek,
      'timeListening': timeListeningJson,
      'startTime': startTimeJson,
      'currentTime': currentTimeJson,
      'startedAt': startedAtJson,
      'updatedAt': updatedAtJson,
      'audioTracks': <Map<String, Object?>>[],
      'libraryItem': library_item.podcastJsonExpanded,
    };

    late PlaybackSession sut;
    late PlaybackSession sutExpanded;

    setUp(() {
      sut = PlaybackSession(
        id: id,
        userId: userId,
        libraryId: libraryId,
        libraryItemId: libraryItemId,
        episodeId: episodeId,
        mediaType: mediaType,
        mediaMetadata: podcast_metadata.podcastMetadata,
        chapters: [],
        displayTitle: displayTitle,
        displayAuthor: displayAuthor,
        coverPath: coverPath,
        duration: duration,
        playMethod: playMethod,
        mediaPlayer: mediaPlayer,
        deviceInfo: device_info.deviceInfo,
        date: date,
        dayOfWeek: dayOfWeek,
        timeListening: timeListening,
        startTime: startTime,
        currentTime: currentTime,
        startedAt: startedAt,
        updatedAt: updatedAt,
        user: session_user.sessionUser,
      );
      sutExpanded = PlaybackSession.expanded(
        id: id,
        userId: userId,
        libraryId: libraryId,
        libraryItemId: libraryItemId,
        episodeId: episodeId,
        mediaType: mediaType,
        mediaMetadata: podcast_metadata.podcastMetadata,
        chapters: [],
        displayTitle: displayTitle,
        displayAuthor: displayAuthor,
        coverPath: coverPath,
        duration: duration,
        playMethod: playMethod,
        mediaPlayer: mediaPlayer,
        deviceInfo: device_info.deviceInfo,
        date: date,
        dayOfWeek: dayOfWeek,
        timeListening: timeListening,
        startTime: startTime,
        currentTime: currentTime,
        startedAt: startedAt,
        updatedAt: updatedAt,
        audioTracks: [],
        libraryItem: library_item.podcastLibraryItemExpanded,
      );
    });

    group('fromJson', () {
      test('base', () {
        expect(sut, PlaybackSession.fromJson(json));
      });

      test('expanded', () {
        expect(sutExpanded, PlaybackSession.fromJson(jsonExpanded));
      });

      test('runtimeType', () {
        expect(
          sut,
          PlaybackSession.fromJson({
            ...json,
            'runtimeType': 'default',
          }),
        );
      });
    });

    group('toJson', () {
      test('base', () {
        expect(sut.toJson(), deepMapContains(json));
      });

      test('expanded', () {
        expect(sutExpanded.toJson(), deepMapContains(jsonExpanded));
      });

      test('converter', () {
        expect(
          const PlaybackSessionConverter().toJson(sut),
          deepMapContains(json),
        );
      });
    });

    group('variant', () {
      test('base', () {
        expect(sut.variant, SchemaVariant.base);
      });

      test('expanded', () {
        expect(sutExpanded.variant, SchemaVariant.expanded);
      });
    });
  });
}
