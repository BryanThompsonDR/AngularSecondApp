
import 'package:AngularSecondApp/src/hero_list_component.dart';
import 'package:AngularSecondApp/src/hero_service.dart';
import 'package:angular/angular.dart';

import 'package:angular/angular.dart';

import 'src/hero_service.dart';
import 'src/hero_list_component.dart';
import 'package:angular_router/angular_router.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  template: '''
  <h1>{{title}}</h1>
  <nav>
    <a [routerLink]="RoutePaths.dashboard.toUrl()"
       [routerLinkActive]="'active'">Dashboard</a>
    <a [routerLink]="RoutePaths.heroes.toUrl()"
       [routerLinkActive]="'active'">Heroes</a>
  </nav>
  <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  styleUrls: ['app_component.css'],
  directives: [routerDirectives],
  providers: [ClassProvider(HeroService)],
  exports: [RoutePaths, Routes],
)

class AppComponent
{
    final title = 'Tour of Heroes';
    var name = "World";
}