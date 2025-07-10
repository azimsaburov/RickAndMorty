import 'package:rick_and_morty/domain/models/character_entity.dart';

extension CharacterStatusExtension on CharacterStatus{
  String get text {
    switch (this){
      case CharacterStatus.alive:
      return 'Живой';
      case CharacterStatus.dead:
      return 'Мертвый';
      case CharacterStatus.unknown:
      return 'Не известно';
    }
  }
}