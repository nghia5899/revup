import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RepairCompelete extends StatefulWidget {
  const RepairCompelete({Key? key}) : super(key: key);

  @override
  State<RepairCompelete> createState() => _RepairCompeleteState();
}

class _RepairCompeleteState extends State<RepairCompelete> {
  late ThemeData themeData;

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Hoàn thành sửa chữa',
                  style: themeData.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                buildSelectImage(),
                const SizedBox(height: 10),
                buildItem(
                  title: 'Thu khách',
                  textLeft: '250.000',
                  textRight: 'Chi tiết',
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                buildItem(title: 'Loại xe', textLeft: 'Wave rsx'),
                const SizedBox(height: 10),
                buildItem(
                  title: 'Hạng mục hoàn thành',
                  textLeft: 'Tổng cộng 4 hạng mục',
                  textRight: 'Sửa lại',
                  onTap: () {},
                ),
                const SizedBox(height: 30),
                AutoSizeText(
                  'Đối tác vui lòng kiểm tra lại thông tin, hình ảnh bên trên đều chính xác, sau đó trượt để hoàn thành đơn.',
                  style: themeData.textTheme.labelMedium!.copyWith(color: Color(0xFFA8A6A9)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSelectImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Hình ảnh',
          style: themeData.textTheme.labelMedium!.copyWith(color: Color(0xFFA8A6A9)),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFF8EFE7),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey),
              ),
              child: const Icon(Icons.add_photo_alternate, color: Colors.grey,),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 64,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.asset('assets/images/ball.png', height: 64, width: 64,);
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildItem({ required String title, required String textLeft, String? textRight, GestureTapCallback? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          style: themeData.textTheme.labelMedium!.copyWith(color: Color(0xFFA8A6A9)),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              textLeft,
              style: themeData.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            if (textRight != null)
              GestureDetector(
                onTap: onTap,
                child: AutoSizeText(
                  textRight,
                  style: themeData.textTheme.labelLarge!.copyWith(
                    color: const Color(0xFF7D5700),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
