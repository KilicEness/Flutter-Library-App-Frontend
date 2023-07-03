import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_app/modules/library/books/bloc/books_bloc.dart';
import 'package:library_app/modules/library/books/books_page.dart';
import 'package:library_app/modules/library/books/services/books_service.dart';
import 'package:library_app/modules/library/users/bloc/users_bloc.dart';
import 'package:library_app/modules/library/users/users_page.dart';
import 'package:library_app/modules/library/users/services/users_service.dart';
import 'package:library_app/shared/helpers/networking.dart';

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
      ];

  @override
  // library module in routes
  List<ModularRoute> get routes => [
        ChildRoute('/dashboard', child: (_, args) => const DashboardPage()),
        ChildRoute('/books', child: (_, args) => BooksPage()),
        ChildRoute('/users', child: (_, args) => UsersPage()),
      ];
}
