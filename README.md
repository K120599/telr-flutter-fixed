# telr_test_plugin

A new Flutter project.

## Getting Started

* Add these in pubspec.yaml
# The following section is specific to Flutter packages.
flutter:

  plugin:
    platforms:
      android:
        package: com.telrgateway.app
        pluginClass: TelrPaymentGatewayPlugin
      ios:
        pluginClass: TelrPaymentGatewayPlugin

## How To Use
 try {
      message  =
          await TelrPaymentGateway.callTelRForTransaction(
            store_id: "storeId",
            key: "authKey",
            amount: "20",
            app_install_id: "123456",
            app_name: "TelR",
            app_user_id: "12345",
            app_version: "1.0.0",
            sdk_version: "123",
            mode: "1",
            tran_type: "sale",
            tran_cart_id: "1003",
            desc: "First Transaction",
            tran_lang: "EN",
            tran_currency: "SAR",
            bill_city: "Dubai",
            bill_country: "AE",
            bill_region: "Dubai",
            bill_address: "SIT GTower",
            bill_first_name: "Groupies ",
            bill_last_name: "test",
            bill_title: "Mr",
            bill_email: "test@test.com",
            bill_phone: "528636596",
          ) ?? 'Unknown Message';
    } on PlatformException {
      message = 'Failed to get Message.';
    }

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
