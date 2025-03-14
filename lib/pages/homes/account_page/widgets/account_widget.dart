import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  File? _image; // Файл выбранного изображения
  final picker = ImagePicker();

  Future<void> getLostData() async {
    try {
      final ImagePicker picker = ImagePicker();
      final LostDataResponse response = await picker.retrieveLostData();

      if (response.isEmpty) return;

      if (response.files != null) {
        _handleLostFiles(response.files!);
      } else {
        _handleError(response.exception);
      }
    } catch (e, stackTrace) {
      debugPrint("Ошибка при восстановлении данных: $e\n$stackTrace");
    }
  }

  void _handleLostFiles(List<XFile> files) {
    setState(() {
      _image = File(files.first.path);
    });
  }

  void _handleError(PlatformException? exception) {
    debugPrint("Ошибка: $exception");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Container(
        width: 290,
        height: 110,
        decoration: BoxDecoration(
          color: Color.fromARGB(138, 211, 211, 211),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          clipBehavior:
              Clip.none, // Элементы могут выходить за границы контейнера
          children: [
            // Круглый аватар с возможностью выбора изображения
            Positioned(
              top: -10, // Смещение вверх
              left: -30, // Смещение влево
              child: InkWell(
                onTap: () async {
                  final XFile? pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Color.fromARGB(255, 255, 196, 0),
                  child: _image == null
                      ? Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.black,
                        )
                      : ClipOval(
                          child: Image.file(
                            _image!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
