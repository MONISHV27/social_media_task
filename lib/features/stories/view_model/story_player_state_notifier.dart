import 'package:flutter/material.dart';

class StoryPlayerStateNotifier extends ValueNotifier {
  StoryPlayerStateNotifier(super.value);
}

sealed class StoryPlayerState {}

final class StoryLoadingState extends StoryPlayerState {}

final class StoryPlayingState extends StoryPlayerState {}

final class StoryPlayErrorState extends StoryPlayerState {}
