import 'package:poly/poly.dart';

import 'package:test/test.dart';

void main() {
  group('Simple Poly test: ', (){
    var l = <Point<num>>[
      Point(18.4851825, 73.8498851),
      Point(18.4849214, 73.8498675),
      Point(18.4855965, 73.8520493),
      Point(18.4859711, 73.8512369),
      Point(18.4857828, 73.8500299),
      Point(18.4851825, 73.8498851)
    ];
    var testPolygon = Polygon(l);
    var copyOfFirstPolygon = Polygon([
      Point(18.4851825, 73.8498851),
      Point(18.4849214, 73.8498675),
      Point(18.4855965, 73.8520493),
      Point(18.4859711, 73.8512369),
      Point(18.4857828, 73.8500299),
      Point(18.4851825, 73.8498851)
    ]);
    var in1 = Point(18.48569, 73.85067);
    test('`hasSamePoint()`',(){
      var areTwoSame = testPolygon.hasSamePoints(copyOfFirstPolygon);
      expect(areTwoSame,equals(true));
    });
    test('`isPointInside` ',(){
      var isIn1InsideTestPolygon = testPolygon.isPointInside(in1);
      expect(isIn1InsideTestPolygon,equals(true));
    });
    test('`isPointInside` ',(){
      var polygonContain = copyOfFirstPolygon.contains(18.48569, 73.85067);
      expect(polygonContain,equals(true));
    });
    test(' areAllPointsInsidePolygon_ListPoint : true ', () {
      var areAllInside = testPolygon.areAllPointsInsidePolygon_ListPoint(l);
      expect(areAllInside,equals(true));
    });
    test(' areAllPointsInsidePolygon_ListPoint : false  ', () {
      var notInsidePoints = <Point<num>>[...l, Point(75, 90)];
      var areAllInside = testPolygon.areAllPointsInsidePolygon_ListPoint(notInsidePoints);
      expect(areAllInside,equals(false));
    });
    test(' getList_IsListOfPointInside  ', () {
      var notInsidePoints = <Point<num>>[...l, Point(75, 90)];
      var statusOfPoints = testPolygon.getList_IsListOfPointInside(notInsidePoints);
      expect(statusOfPoints,equals([true, true, true, true, true, true, false]));
    });
  });

  group('Dynamic to num: ', (){
    var correctDynamicList = [1, 2, 'a', 3];
    var listOf = [
      [1, true],
      [2, 'Remove me'],
      [3, 4],
      [5, 6],
      [7, 8]
    ];
    group('toListNum: ',(){
      group('Old List: ',(){
        test('Type',(){
          var oldType = correctDynamicList.runtimeType.toString();
          expect(oldType,equals('List<dynamic>'));
        });
        test('Length',(){
          var oldLength = correctDynamicList.length;
          expect(oldLength,equals(4));
        });
      });
      group('without any optional parameters:',() {
        var lWithoutAnyOptional = toListNum(correctDynamicList);
        test('Type', () {
          var type = lWithoutAnyOptional.runtimeType.toString();
          expect(type, equals('List<num>'));
        });
        test('Length', () {
          var length = lWithoutAnyOptional.length;
          expect(length, equals(2));
        });
        test('Value', () {
          expect(lWithoutAnyOptional, equals([1, 2]));
        });
      });
        group('with `replaceWithZero: true` and `sizeTwo: false`:',(){
          var lSizeNotTwo_Zero =
          toListNum(correctDynamicList, replaceWithZero: true, sizeTwo: false);
          test('Type',(){
            var type = lSizeNotTwo_Zero.runtimeType.toString();
            expect(type,equals('List<num>'));
          });
          test('Length',(){
            var length = lSizeNotTwo_Zero.length;
            expect(length,equals(4));
          });
          test('Value',(){
            expect(lSizeNotTwo_Zero,equals([1,2,0,3]));
          });
        });
      group('with `sizeTwo: false`:',(){
        var lSizeNotTwo = toListNum(correctDynamicList, sizeTwo: false);
        test('Type',(){
          var type = lSizeNotTwo.runtimeType.toString();
          expect(type,equals('List<num>'));
        });
        test('Length',(){
          var length = lSizeNotTwo.length;
          expect(length,equals(3));
        });
        test('Value',(){
          expect(lSizeNotTwo,equals([1,2,3]));
        });
      });
    });//toListnum

    group('toListListNum: ',(){
        group('Old List: ',(){
          test('Type',(){
            var oldType = listOf.runtimeType.toString();
            expect(oldType,equals('List<dynamic>'));
          });
          test('Length',(){
            var oldLength = listOf.length;
            expect(oldLength,equals(5));
          });
        });
      group('without any optional parameters: ',() {
        var m = toListListNum(listOf);
        test('Type', () {
          var type = m.runtimeType.toString();
          expect(type, equals('List<List<num>>'));
        });
        test('Length', () {
          var length = m.length;
          expect(length, equals(3));
        });
        test('Value', () {
          expect(m, equals([[3, 4], [5, 6], [7, 8]]));
        });
      });
      group('with `swapXAndY: true`: ',(){
        var mSwap = toListListNum(listOf, swapXAndY: true);
        test('Type',(){
          var type = mSwap.runtimeType.toString();
          expect(type,equals('List<List<num>>'));
        });
        test('Length',(){
          var length = mSwap.length;
          expect(length,equals(3));
        });
        test('Value',(){
          expect(mSwap,equals([[4, 3], [6, 5], [8, 7]]));
        });
      });
      group('with `replaceWithZero: true`:',(){
        var mZero = toListListNum(listOf, replaceWithZero: true);
        test('Type',(){
          var type = mZero.runtimeType.toString();
          expect(type,equals('List<List<num>>'));
        });
        test('Length',(){
          var length = mZero.length;
          expect(length,equals(5));
        });
        test('Value',(){
          expect(mZero,equals([[1, 0], [2, 0], [3, 4], [5, 6], [7, 8]]));
        });
      });
        group('with `replaceWithZero: true` and `swapXAndY: true`: ',(){
          var mZeroSwap =
          toListListNum(listOf, replaceWithZero: true, swapXAndY: true);
          test('Type',(){
            var type = mZeroSwap.runtimeType.toString();
            expect(type,equals('List<List<num>>'));
          });
          test('Length',(){
            var length = mZeroSwap.length;
            expect(length,equals(5));
          });
          test('Value',(){
            expect(mZeroSwap,equals([[0, 1], [0, 2], [4, 3], [6, 5], [8, 7]]));
          });
        });
    });//toListListnum
  });//dynamic to num


//  group("List => Point",(){
//
//  });
}
