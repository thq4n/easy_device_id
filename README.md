## Usage

Add `easy_device_id` as a dependency in your pubspec.yaml file.

### Example

```dart
// Import package
import 'package:easy_device_id/easy_device_id.dart';

// Instantiate it
final deviceId = await getDeviceId(false);
final storageDeviceId = await getDeviceId(true);

print(deviceId);
print(storageDeviceId);