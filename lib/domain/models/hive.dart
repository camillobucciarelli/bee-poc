import 'package:equatable/equatable.dart';

import '../../data/entities/hive_entity.dart';

class Hive extends Equatable {
  final int id;
  final String name;
  final String mainImage;
  final String queenName;
  final String queenImage;

  const Hive(this.id, this.name, this.mainImage, this.queenName, this.queenImage);

  factory Hive.fromEntity(HiveEntity entity){
    return Hive(entity.id, entity.name, entity.mainImage, entity.queenName, entity.queenImage);
  }

  @override
  List<Object?> get props => [id, name, mainImage, queenName, queenImage];
}
