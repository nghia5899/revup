import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfo(),
                const SizedBox(height: 30),
                AutoSizeText(
                  'Tài khoảng của tôi',
                  style: themeData.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                buildItem(
                  iconData: Icons.home_repair_service,
                  text: 'Dịch vụ của tôi',
                ),
                buildItem(
                  iconData: Icons.portrait,
                  text: 'Chỉnh sửa hồ sơ',
                ),
                buildItem(
                  iconData: Icons.payment,
                  text: 'Thanh toán',
                ),
                buildItem(
                  iconData: Icons.business,
                  text: 'Tài khoản tổ chức',
                ),
                buildItem(
                  iconData: Icons.key,
                  text: 'Đổi mật khẩu',
                ),
                const Divider(thickness: 2),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Hướng dẫn hỗ trợ',
                  style: themeData.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                buildItem(
                  iconData: Icons.quiz,
                  text: 'FAQs',
                ),
                buildItem(
                  iconData: Icons.quiz,
                  text: 'Điều khoản dịch vụ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfo() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset('assets/images/ball.png', width: 100, height: 100),
              ),
              Positioned(
                right: 12,
                bottom: 12,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: Offset(1, 1),
                        )
                      ],
                    ),
                    child: const Icon(Icons.camera_alt_outlined, size: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          AutoSizeText(
            'Đường Vinh Giang',
            style: themeData.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildItem({ required IconData iconData, required String text, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(iconData, size: 18),
            const SizedBox(width: 10),
            AutoSizeText(
              text,
              style: themeData.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 5),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
