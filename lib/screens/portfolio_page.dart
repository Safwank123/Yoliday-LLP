import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 1;
  String _searchQuery = '';
  
  final List<Map<String, dynamic>> _portfolioItems = [
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'category': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/imageone.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'category': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/imagethree.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'category': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/imagetwo.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'category': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/imagethree.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'category': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/imagefour.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredItems {
    if (_searchQuery.isEmpty) {
      return _portfolioItems;
    }
    
    return _portfolioItems.where((item) => 
      item['title'].toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabs(),
            _buildSearchBar(),
            Expanded(
              child: _currentTabContent(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Row(
            children: [
              IconButton(
               
  onPressed: () {},
  icon: Image.asset(
    'assets/ic_round-shopping-bag.png',
    width: 24.sp,
    height: 24.sp,
    
    color: const Color(0xFFE05D37), 
  ),
)
,
              SizedBox(width: 16.w),
              IconButton(
  onPressed: () {},
  icon: Image.asset(
    'assets/ic_baseline-notifications.png',
    width: 24.sp,
    height: 24.sp,
    color: const Color(0xFFE05D37), 
  ),
)

            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: const Color(0xFFE05D37),
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        indicatorColor: const Color(0xFFE05D37),
        indicatorWeight: 3.0,
        tabs: const [
          Tab(text: 'Project'),
          Tab(text: 'Saved'),
          Tab(text: 'Shared'),
          Tab(text: 'Achievement'),
        ],
        onTap: (index) {
          setState(() {
           
          });
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search a project',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 33.w,
                height: 33.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE05D37),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _currentTabContent() {
    if (_tabController.index == 0) {
     
      return _buildProjectContent();
    } else {
     
      return Container();
    }
  }

  Widget _buildProjectContent() {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: _filteredItems.length,
          itemBuilder: (context, index) {
            final item = _filteredItems[index];
            return _buildPortfolioCard(item);
          },
        ),
        Positioned(
          bottom: 16.h,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE05D37),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.filter_list, color: Colors.white, size: 18.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Filter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPortfolioCard(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
            child: Image.asset(
              item['image'],
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    item['category'],
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    item['author'],
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 75,left: 2),
            child:Container(
  width: 50.w,
  height: 26.h,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(243, 149, 25, 1), 
        Color.fromRGBO(255, 205, 103, 1),  
      ],
    ),
    borderRadius: BorderRadius.circular(4.r),
  ),
  child: Center(
    child: Text(
      'A',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)

          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'Home', Image.asset("assets/Home svg.png")),
            _buildNavItem(1, 'Portfolio',Image.asset("assets/Portfolia svg.png")),
            _buildNavItem(2, 'Input', Image.asset("assets/Input svg.png")),
            _buildNavItem(3, 'Profile', Image.asset("assets/Profile svg.png")),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, Widget icon) {
  final isSelected = _currentIndex == index;
  return InkWell(
    onTap: () {
      setState(() {
        _currentIndex = index;
      });
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 2.h,
          width: 30.w,
          color: isSelected ? const Color(0xFFE05D37) : Colors.transparent,
          margin: EdgeInsets.only(bottom: 4.h),
        ),
        SizedBox(
          height: 24.sp,
          width: 24.sp,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              isSelected ? const Color(0xFFE05D37) : Colors.grey,
              BlendMode.srcIn,
            ),
            child: icon,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFFE05D37) : Colors.grey,
            fontSize: 12.sp,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}

}