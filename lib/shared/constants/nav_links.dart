import 'package:flutter/material.dart';

class NavItem {
  IconData icon;
  String label;
  String path;
  String pathGroup;
  bool isMobileShow;
  bool isDesktopShow;

  NavItem(
      {required this.icon,
      required this.label,
      required this.path,
      required this.pathGroup,
      this.isMobileShow = true,
      this.isDesktopShow = true});
}

List<NavItem> libraryNavLinks = [
  NavItem(
      icon: Icons.dashboard,
      label: 'Dashboard',
      path: '/library/dashboard',
      pathGroup: '/library/dashboard',
      isMobileShow: false),
  NavItem(
      icon: Icons.book,
      label: 'Books',
      path: '/library/books',
      pathGroup: '/library/books'),
  NavItem(
      icon: Icons.person,
      label: 'Users',
      path: '/library/users',
      pathGroup: '/library/users'),
  NavItem(
      icon: Icons.my_library_books,
      label: 'My Books',
      path: '/library/books/myBooks',
      pathGroup: '/library/books/myBooks'),
  NavItem(
      icon: Icons.account_balance,
      label: 'My Profile',
      path: '/library/myProfile',
      pathGroup: '/library/myProfile'),
];
