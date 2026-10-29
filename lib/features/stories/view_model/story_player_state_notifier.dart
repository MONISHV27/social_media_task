import 'package:flutter/foundation.dart';

class StoryPlayerStateNotifier<T> extends ValueNotifier<T> {
  StoryPlayerStateNotifier(super.value);
}

sealed class StoryPlayerState {}

final class StoryPlayInitialState extends StoryPlayerState {}

final class StoryLoadingState extends StoryPlayerState {}

final class StoryPlayingState extends StoryPlayerState {}

final class StoryPlayErrorState extends StoryPlayerState {}
