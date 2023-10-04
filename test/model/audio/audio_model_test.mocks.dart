// Mocks generated by Mockito 5.4.2 from annotations
// in treasure_of_the_high_seas/test/model/audio/audio_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:typed_data' as _i4;

import 'package:audioplayers/audioplayers.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAudioCache_0 extends _i1.SmartFake implements _i2.AudioCache {
  _FakeAudioCache_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCompleter_1<T> extends _i1.SmartFake implements _i3.Completer<T> {
  _FakeCompleter_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AudioPlayer].
///
/// See the documentation for Mockito's code generation for more information.
class MockAudioPlayer extends _i1.Mock implements _i2.AudioPlayer {
  @override
  _i2.AudioCache get audioCache => (super.noSuchMethod(
        Invocation.getter(#audioCache),
        returnValue: _FakeAudioCache_0(
          this,
          Invocation.getter(#audioCache),
        ),
        returnValueForMissingStub: _FakeAudioCache_0(
          this,
          Invocation.getter(#audioCache),
        ),
      ) as _i2.AudioCache);
  @override
  set audioCache(_i2.AudioCache? _audioCache) => super.noSuchMethod(
        Invocation.setter(
          #audioCache,
          _audioCache,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get playerId => (super.noSuchMethod(
        Invocation.getter(#playerId),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i3.Completer<void> get creatingCompleter => (super.noSuchMethod(
        Invocation.getter(#creatingCompleter),
        returnValue: _FakeCompleter_1<void>(
          this,
          Invocation.getter(#creatingCompleter),
        ),
        returnValueForMissingStub: _FakeCompleter_1<void>(
          this,
          Invocation.getter(#creatingCompleter),
        ),
      ) as _i3.Completer<void>);
  @override
  double get volume => (super.noSuchMethod(
        Invocation.getter(#volume),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);
  @override
  double get balance => (super.noSuchMethod(
        Invocation.getter(#balance),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);
  @override
  double get playbackRate => (super.noSuchMethod(
        Invocation.getter(#playbackRate),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);
  @override
  _i2.PlayerMode get mode => (super.noSuchMethod(
        Invocation.getter(#mode),
        returnValue: _i2.PlayerMode.mediaPlayer,
        returnValueForMissingStub: _i2.PlayerMode.mediaPlayer,
      ) as _i2.PlayerMode);
  @override
  _i2.ReleaseMode get releaseMode => (super.noSuchMethod(
        Invocation.getter(#releaseMode),
        returnValue: _i2.ReleaseMode.release,
        returnValueForMissingStub: _i2.ReleaseMode.release,
      ) as _i2.ReleaseMode);
  @override
  _i2.PlayerState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i2.PlayerState.stopped,
        returnValueForMissingStub: _i2.PlayerState.stopped,
      ) as _i2.PlayerState);
  @override
  set state(_i2.PlayerState? state) => super.noSuchMethod(
        Invocation.setter(
          #state,
          state,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Stream<_i2.AudioEvent> get eventStream => (super.noSuchMethod(
        Invocation.getter(#eventStream),
        returnValue: _i3.Stream<_i2.AudioEvent>.empty(),
        returnValueForMissingStub: _i3.Stream<_i2.AudioEvent>.empty(),
      ) as _i3.Stream<_i2.AudioEvent>);
  @override
  _i3.Stream<_i2.PlayerState> get onPlayerStateChanged => (super.noSuchMethod(
        Invocation.getter(#onPlayerStateChanged),
        returnValue: _i3.Stream<_i2.PlayerState>.empty(),
        returnValueForMissingStub: _i3.Stream<_i2.PlayerState>.empty(),
      ) as _i3.Stream<_i2.PlayerState>);
  @override
  _i3.Stream<Duration> get onPositionChanged => (super.noSuchMethod(
        Invocation.getter(#onPositionChanged),
        returnValue: _i3.Stream<Duration>.empty(),
        returnValueForMissingStub: _i3.Stream<Duration>.empty(),
      ) as _i3.Stream<Duration>);
  @override
  _i3.Stream<Duration> get onDurationChanged => (super.noSuchMethod(
        Invocation.getter(#onDurationChanged),
        returnValue: _i3.Stream<Duration>.empty(),
        returnValueForMissingStub: _i3.Stream<Duration>.empty(),
      ) as _i3.Stream<Duration>);
  @override
  _i3.Stream<void> get onPlayerComplete => (super.noSuchMethod(
        Invocation.getter(#onPlayerComplete),
        returnValue: _i3.Stream<void>.empty(),
        returnValueForMissingStub: _i3.Stream<void>.empty(),
      ) as _i3.Stream<void>);
  @override
  _i3.Stream<void> get onSeekComplete => (super.noSuchMethod(
        Invocation.getter(#onSeekComplete),
        returnValue: _i3.Stream<void>.empty(),
        returnValueForMissingStub: _i3.Stream<void>.empty(),
      ) as _i3.Stream<void>);
  @override
  _i3.Stream<String> get onLog => (super.noSuchMethod(
        Invocation.getter(#onLog),
        returnValue: _i3.Stream<String>.empty(),
        returnValueForMissingStub: _i3.Stream<String>.empty(),
      ) as _i3.Stream<String>);
  @override
  _i3.Future<void> play(
    _i2.Source? source, {
    double? volume,
    double? balance,
    _i2.AudioContext? ctx,
    Duration? position,
    _i2.PlayerMode? mode,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #play,
          [source],
          {
            #volume: volume,
            #balance: balance,
            #ctx: ctx,
            #position: position,
            #mode: mode,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setAudioContext(_i2.AudioContext? ctx) =>
      (super.noSuchMethod(
        Invocation.method(
          #setAudioContext,
          [ctx],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setPlayerMode(_i2.PlayerMode? mode) => (super.noSuchMethod(
        Invocation.method(
          #setPlayerMode,
          [mode],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> pause() => (super.noSuchMethod(
        Invocation.method(
          #pause,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> stop() => (super.noSuchMethod(
        Invocation.method(
          #stop,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> resume() => (super.noSuchMethod(
        Invocation.method(
          #resume,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> release() => (super.noSuchMethod(
        Invocation.method(
          #release,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> seek(Duration? position) => (super.noSuchMethod(
        Invocation.method(
          #seek,
          [position],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setBalance(double? balance) => (super.noSuchMethod(
        Invocation.method(
          #setBalance,
          [balance],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setVolume(double? volume) => (super.noSuchMethod(
        Invocation.method(
          #setVolume,
          [volume],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setReleaseMode(_i2.ReleaseMode? releaseMode) =>
      (super.noSuchMethod(
        Invocation.method(
          #setReleaseMode,
          [releaseMode],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setPlaybackRate(double? playbackRate) => (super.noSuchMethod(
        Invocation.method(
          #setPlaybackRate,
          [playbackRate],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setSource(_i2.Source? source) => (super.noSuchMethod(
        Invocation.method(
          #setSource,
          [source],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setSourceUrl(String? url) => (super.noSuchMethod(
        Invocation.method(
          #setSourceUrl,
          [url],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setSourceDeviceFile(String? path) => (super.noSuchMethod(
        Invocation.method(
          #setSourceDeviceFile,
          [path],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setSourceAsset(String? path) => (super.noSuchMethod(
        Invocation.method(
          #setSourceAsset,
          [path],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setSourceBytes(_i4.Uint8List? bytes) => (super.noSuchMethod(
        Invocation.method(
          #setSourceBytes,
          [bytes],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<Duration?> getDuration() => (super.noSuchMethod(
        Invocation.method(
          #getDuration,
          [],
        ),
        returnValue: _i3.Future<Duration?>.value(),
        returnValueForMissingStub: _i3.Future<Duration?>.value(),
      ) as _i3.Future<Duration?>);
  @override
  _i3.Future<Duration?> getCurrentPosition() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentPosition,
          [],
        ),
        returnValue: _i3.Future<Duration?>.value(),
        returnValueForMissingStub: _i3.Future<Duration?>.value(),
      ) as _i3.Future<Duration?>);
  @override
  _i3.Future<void> dispose() => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [AudioModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockAudioModel extends _i1.Mock implements _i5.AudioModel {
  @override
  _i3.Future<void> loopMusic(String? track) => (super.noSuchMethod(
        Invocation.method(
          #loopMusic,
          [track],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> pauseMusic() => (super.noSuchMethod(
        Invocation.method(
          #pauseMusic,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> resumeMusic() => (super.noSuchMethod(
        Invocation.method(
          #resumeMusic,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> playSound(String? sound) => (super.noSuchMethod(
        Invocation.method(
          #playSound,
          [sound],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}