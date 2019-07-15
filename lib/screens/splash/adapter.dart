import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class ListAdapter extends DynamicFlowAdapter<ListState> {
  ListAdapter()
      : super(
          pool: <String, Component<Object>>{
          },
          connector: _ListConnector(),
          reducer: buildReducer(),
        );
}

class _ListConnector extends ConnOp<ListState, List<ItemBean>> {
  @override
  List<ItemBean> get(ListState state) {
    return <ItemBean>[];
  }

  @override
  void set(ListState state, List<ItemBean> items) {
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
