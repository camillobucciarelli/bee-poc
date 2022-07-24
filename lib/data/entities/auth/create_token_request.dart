import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_token_request.g.dart';

@JsonSerializable(createFactory: false)
class CreateTokenRequest extends Equatable {
  final String email;
  final String password;

  const CreateTokenRequest(this.email, this.password);

  Map<String, dynamic> toJson() => _$CreateTokenRequestToJson(this);

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
