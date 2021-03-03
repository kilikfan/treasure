enum SpecialType { NULL, MUTINY, NAVY_RAID, RAVENOUS_CREW }

extension SpecialTypeExt on SpecialType {
  String get description {
    switch (this) {
      case SpecialType.MUTINY:
        return "Too many riches breed jealousy!";
      case SpecialType.NAVY_RAID:
        return "You've become too infamous!";
      case SpecialType.RAVENOUS_CREW:
        return "You've run out of food!";
      default:
        return "";
    }
  }
}
