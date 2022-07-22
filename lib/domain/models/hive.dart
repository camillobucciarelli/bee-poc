import 'package:equatable/equatable.dart';

import '../../data/entities/hive_entity.dart';

class Hive extends Equatable {
  final int id;
  final String? name;
  final String? ownerName;
  final String? mainImage;

  const Hive(this.id, this.name, this.ownerName, this.mainImage);

  factory Hive.fromEntity(HiveEntity entity){
    return Hive(entity.id, entity.name, entity.ownerName, entity.mainImage);
  }

  @override
  List<Object?> get props => [id, name, ownerName, mainImage];
}
