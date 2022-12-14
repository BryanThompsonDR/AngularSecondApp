import 'package:angular_router/angular_router.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'hero.dart';
import 'hero_service.dart';
import 'route_paths.dart';
import 'dart:html';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives, formDirectives],
  pipes: [commonPipes],
)

class HeroListComponent implements OnInit {

  final HeroService _heroService;
  final Router _router;
  List<Hero>? heroes;

  Hero selected = Hero.blankHero();

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeroes() async{
    heroes = await _heroService.getAll();
  }

  HeroListComponent(this._heroService,this._router);

  void ngOnInit() => _getHeroes();
  
  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() => _router.navigate(_heroUrl(selected.id));

  Future<void> add(String? name) async {
    name = name!.trim();
    if (name.isEmpty) 
      return;
    heroes!.add(await _heroService.create(name));
    selected = Hero.blankHero();
    name = '';
  }

  Future<void> delete(Hero hero, Event event) async {
    await _heroService.delete(hero.id);
    heroes!.remove(hero);
    if (selected == hero)
      selected = Hero.blankHero();
    // This makes any component **above** <my-hero>
    event.stopPropagation();
  }
}
