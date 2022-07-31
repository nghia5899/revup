import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InfoRequest extends StatefulWidget {
  const InfoRequest({Key? key}) : super(key: key);

  @override
  State<InfoRequest> createState() => _InfoRequestState();
}

class _InfoRequestState extends State<InfoRequest> {

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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Chi tiết dịch vụ yêu cầu',
                style: themeData.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/ball.png', width: 50, height: 50,),
                  ),
                  const SizedBox(width: 10),
                  AutoSizeText(
                    'Hoàng long',
                    style: themeData.textTheme.headline5!.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  buildIconAction(Icons.phone),
                  const SizedBox(width: 10),
                  buildIconAction(Icons.video_camera_back_outlined),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              buildRowItem(
                iconData: Icons.social_distance,
                text: 'Cách bạn',
                textBold: '2.7km',
              ),
              buildRowItem(
                iconData: Icons.directions_run,
                text: 'Phí di chuyển',
                textBold: '15.000 đ',
              ),
              buildRowItem(
                iconData: Icons.directions_bike,
                text: 'Loại phương tiện',
                textBold: 'Xe máy',
              ),
              buildRowItem(
                iconData: Icons.description_outlined,
                text: 'Em đặt hộ bạn',
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: buildRowItem(
                      iconData: Icons.build,
                      text: 'Dịch vụ:',
                      textBold: '3 hạng mục',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      child: AutoSizeText(
                        'Báo giá',
                        style: themeData.textTheme.labelLarge!.copyWith(
                          color: const Color(0xFF7D5700),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              AutoSizeText(
                'Đối tác có thể trao đổi qua tin nhắn và cuộc gọi video với khách hàng để có sự chuẩn bị tốt nhất nhé!',
                style: themeData.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconAction(IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFF7D5700),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.5,
            blurRadius: 0.1,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Icon(iconData, color: Colors.white, size: 16),
    );
  }

  Widget buildRowItem({required IconData iconData, required String text, String? textBold }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(iconData, size: 16),
          const SizedBox(width: 10),
          AutoSizeText(
            text,
            style: themeData.textTheme.bodyLarge,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: AutoSizeText(
              textBold ?? '',
              overflow: TextOverflow.ellipsis,
              style: themeData.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
