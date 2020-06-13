import 'package:panini/models/SynopsisResult.dart';
import 'package:panini/services/data/SynopsisService.dart';
import 'package:rxdart/rxdart.dart';

class SynopsisBloc
{
  SynopsisService _service = SynopsisService();

  final _searchController = BehaviorSubject<String>();
  Observable<String> get searchFlux => _searchController.stream;
  Sink<String> get searchEvent => _searchController.sink;

  Observable<SynopsisResult> apiResultFlux;

  SynopsisBloc() {
    apiResultFlux = searchFlux
        .distinct()
        .where((value) => value.length > 2)
        .debounce(Duration(microseconds: 500))
        .asyncMap(_service.search)
        .switchMap((value) => Observable.just(value));
  }

  void dispose() {
    _searchController.close();
  }
}
