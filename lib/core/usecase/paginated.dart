import 'package:equatable/equatable.dart';

/// Общий результат с разбивкой на страницы, заключающий в себе `info` + `results` API.
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
