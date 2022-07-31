import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DetailServiceRequest extends StatefulWidget {
  const DetailServiceRequest({Key? key}) : super(key: key);

  @override
  State<DetailServiceRequest> createState() => _DetailServiceRequestState();
}

class _DetailServiceRequestState extends State<DetailServiceRequest> {
  List<int> listRequestService = [1 , 2, 3];
  List<int> listBonusService = [1];
  List<int> listAdditionCost = [1];
  late ThemeData themeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

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
                  'Chi tiết dịch vụ yêu cầu',
                  style: themeData.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                buildListService(title: 'Dịch vụ yêu cầu', listData: listRequestService),
                const Divider(thickness: 1),
                buildListService(title: 'Dịch vụ bổ sung', listData: listBonusService),
                const Divider(thickness: 1),
                buildListService(title: 'Chi phí phụ', listData: listAdditionCost),
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                buildRowItem(textLeft: 'Tạm tính', textRight: '257.000', isBold: true)
              ],
            ),
          ),
        ),
      ),
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            textLeft,
            style: textStyle,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: AutoSizeText(
              textRight,
              textAlign: TextAlign.right,
              style: textStyle,
              minFontSize: 5,
            ),
          ),
        ],
      ),
    );
  }
}
