import 'package:advedro/core/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("ImageSize.equal", () {
    final size23 = ImageSize(2, 3);
    final size23p = ImageSize(2, 3);


    expect(size23 == size23p, true);
  });


  test("GCD", () {
    final size = ImageSize(200, 400);
    final ratio = size.ratio;
    print(ratio);
    expect(ratio, ImageSize(1, 2));
  });

  test("ImageRule validRatios", () {
    final info = ImageMetaInfo(size: ImageSize(200, 400), length: 2537);

    final rule = ImageInfoRule(
      validRatios: [
        ImageSize(1, 1),
        ImageSize(1, 2),
        ImageSize(2, 1),
      ]
    );

    expect(rule.match(info), true);
  });

  test("ImageRule maxLength1", () {
    final info = ImageMetaInfo(size: ImageSize(200, 400), length: 2537);

    final rule = ImageInfoRule(
      maxLength: 3000
    );

    expect(rule.match(info), true);
  });

  test("ImageRule maxLength2", () {
    final info = ImageMetaInfo(size: ImageSize(200, 400), length: 2537);

    final rule = ImageInfoRule(
      maxLength: 2000
    );

    expect(rule.match(info), false);
  });

  test("ImageRule maxLength3", () {
    final info = ImageMetaInfo(size: ImageSize(200, 400), length: 1537);

    final rule = ImageInfoRule(
      minLength: 1000,
      maxLength: 2000
    );

    expect(rule.match(info), true);
  });

  test("ImageRule Size1", () {
    final info = ImageMetaInfo(size: ImageSize(200, 400), length: 1537);

    final rule = ImageInfoRule(
      minLength: 10000,
      maxLength: 200,
      // validSizes: [
      //   ImageSize(200, 200),
      //   ImageSize(400, 200),
      // ],
      // validRatios: [
      //   ImageSize(2, 2),
      // ]
    );

    for(final err in rule.getErrors(info)) {
      print(err);
    }

    expect(rule.match(info), false);
  });


}