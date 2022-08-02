import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:revup_ui/screen/service/base_textfield.dart';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  late ThemeData themeData;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  dynamic image;
  String? value = '1';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeData = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Ảnh dịch vụ',
                  style: themeData.textTheme.labelMedium!.copyWith(color: Color(0xFFA8A6A9)),
                ),
                const SizedBox(height: 10),
                buildImage(),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Thông tin dịch vụ',
                  style: themeData.textTheme.labelMedium!.copyWith(color: Color(0xFFA8A6A9)),
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Tên dịch vụ',
                  style: themeData.textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                BaseTextField(
                  controller: nameController,
                  hintText: 'Nhập tên dịch vụ',
                  borderType: BorderType.OUTLINE,
                  onChange: (value) {
                    setState(() {
                      nameController.text;
                    });
                  },
                  suffixIcon: nameController.text.isNotEmpty ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.clear_outlined),
                      onPressed: () {
                        setState(() {
                          nameController.clear();
                        });
                      },
                    ),
                  ) : null,
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Tiền công dịch vụ',
                  style: themeData.textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                BaseTextField(
                  controller: priceController,
                  hintText: 'Nhập số tiền',
                  borderType: BorderType.OUTLINE,
                  onChange: (value) {
                    setState(() {
                      priceController.text;
                    });
                  },
                  suffixIcon: priceController.text.isNotEmpty ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.clear_outlined),
                      onPressed: () {
                        setState(() {
                          priceController.clear();
                        });
                      },
                    ),
                  ) : null,
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Đơn vị tính giá',
                  style: themeData.textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    value: value,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: '1',
                        child: Text('Cái'),
                      ),
                      DropdownMenuItem(
                        value: '2',
                        child: Text('Hộp'),
                      ),
                    ],
                    onChanged: (String? value) {
                      this.value = value;
                    }
                  ),
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Mô tả (tối đá 100 ký tự)',
                  style: themeData.textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                BaseTextField(
                  controller: descriptionController,
                  hintText: 'Nhập mô tả ngắn',
                  borderType: BorderType.OUTLINE,
                  minLines: 3,
                  maxLines: 3,
                  onChange: (value) {
                    setState(() {
                      descriptionController.text;
                    });
                  },
                  suffixIcon: descriptionController.text.isNotEmpty ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.clear_outlined),
                      onPressed: () {
                        setState(() {
                          descriptionController.clear();
                        });
                      },
                    ),
                  ) : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    if (image == null) {
      return Center(
        child: Container(
          height: 96,
          width: 96,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Icon(Icons.add_photo_alternate_outlined),
        ),
      );
    }
    return Center(child: Image.asset('assets/images/ball.png', width: 96, height: 96));
  }
}
