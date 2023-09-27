import 'package:advedro/core/data/types/json.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test DateTime parser for Json", () {
    Json json = {
      "created_at": "2022/08/31 10:22:49",
      "updated_at": "2023/04/25 09:46:33",
    };

    DateTime? createdAt = json.getDateTime("created_at");
    expect(createdAt?.year, 2022);
    expect(createdAt?.month, 8);
    expect(createdAt?.day, 31);
    expect(createdAt?.hour, 10);
    expect(createdAt?.minute, 22);
    expect(createdAt?.second, 49);

    // 2023/04/25 09:46:33
    DateTime? updatedAt = json.getDateTime("updated_at");
    expect(updatedAt?.year, 2023);
    expect(updatedAt?.month, 4);
    expect(updatedAt?.day, 25);
    expect(updatedAt?.hour, 9);
    expect(updatedAt?.minute, 46);
    expect(updatedAt?.second, 33);

    expect(json["created_at"], createdAt?.toStringAdv());
    expect(json["updated_at"], updatedAt?.toStringAdv());
  });
}
