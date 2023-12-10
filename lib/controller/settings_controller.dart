import 'package:amazcart/AppConfig/app_config.dart';
import 'package:amazcart/config/config.dart';
import 'package:amazcart/model/NewModel/Currency.dart';
import 'package:amazcart/model/NewModel/GeneralSettingsModel.dart';
import 'package:amazcart/model/NewModel/Product/GiftCardData.dart';
import 'package:amazcart/model/NewModel/Product/ProductModel.dart';
import 'package:amazcart/model/NewModel/Product/ProductType.dart';
import 'package:amazcart/widgets/snackbars.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class GeneralSettingsController extends GetxController {
  var isLoading = false.obs;
  var appCurrency = ''.obs;
  var conversionRate = 0.0.obs;
  var generalCurrencyCode = ''.obs;
  var currencyName = ''.obs;
  var currencyCode = ''.obs;
  Rx<String> vendorType = ''.obs;
  var currenciesList = <Currency>[].obs;
  var currency = <Currency>[].obs;

  Dio _dio = Dio();

  late String priceText;
  DateTime endDate = DateTime.now();

  Rx<GeneralSettingsModel> settingsModel =
      <GeneralSettingsModel>[].obs as Rx<GeneralSettingsModel>;

  Rx<bool> otpModuleEnabled = false.obs;

  Rx<int> otpCodeValidationTime = 0.obs;

  Rx<bool> otpOnCustomerRegistration = false.obs;

  Rx<bool> otpOnLogin = false.obs;

  Rx<bool> otpOnPasswordReset = false.obs;

  Rx<bool> otpOnOrderWithCod = false.obs;

  Rx<bool> otpOrderOnVerifiedCustomer = false.obs;

  Rx<int> orderCancelLimitOnVerified = 0.obs;

  Rx<bool> goldPriceModule = false.obs;

  Rx<bool> multivendorModule = false.obs;

  Future<GeneralSettingsModel> getGeneralSettings() async {
    try {
      isLoading(true);
      String uri = URLs.GENERAL_SETTINGS;

      var response = await _dio.get(
        uri,
        // options: buildCacheOptions(
        //   Duration(minutes: 2),
        //   options: Options(
        //     headers: {
        //       'Content-Type': 'application/json',
        //       'Accept': 'application/json',
        //     },
        //   ),
        // ),
      );

      if (response.statusCode == 200) {
        print(response.data);
        var data = new Map<String, dynamic>.from(response.data);

        settingsModel.value = GeneralSettingsModel.fromJson(data);
        if (settingsModel.value.msg == 'success') {
          generalCurrencyCode.value = settingsModel.value.settings.currencyCode;

          currenciesList.value =
              settingsModel.value.currencies.cast<Currency>();
          // currency.value = settingsModel.value.currencies
          //     .where((element) => element.code == generalCurrencyCode.value)
          //     .first as Currency;
          // appCurrency.value = currency.value.symbol.toString();
          // conversionRate.value = currency.value.convertRate.toPrecision(2);
          // currencyName.value = currency.value.name;
          // currencyCode.value = currency.value.code;
          vendorType.value = settingsModel.value.vendorType;

          if (settingsModel.value.otpConfiguration != null) {
            otpModuleEnabled.value = true;

            otpCodeValidationTime.value = int.parse(settingsModel
                .value.otpConfiguration
                .firstWhere((element) => element.type == 'code_validation_time')
                .value
                .toString());

            if (settingsModel.value.otpConfiguration
                    .firstWhere((element) =>
                        element.type == 'otp_on_customer_registration')
                    .value ==
                1) {
              otpOnCustomerRegistration.value = true;
            } else {
              otpOnCustomerRegistration.value = false;
            }

            if (settingsModel.value.otpConfiguration
                    .firstWhere((element) => element.type == 'otp_on_login')
                    .value ==
                1) {
              otpOnLogin.value = true;
            } else {
              otpOnLogin.value = false;
            }
            if (settingsModel.value.otpConfiguration
                    .firstWhere(
                        (element) => element.type == 'otp_on_password_reset')
                    .value ==
                1) {
              otpOnPasswordReset.value = true;
            } else {
              otpOnPasswordReset.value = false;
            }
            if (settingsModel.value.otpConfiguration
                    .firstWhere(
                        (element) => element.type == 'otp_on_order_with_cod')
                    .value ==
                1) {
              otpOnOrderWithCod.value = true;
            } else {
              otpOnOrderWithCod.value = false;
            }
            if (settingsModel.value.otpConfiguration
                    .firstWhere((element) =>
                        element.type == 'order_otp_on_verified_customer')
                    .value ==
                1) {
              otpOrderOnVerifiedCustomer.value = true;
            } else {
              otpOrderOnVerifiedCustomer.value = false;
            }
            orderCancelLimitOnVerified.value = settingsModel
                .value.otpConfiguration
                .firstWhere((element) =>
                    element.type == 'order_cancel_limit_on_verified_customer')
                .value;
          }

          //* Module check

          settingsModel.value.modules.forEach((key, value) {
            if (key == "GoldPrice") {
              if (value) {
                goldPriceModule.value = true;
              } else {
                goldPriceModule.value = false;
              }
            }
            if (key == "MultiVendor") {
              if (value) {
                multivendorModule.value = true;
              } else {
                multivendorModule.value = false;
              }
            }
          });

          print("GOLDPRICE MODUEL => ${goldPriceModule.value}");
          print("MultiVendor MODUEL => ${multivendorModule.value}");

          // Map otpConfig = {
          //   'otp_configuration': otpModuleEnabled,
          //   'code_validation_time': otpCodeValidationTime,
          //   'otp_on_customer_registration': otpOnCustomerRegistration,
          //   'otp_on_password_reset': otpOnPasswordReset,
          //   'otp_on_login': otpOnLogin,
          //   'otp_on_order_with_cod': otpOnOrderWithCod,
          //   'order_otp_on_verified_customer': otpOrderOnVerifiedCustomer,
          // };
          // log(otpConfig.toString());

          isLoading(false);
        }
      } else {
        //SnackBars().snackBarError('Something went wrong.');
      }
    } catch (e) {
      throw e.toString();
    }
    return settingsModel.value;
  }

  // Future getCurrency() async {
  //   try {
  //     Uri uri = Uri.parse(URLs.CURRENCY_LIST);

  //     var response = await http.get(
  //       uri,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //       },
  //     );
  //     var currencyModel = currencyModelFromJson(response.body);
  //     if (currencyModel.msg == 'success') {
  //       currenciesList.value = currencyModel.currencies;
  //       currency.value = currencyModel.currencies
  //           .where((element) => element.code == generalCurrencyCode.value)
  //           .first;
  //       appCurrency.value = currency.value.symbol.toString();
  //       conversionRate.value = currency.value.convertRate.toPrecision(2);
  //       currencyName.value = currency.value.name;
  //     }
  //   } catch (e) {
  //     isLoading(false);
  //     print(e);
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    // _dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: AppConfig.hostUrl)).interceptor);
    getGeneralSettings();
    super.onInit();
  }

  String calculateMainPrice(ProductModel productModel) {
    String amountText;

    if (productModel.productType == ProductType.GIFT_CARD) {
      amountText = double.parse(
                  (productModel.giftCardSellingPrice * conversionRate.value)
                      .toString())
              .toStringAsFixed(2) +
          appCurrency.value;
    } else {
      if (productModel.hasDiscount == 'yes' || productModel.hasDeal != null) {
        if (productModel.product.productType == 1) {
          amountText = double.parse(
                      (productModel.maxSellingPrice * conversionRate.value)
                          .toString())
                  .toStringAsFixed(2) +
              appCurrency.value;
        } else {
          amountText = double.parse(
                      (productModel.maxSellingPrice * conversionRate.value)
                          .toString())
                  .toStringAsFixed(2) +
              appCurrency.value;
        }
      } else {
        amountText = '';
      }
    }

    return amountText;
  }

  String calculatePrice(ProductModel prod) {
    if (prod.productType == ProductType.GIFT_CARD) {
      if (prod.giftCardEndDate.compareTo(DateTime.now()) > 0) {
        priceText = singlePrice(sellingPrice(
                prod.giftCardSellingPrice, prod.discountType, prod.discount))
            .toStringAsFixed(2);
      } else {
        priceText = singlePrice(prod.giftCardSellingPrice).toStringAsFixed(2);
      }
    } else {
      if (prod.hasDeal != null) {
        if (prod.product.productType == 1) {
          priceText = singlePrice(sellingPrice(prod.skus.first.sellingPrice,
                  prod.hasDeal.discountType, prod.hasDeal.discount))
              .toStringAsFixed(2);
        } else {
          if (sellingPrice(prod.minSellPrice, prod.hasDeal.discountType,
                  prod.hasDeal.discount) ==
              sellingPrice(prod.maxSellingPrice, prod.hasDeal.discountType,
                  prod.hasDeal.discount)) {
            priceText = singlePrice(sellingPrice(prod.minSellPrice,
                    prod.hasDeal.discountType, prod.hasDeal.discount))
                .toStringAsFixed(2);
          } else {
            // print("${prod.productName} -- ${prod.product.productType} -- Max: ${prod.maxSellingPrice} -- Min: ${prod.minSellPrice}");
            priceText = singlePrice(sellingPrice(prod.minSellPrice,
                    prod.hasDeal.discountType, prod.hasDeal.discount))
                .toStringAsFixed(2);
          }
        }
      } else {
        if (prod.product.productType == 1) {
          if (prod.hasDiscount == 'yes') {
            priceText = singlePrice(sellingPrice(
                    prod.maxSellingPrice, prod.discountType, prod.discount))
                .toStringAsFixed(2);
          } else {
            priceText = singlePrice(prod.maxSellingPrice).toStringAsFixed(2);
          }
        } else {
          ///variant product
          if (sellingPrice(
                  prod.minSellPrice, prod.discountType, prod.discount) ==
              sellingPrice(
                  prod.maxSellingPrice, prod.discountType, prod.discount)) {
            if (prod.hasDiscount == 'yes') {
              priceText = singlePrice(sellingPrice(prod.skus.first.sellingPrice,
                      prod.discountType, prod.discount))
                  .toStringAsFixed(2);
            } else {
              priceText =
                  singlePrice(prod.skus.first.sellingPrice).toStringAsFixed(2);
            }
          } else {
            var priceA;
            // var priceB;
            if (prod.hasDiscount == 'yes') {
              priceA = singlePrice(sellingPrice(
                      prod.minSellPrice, prod.discountType, prod.discount))
                  .toStringAsFixed(2);
              // priceB = singlePrice(sellingPrice(
              //         prod.maxSellingPrice, prod.discountType, prod.discount))
              //     .toStringAsFixed(2);
            } else {
              priceA = singlePrice(prod.minSellPrice).toStringAsFixed(2);
              // priceB = singlePrice(prod.maxSellingPrice).toStringAsFixed(2);
            }
            priceText = '$priceA';
          }
        }
      }
    }

    return priceText;
  }

  String calculateMainPriceWithVariant(ProductModel productModel) {
    String amountText;

    if (productModel.hasDiscount == 'yes' || productModel.hasDeal != null) {
      if (productModel.product.productType == 1) {
        amountText = double.parse(
                    (productModel.maxSellingPrice * conversionRate.value)
                        .toString())
                .toStringAsFixed(2) +
            appCurrency.value;
      } else {
        amountText = double.parse(
                    (productModel.minSellPrice * conversionRate.value)
                        .toString())
                .toStringAsFixed(2) +
            appCurrency.value +
            ' - ' +
            double.parse((productModel.maxSellingPrice * conversionRate.value)
                    .toString())
                .toStringAsFixed(2) +
            appCurrency.value;
      }
    } else {
      amountText = '';
    }
    return amountText;
  }

  String calculatePriceWithVariant(ProductModel prod) {
    if (prod.hasDeal != null) {
      if (prod.product.productType == 1) {
        priceText = singlePrice(sellingPrice(prod.skus.first.sellingPrice,
                prod.hasDeal.discountType, prod.hasDeal.discount))
            .toStringAsFixed(2);
      } else {
        if (sellingPrice(prod.minSellPrice, prod.hasDeal.discountType,
                prod.hasDeal.discount) ==
            sellingPrice(prod.maxSellingPrice, prod.hasDeal.discountType,
                prod.hasDeal.discount))
          priceText = singlePrice(sellingPrice(prod.minSellPrice,
                  prod.hasDeal.discountType, prod.hasDeal.discount))
              .toStringAsFixed(2);
        else {
          priceText = singlePrice(sellingPrice(prod.minSellPrice,
                  prod.hasDeal.discountType, prod.hasDeal.discount))
              .toStringAsFixed(2);
        }
      }
    } else {
      if (prod.product.productType == 1) {
        if (prod.hasDiscount == 'yes') {
          priceText = singlePrice(sellingPrice(
                  prod.maxSellingPrice, prod.discountType, prod.discount))
              .toStringAsFixed(2);
        } else {
          priceText = singlePrice(prod.maxSellingPrice).toStringAsFixed(2);
        }
      } else {
        ///variant product
        if (sellingPrice(prod.minSellPrice, prod.discountType, prod.discount) ==
            sellingPrice(
                prod.maxSellingPrice, prod.discountType, prod.discount)) {
          if (prod.hasDiscount == 'yes') {
            priceText = singlePrice(sellingPrice(prod.skus.first.sellingPrice,
                    prod.discountType, prod.discount))
                .toStringAsFixed(2);
          } else {
            priceText =
                singlePrice(prod.skus.first.sellingPrice).toStringAsFixed(2);
          }
        } else {
          var priceA;
          var priceB;
          if (prod.hasDiscount == 'yes') {
            priceA = singlePrice(sellingPrice(prod.skus.first.sellingPrice,
                    prod.discountType, prod.discount))
                .toStringAsFixed(2);
            priceB = singlePrice(sellingPrice(prod.skus.last.sellingPrice,
                    prod.discountType, prod.discount))
                .toStringAsFixed(2);
          } else {
            priceA =
                singlePrice(prod.skus.first.sellingPrice).toStringAsFixed(2);
            priceB =
                singlePrice(prod.skus.last.sellingPrice).toStringAsFixed(2);
          }
          priceText = '$priceA - $priceB';
        }
      }
    }
    return priceText;
  }

  String calculateGiftcardPrice(ProductModel prod) {
    String price = "";
    if (prod.giftCardEndDate.compareTo(DateTime.now()) > 0) {
      price = singlePrice(sellingPrice(
              prod.giftCardSellingPrice, prod.discountType, prod.discount))
          .toStringAsFixed(2);
    } else {
      price = singlePrice(prod.giftCardSellingPrice).toStringAsFixed(2);
    }
    return price;
  }

  String calculateWishListGiftcardPrice(GiftCardData giftCardData) {
    String price = "";
    price = double.parse(
                (giftCardData.sellingPrice * conversionRate.value).toString())
            .toStringAsFixed(2) +
        appCurrency.value;
    return price;
  }

  dynamic sellingPrice(amount, discountType, discountAmount) {
    var discount = 0.0;
    if (discountType == "0" || discountType == 0) {
      discount = (amount / 100) * discountAmount;
    }
    if (discountType == "1" || discountType == 1) {
      discount = discountAmount;
    }
    var sellingPrice = amount - discount;
    return sellingPrice;
  }

  double singlePrice(double price) {
    return price * conversionRate.value;
  }

// dynamic getMin(List<ProductSkus> skus) {
//   skus.sort((u2, u1) => u2.sellingPrice.toInt() - u1.sellingPrice.toInt());
//   return skus.first.sellingPrice;
// }
//
// dynamic getMax(List<ProductSkus> skus) {
//   skus.sort((u1, u2) => u2.sellingPrice.toInt() - u1.sellingPrice.toInt());
//   return skus.first.sellingPrice;
// }
}
