import 'package:hive/hive.dart';
import 'site_model.dart'; // Adjust the import according to your project structure

class LanguageAdapter extends TypeAdapter<Language> {
  @override
  final int typeId = 2;

  @override
  Language read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Language.english;
      case 1:
        return Language.tamil;
      case 2:
        return Language.sinhala;
      default:
        return Language.english;
    }
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    switch (obj) {
      case Language.english:
        writer.writeByte(0);
        break;
      case Language.tamil:
        writer.writeByte(1);
        break;
      case Language.sinhala:
        writer.writeByte(2);
        break;
    }
  }
}
