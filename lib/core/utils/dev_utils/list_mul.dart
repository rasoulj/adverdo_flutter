class ListMul<T> {
  final List<T> list;

  ListMul(this.list);
  List<T> call([int n = 1]) {
    List<T> ret = [];
    for(int i=0; i<n; i++) {
      ret.addAll(list);
    }
    return ret;
  }
}