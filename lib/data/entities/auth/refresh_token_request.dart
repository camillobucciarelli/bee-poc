import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request.g.dart';

@JsonSerializable(createFactory: false)
class RefreshTokenRequest extends Equatable {
  final String refresh;

  const RefreshTokenRequest(this.refresh);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);

  @override
  List<Object?> get props => [
        refresh,
      ];
}
