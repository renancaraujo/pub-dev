// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:gcloud/service_scope.dart';
import 'package:pub_dev/fake/backend/fake_pub_worker.dart';
import 'package:pub_dev/scorecard/backend.dart';
import 'package:pub_dev/shared/redis_cache.dart';
import 'package:pub_dev/shared/versions.dart';
import 'package:pub_dev/tool/test_profile/import_source.dart';
import 'package:pub_dev/tool/test_profile/importer.dart';
import 'package:pub_dev/tool/test_profile/models.dart';
import 'package:test/test.dart';

import '../shared/test_models.dart';
import '../shared/test_services.dart';

void main() {
  group('task fallback test', () {
    testWithProfile(
      'analysis fallback',
      // TODO: fix test by making the http server also apply the overrides
      skip: true,
      fn: () async {
        await _withRuntimeVersions(
          ['2023.08.24'],
          () async {
            await importProfile(
              profile: TestProfile(
                packages: [
                  TestPackage(name: 'oxygen', versions: [
                    TestVersion(version: '1.0.0'),
                  ])
                ],
                defaultUser: adminAtPubDevEmail,
              ),
              source: ImportSource.autoGenerated(),
            );
            await processTasksWithFakePanaAndDartdoc();
          },
        );

        // fallback into accepted runtime works
        await _withRuntimeVersions(
          ['2023.08.25', '2023.08.24'],
          () async {
            final card =
                await scoreCardBackend.getScoreCardData('oxygen', '1.0.0');
            expect(card?.runtimeVersion, '2023.08.24');
          },
        );

        // fallback into non-accepted runtime doesn't work
        await _withRuntimeVersions(
          ['2023.08.25', '2023.08.23'],
          () async {
            final card =
                await scoreCardBackend.getScoreCardData('oxygen', '1.0.0');
            expect(card?.runtimeVersion, '2023.08.25');
          },
        );
      },
      testProfile: TestProfile(
        packages: [],
        defaultUser: adminAtPubDevEmail,
      ),
    );
  });
}

Future<void> _withRuntimeVersions(
    List<String> versions, Future Function() fn) async {
  await fork(() async {
    registerAcceptedRuntimeVersions(versions);
    await setupCache();
    await fn();
  });
}
