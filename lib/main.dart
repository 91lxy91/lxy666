import 'package:flutter/material.dart';
import 'package:flutter_cors_image/flutter_cors_image.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QQ风格页面',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainTabPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 主页：底部导航容器
class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int _currentIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // 初始化页面，将BuyPage设为可更新状态
    _pages = [
      const ProfilePage(),
      const BuyPage(),
      CourseDetailPage(course: Course(
          title: "默认详情",
          subtitle: "底部3号页面",
          status: CourseStatus.completed,
          avatarUrl: "https://picsum.photos/200/200?random=99"
      )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "我的",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "课程",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "详情",
          ),
        ],
      ),
    );
  }
}

// 个人资料页
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final List<String> tags = const [
    'Flutter',
    'Dart',
    '编程',
    '摄影',
    '旅行',
    '音乐',
    '美食',
    '运动',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/652edf359d504b74a7044dd1fa73ce20.jpeg_tplv-a9rns2rl98-downsize_watermark_1_6_b.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 900),
                    opacity: 1.0,
                    child: ClipOval(
                      child: Image.network(
                        'https://www.helloimg.com/i/2026/04/29/69f15e2a2fdb3.png',
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, color: Colors.white, size: 60),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'LXY',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Flutter 开发者',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phone, color: Colors.black, size: 20),
                      SizedBox(width: 6),
                      Text(
                        '888xxxx8888',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.email, color: Colors.black, size: 20),
                      SizedBox(width: 6),
                      Text(
                        '781391@stpt.edu.cn',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(color: Colors.black, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: const Text('关注', style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(width: 14),
                      OutlinedButton(
                        onPressed: () {
                          context.findAncestorStateOfType<_MainTabPageState>()?.setState(() {
                            context.findAncestorStateOfType<_MainTabPageState>()!._currentIndex = 1;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(color: Colors.black, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: const Text('购买商品', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: tags.map((tag) {
                        return Chip(
                          label: Text(
                            tag,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;
    const angleOffset = -90 * pi / 180;

    List<Offset> points = [];
    for (int i = 0; i < 5; i++) {
      double outerAngle = angleOffset + (2 * pi / 5) * i;
      double outerX = centerX + radius * cos(outerAngle);
      double outerY = centerY + radius * sin(outerAngle);
      points.add(Offset(outerX, outerY));

      double innerAngle = outerAngle + (pi / 5);
      double innerRadius = radius * 0.38;
      double innerX = centerX + innerRadius * cos(innerAngle);
      double innerY = centerY + innerRadius * sin(innerAngle);
      points.add(Offset(innerX, innerY));
    }

    path.moveTo(points.first.dx, points.first.dy);
    for (var point in points.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

enum FilterStatus { all, completed, inProgress, notStarted }
enum CourseStatus { completed, inProgress, notStarted }

class Course {
  final String title;
  final String subtitle;
  final CourseStatus status;
  final String avatarUrl;

  const Course({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.avatarUrl,
  });

  // 复制课程并修改状态（用于更新）
  Course copyWith({CourseStatus? status}) {
    return Course(
      title: title,
      subtitle: subtitle,
      status: status ?? this.status,
      avatarUrl: avatarUrl,
    );
  }
}

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  FilterStatus _selectedFilter = FilterStatus.all;

  // 改为可变列表，支持状态修改
  late List<Course> courses;

  @override
  void initState() {
    super.initState();
    // 初始化课程数据
    courses = [
      Course(title: 'Flutter入门', subtitle: '第1课 · 已完成', status: CourseStatus.completed, avatarUrl: 'https://picsum.photos/200/200?random=1'),
      Course(title: 'Dart语言基础', subtitle: '第2课 · 已完成', status: CourseStatus.completed, avatarUrl: 'https://picsum.photos/200/200?random=2'),
      Course(title: 'Widget组件体系', subtitle: '第3课 · 已完成', status: CourseStatus.completed, avatarUrl: 'https://picsum.photos/200/200?random=3'),
      Course(title: '布局进阶', subtitle: '第4课 · 进行中', status: CourseStatus.inProgress, avatarUrl: 'https://picsum.photos/200/200?random=4'),
      Course(title: '图片与占位图', subtitle: '第5课 · 进行中', status: CourseStatus.inProgress, avatarUrl: 'https://picsum.photos/200/200?random=5'),
      Course(title: 'Stack层叠布局', subtitle: '第6课 · 未开始', status: CourseStatus.notStarted, avatarUrl: 'https://picsum.photos/200/200?random=6'),
      Course(title: 'List与ListView', subtitle: '第7课 · 未开始', status: CourseStatus.notStarted, avatarUrl: 'https://picsum.photos/200/200?random=7'),
      Course(title: '页面导航与路由', subtitle: '第8课 · 未开始', status: CourseStatus.notStarted, avatarUrl: 'https://picsum.photos/200/200?random=8'),
    ];
  }

  List<Course> get filteredCourses {
    switch (_selectedFilter) {
      case FilterStatus.all:
        return courses;
      case FilterStatus.completed:
        return courses.where((c) => c.status == CourseStatus.completed).toList();
      case FilterStatus.inProgress:
        return courses.where((c) => c.status == CourseStatus.inProgress).toList();
      case FilterStatus.notStarted:
        return courses.where((c) => c.status == CourseStatus.notStarted).toList();
    }
  }

  // 底部弹窗：修改课程状态
  void _showStatusBottomSheet(Course course, int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '修改课程状态',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildStatusOption('已完成', CourseStatus.completed, course, index),
              _buildStatusOption('进行中', CourseStatus.inProgress, course, index),
              _buildStatusOption('未开始', CourseStatus.notStarted, course, index),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  // 状态选项
  Widget _buildStatusOption(String text, CourseStatus status, Course course, int index) {
    return ListTile(
      title: Text(text),
      leading: Icon(
        Icons.circle,
        color: status == CourseStatus.completed
            ? Colors.green
            : status == CourseStatus.inProgress
            ? Colors.lightBlue
            : Colors.grey,
        size: 16,
      ),
      onTap: () {
        setState(() {
          courses[index] = course.copyWith(status: status);
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        child: ListView(children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue, size: 40),
            ),
            accountName: const Text(
              'LXY',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            accountEmail: const Text(
              '91917813',
              style: TextStyle(fontSize: 10, color: Colors.white70),
            ),
          ),
          ListTile(
            title: const Text("选项一"),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("2"),
            leading: const Icon(Icons.insert_emoticon_sharp),
          ),
          ListTile(
            title: const Text("2"),
            leading: const Icon(Icons.insert_emoticon_sharp),
          ),
          ListTile(
            title: const Text("2"),
            leading: const Icon(Icons.insert_emoticon_sharp),
          ),
          ListTile(
            title: const Text("2"),
            leading: const Icon(Icons.insert_emoticon_sharp),
          ),
        ]),
      ),
      appBar: AppBar(
        title: const Text('我的课程'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip:'操作按钮一',
            icon: const Icon(Icons.looks_one_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("哈哈哈哈哈"),
                duration: Duration(seconds: 5),
              ));
            },
          ),
          IconButton(
            tooltip:'操作按钮二',
            icon: const Icon(Icons.looks_two_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("红红火火恍恍惚惚"),
                duration: Duration(seconds: 5),
              ));
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          _buildFilterTabBar(),
          Expanded(
            child: filteredCourses.isEmpty
                ? const Center(child: Text('暂无课程', style: TextStyle(fontSize: 16)))
                : ListView.separated(
              itemCount: filteredCourses.length,
              separatorBuilder: (context, index) => const Divider(height: 1, indent: 90),
              itemBuilder: (context, index) {
                final course = filteredCourses[index];
                return ListTile(
                  // 左侧：状态图标 + 课程头像
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ⚪状态图标（点击修改状态）
                      GestureDetector(
                        onTap: () => _showStatusBottomSheet(course, index),
                        child: Icon(
                          Icons.circle,
                          color: _getStatusColor(course.status),
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // 课程头像
                      CircleAvatar(
                        backgroundImage: NetworkImage(course.avatarUrl),
                        radius: 30,
                      ),
                    ],
                  ),
                  title: Text(course.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  subtitle: Text(course.subtitle, style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                  trailing: _buildStatusTag(course.status),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailPage(course: course),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 获取状态颜色
  Color _getStatusColor(CourseStatus status) {
    switch (status) {
      case CourseStatus.completed:
        return Colors.green;
      case CourseStatus.inProgress:
        return Colors.lightBlue;
      case CourseStatus.notStarted:
        return Colors.grey;
    }
  }

  Widget _buildFilterTabBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 12),
            _buildFilterItem('全部', FilterStatus.all),
            _buildFilterItem('已完成', FilterStatus.completed),
            _buildFilterItem('进行中', FilterStatus.inProgress),
            _buildFilterItem('未开始', FilterStatus.notStarted),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterItem(String title, FilterStatus status) {
    final isSelected = _selectedFilter == status;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = status;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue, width: 1.2),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusTag(CourseStatus status) {
    switch (status) {
      case CourseStatus.completed:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(12)),
          child: const Text('已完成', style: TextStyle(color: Colors.green, fontSize: 14)),
        );
      case CourseStatus.inProgress:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(color: Colors.lightBlue[100], borderRadius: BorderRadius.circular(12)),
          child: const Text('进行中', style: TextStyle(color: Colors.lightBlue, fontSize: 14)),
        );
      case CourseStatus.notStarted:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: const Text('未开始', style: TextStyle(color: Colors.grey, fontSize: 14)),
        );
    }
  }
}

// 课程详情页面
class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(course.avatarUrl),
              radius: 60,
            ),
            const SizedBox(height: 30),
            Text(
              course.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              course.subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}