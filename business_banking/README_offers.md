# Offers Home Test

The Offers home test:

- First screen will be in the hub and will show a call to action
- Second screen will show the list of offers

## Screenshots

Hub Page | Offers List Page
--- | ---
![Hub Page](media/offers_hub.png?raw=true "Hub Page") | ![Offers List Page](media/offers_list.png?raw=true "Offers List Page")

## Mockoon

Launch Mockoon and load the `mockoon/offers_env.json` environment. Make sure your
port is set to 3001 and launch the server.

## Testing

Code coverage is 100%.

### Unit/Widget tests with Test Coverage

```bash
> flutter test --coverage
> genhtml coverage/lcov.info  -o offers_coverage
```

### Integration tests

```bash
> flutter drive --driver=test_driver/offers_integration_test.dart --target=integration_test/offers_feature_test.dart
```