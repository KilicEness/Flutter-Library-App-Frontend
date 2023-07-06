import 'package:flutter_modular/flutter_modular.dart';

import './book_detail/bloc/book_detail_bloc.dart';
import './book_detail/book_detail_page.dart';
import './book_detail/services/book_detail_service.dart';

import './books/bloc/books_bloc.dart';
import './books/books_page.dart';
import './books/services/books_service.dart';

import './user_detail/bloc/user_detail_bloc.dart';
import './user_detail/services/user_detail_service.dart';
import './user_detail/user_detail_page.dart';

import './users/bloc/users_bloc.dart';
import './users/users_page.dart';
import './users/services/users_service.dart';

import '/shared/helpers/networking.dart';

//Dashboard
import './dashboard/dashboard_page.dart';

class Library extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
            (i) =>
                BooksBloc(iBooksService: BooksService(network: DioNetwork())),
            isLazy: true,
            isSingleton: true),
        Bind(
            (i) =>
                UsersBloc(iUsersService: UsersService(network: DioNetwork())),
            isLazy: true,
            isSingleton: true),
        Bind(
            (i) => UserDetailBloc(
                iUserDetailService: UserDetailService(network: DioNetwork())),
            isLazy: true,
            isSingleton: true),
        Bind(
            (i) => BookDetailBloc(
                iBookDetailService: BookDetailService(network: DioNetwork())),
            isLazy: true,
            isSingleton: true),
      ];

  @override
  // library module in routes
  List<ModularRoute> get routes => [
        ChildRoute('/dashboard', child: (_, args) => const DashboardPage()),
        ChildRoute('/books', child: (_, args) => BooksPage()),
        ChildRoute('/users', child: (_, args) => UsersPage()),
        ChildRoute('/users/:userId',
            child: (_, args) => UserDetailPage(userId: args.params['userId'])),
        ChildRoute('/books/:userId/books',
            child: (_, args) => BookDetailPage(userId: args.params['userId'])),
      ];
}
