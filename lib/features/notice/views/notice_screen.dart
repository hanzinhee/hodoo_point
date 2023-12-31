import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/notice/views/widgets/notice_app_bar.dart';
import 'package:hodoo_point/common/widgets/empty_sign.dart';
import 'package:hodoo_point/common/widgets/three_rotating_dot_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class NoticeModel {
  NoticeModel(this.noticeId, {required this.title, required this.date});
  final int noticeId;
  final String title;
  final DateTime date;
}

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  static const routePath = '/notice';

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  static const _pageSize = 10;

  final PagingController<int, NoticeModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      // final newItems = <NoticeModel>[];
      final newItems = List.generate(
          (pageKey > 50) ? 1 : 10,
          (index) => NoticeModel(index,
              title: '공지사항 입니다. ${index + pageKey}', date: DateTime.now()));
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NoticeAppBar(),
          PagedSliverList<int, NoticeModel>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<NoticeModel>(
              itemBuilder: (context, item, index) => Column(
                children: [
                  ListTile(
                    onTap: () {
                      context.push('/notice/${item.noticeId}');
                    },
                    title: Text(item.title),
                    subtitle: Text(DateFormat('yyyy-MM-dd').format(item.date)),
                  ),
                  const Divider(
                    thickness: 0.5,
                    indent: Gaps.size2,
                    endIndent: Gaps.size2,
                  ),
                ],
              ),
              firstPageProgressIndicatorBuilder: (_) =>
                  const ThreeRotatingDots(size: 30),
              newPageProgressIndicatorBuilder: (_) => Container(
                  padding: const EdgeInsets.all(Gaps.size2),
                  child: const ThreeRotatingDots(size: 20)),
              noItemsFoundIndicatorBuilder: (_) => const Center(
                  child: EmptySign(
                text: '공지사항이 없습니다.',
              )),
              noMoreItemsIndicatorBuilder: (_) => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(Gaps.size2),
                  child: const Text('마지막 페이지 입니다.',
                      style: TextStyle(color: Colors.grey))),
            ),
          ),
        ],
      ),
    );
  }
}
