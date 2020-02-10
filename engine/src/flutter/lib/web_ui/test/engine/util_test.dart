// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:typed_data';

import 'package:ui/src/engine.dart';

import 'package:test/test.dart';

final Float64List identityTransform = Matrix4.identity().storage;
final Float64List xTranslation = (Matrix4.identity()..translate(10)).storage;
final Float64List yTranslation = (Matrix4.identity()..translate(0, 10)).storage;
final Float64List zTranslation = (Matrix4.identity()..translate(0, 0, 10)).storage;
final Float64List scaleAndTranslate2d = (Matrix4.identity()..scale(2, 3, 1)..translate(4, 5, 0)).storage;
final Float64List rotation2d = (Matrix4.identity()..rotateZ(0.2)).storage;

void main() {
  test('transformKindOf and isIdentityFloat64ListTransform identify matrix kind', () {
    expect(transformKindOf(identityTransform), TransformKind.identity);
    expect(isIdentityFloat64ListTransform(identityTransform), isTrue);

    expect(transformKindOf(zTranslation), TransformKind.complex);
    expect(isIdentityFloat64ListTransform(zTranslation), isFalse);

    expect(transformKindOf(xTranslation), TransformKind.transform2d);
    expect(isIdentityFloat64ListTransform(xTranslation), isFalse);

    expect(transformKindOf(yTranslation), TransformKind.transform2d);
    expect(isIdentityFloat64ListTransform(yTranslation), isFalse);

    expect(transformKindOf(scaleAndTranslate2d), TransformKind.transform2d);
    expect(isIdentityFloat64ListTransform(scaleAndTranslate2d), isFalse);

    expect(transformKindOf(rotation2d), TransformKind.transform2d);
    expect(isIdentityFloat64ListTransform(rotation2d), isFalse);
  });
}
