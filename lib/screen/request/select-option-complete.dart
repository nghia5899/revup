import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SelectOptionComplete extends StatefulWidget {
  const SelectOptionComplete({Key? key}) : super(key: key);

  @override
  State<SelectOptionComplete> createState() => _SelectOptionCompleteState();
}

class _SelectOptionCompleteState extends State<SelectOptionComplete> {
  late ThemeData themeData;
  List<int> listRequestService = [1 , 2, 3];

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
                  'Chọn hạng mục hoàn thành',
                  style: themeData.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                AutoSizeText(
                  'Đối tác chọn hạng mục hoàn thành gửi đến khách hàng, rồi chờ xíu để khách hàng xác nhận nhé',
                  style: themeData.textTheme.labelMedium!.copyWith(color: Color(0xFFA8A6A9)),
                ),
                const SizedBox(height: 20),
                buildListService(title: 'Dịch vụ yêu cầu', listData: listRequestService),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeData = Theme.of(context);
  }

  Widget buildListService({ required String title , required List listData }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(title, style: themeData.textTheme.titleMedium!.copyWith(color: const Color(0xFFA8A6A9))),
        const SizedBox(height: 10),
        ...listData.map((e) => buildRowItem(textLeft: 'Thay lốp', textRight: '80.000')).toList(),
      ],
    );
  }

  Widget buildRowItem({ required String textLeft, required String textRight, bool? isBold }) {
    TextStyle? textStyle = themeData.textTheme.bodyLarge!.copyWith(fontWeight: (isBold ?? false) ? FontWeight.bold : null);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          textLeft,
          style: textStyle,
        ),
        const SizedBox(width: 10),
        AutoSizeText(
          textRight,
          textAlign: TextAlign.right,
          style: textStyle,
          minFontSize: 5,
        ),
        Checkbox(
          value: false,
          onChanged: (value) {

          }
        )
      ],
    );
  }
}
