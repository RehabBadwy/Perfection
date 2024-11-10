


import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:perfection/core/routing/routes.dart';

import '../../features/users/ui/details_user.dart';

List<GetPage> appRouter = [

  GetPage(name: Routes.userDetails, page: () => const DetailsUser()),
];