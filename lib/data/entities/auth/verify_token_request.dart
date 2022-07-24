import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_token_request.g.dart';

@JsonSerializable(createFactory: false)
class VerifyTokenRequest extends Equatable {
  final String token;

  const VerifyTokenRequest(this.token);

  Map<String, dynamic> toJson() => _$VerifyTokenRequestToJson(this);

  @override
  List<Object?> get props => [
        token,
      ];
}
