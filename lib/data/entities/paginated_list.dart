import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_list.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class PaginatedList<T> extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  const PaginatedList(this.count, this.next, this.previous, this.results);

  factory PaginatedList.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return _$PaginatedListFromJson(
        json, (json) => fromJsonT(json as Map<String, dynamic>));
  }

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}
