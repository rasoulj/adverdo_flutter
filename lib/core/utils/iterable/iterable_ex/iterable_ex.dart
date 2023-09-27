extension IterableEx on Iterable {
  String joinAnd({String sep = ", ", String and = " and "}) {
    var list = toList();
    if(list.isEmpty) return "";
    if(list.length == 1) return list.first.toString();
    return [list.sublist(0, list.length - 1).join(sep), list.last].join(and);
  }
}