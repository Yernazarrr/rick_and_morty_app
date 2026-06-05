import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

/// Применяет debounce к событиям и перезапускает, чтобы обрабатывалось только последнее.
/// Используется для поиска «на лету», чтобы не слать запрос на каждое нажатие клавиши.
EventTransformer<E> debounceRestartable<E>(Duration duration) {
  return (events, mapper) =>
      restartable<E>().call(events.debounce(duration), mapper);
}

/// Обрабатывает события последовательно, но throttle'ит всплески — для пагинации.
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) =>
      droppable<E>().call(events.throttle(duration), mapper);
}
