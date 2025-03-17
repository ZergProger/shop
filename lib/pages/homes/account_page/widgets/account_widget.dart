import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  File? _image; // Файл выбранного изображения
  final picker = ImagePicker();
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadImagePath(); // Загрузка пути изображения при запуске приложения
  }

  // Загрузка пути к изображению из shared_preferences
  void _loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = prefs.getString('imagePath');
      if (_imagePath != null) {
        _image = File(_imagePath!); // Если путь есть, загружаем изображение
      }
    });
  }

  // Сохранение изображения в файл
  Future<void> _saveImage(XFile pickedFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}.jpg'; // Уникальное имя
    final filePath = '${directory.path}/$fileName';

    // Копируем изображение в локальное хранилище
    await pickedFile.saveTo(filePath);

    // Сохраняем путь в shared_preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', filePath);

    setState(() {
      _image = File(filePath);
      _imagePath = filePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
        width: 290,
        height: 110,
        decoration: BoxDecoration(
          color: const Color.fromARGB(138, 211, 211, 211),
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
                    _saveImage(pickedFile); // Сохраняем изображение
                  }
                },
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: const Color.fromARGB(255, 255, 196, 0),
                  child: _image == null
                      ? const Icon(
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
