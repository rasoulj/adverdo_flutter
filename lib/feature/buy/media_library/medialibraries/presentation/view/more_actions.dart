import 'package:advedro/common/common.dart';
import 'package:flutter/material.dart';

enum MoreActionsEnum {
  readMore,

  edit,

  delete,
}

const Map<MoreActionsEnum, Icon> _icons = {
  MoreActionsEnum.readMore: Icon(Icons.more_horiz),

  MoreActionsEnum.edit: Icon(Icons.edit),

  MoreActionsEnum.delete: Icon(Icons.delete_forever),
};

extension MoreActionsEnumEx on MoreActionsEnum {
  Widget get icon => _icons[this] ?? const ZeroWidget();
}