import 'package:equatable/equatable.dart';

/// Generic paginated result wrapping the API's `info` + `results`.
class Paginated<T> extends Equatable {
  const Paginated({
    required this.items,
    required this.count,
    required this.pages,
    required this.hasNext,
  });

  final List<T> items;
  final int count;
  final int pages;
  final bool hasNext;

  @override
  List<Object?> get props => [items, count, pages, hasNext];
}
