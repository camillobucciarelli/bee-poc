import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

@JsonSerializable(createToJson: false)
class TokenResponse extends Equatable {
  final String refresh;
  final String access;

  const TokenResponse(this.refresh, this.access);

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return _$TokenResponseFromJson(json);
  }

  @override
  List<Object?> get props => [
        refresh,
        access,
      ];
}
