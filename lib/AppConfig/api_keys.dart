const String customServerUrl =
    'https://us-central1-amazcart-341610.cloudfunctions.net/expressApp';

///
//**PAYPAL
///
const String paypalDomain =
    "https://api.sandbox.paypal.com"; // "https://api.paypal.com"; // for production mode
const String paypalCurrency = 'USD';
const String paypalClientId =
    'AQgAWV4PlM9g81xZ51TLtVi68KjB89s4mpcchFschs7OvTM-3p4zsQTDqHOkv5Sw44k9goHlE-VAC7zj';
const String paypalClientSecret =
    'ELLoQfnZ4kRbDkul81U_RNRsgHgFPDumlUloCcX6nO6ziXRXKob8gVYaTn6CGCeNVJtBqsfv7VtbsuR2';

///
//**RAZORPAY
///
//**:: Change Razor Pay API Key and API Secret for Razor Pay Payment
const String razorPayKey = 'rzp_test_lQtnyQrR6BUBkf';
const String razorPaySecret = 'Fg3w0gZ7YITgjVoms98fekTf';
//**:: Change Company Name to show on Payment pages
const String companyName = "Amazcart";

///
/// Stripe
///
const String stripeServerURL = '$customServerUrl';
const String stripeCurrency = "usd";
const String stripeMerchantID = "test";
const String stripePublishableKey =
    "pk_test_51JAWNlKS0igSTFP16dhgcM1fBayh6DStrpu5OA7jjAzYiFX3Bht0X8ARULBpIAVkgmws7PWEliNi4Q35Iyk8ThQL00aoNnF3OE";

///
/// Jazzcash
///
const String jazzCashMerchantId = "MC21703";
const String jazzCashPassword = "33183usuyg";
const String jazzCashReturnUrl =
    "https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction";
const String jazzCashIntegritySalt = "129yw891tx";

///
/// InstaMojo
///
const String instaMojoApiUrl = 'https://test.instamojo.com/api/1.1';
const String instaMojoApiKey = 'test_653cb00cbfc37b41dc7fad3bf92';
const String instaMojoAuthToken = 'test_ba9959aa2b6a5be5cb7e0d36a17';

///
/// Midtrans
///
const String midTransServerUrl = '$customServerUrl';

///
/// PayTM
///
const bool payTmIsTesting = true;
const String initiatePayTmTransaction =
    "$customServerUrl/initiatePayTmTransaction";
const String payTMmid = "mmHPCS25768835616700";

///
/// FLUTTERWAVE
///
const String flutterWaveEncryptionKey = 'FLWSECK_TEST4368b34a6870';
const String flutterWavePublicKey =
    'FLWPUBK_TEST-17a05b44892382781970dbab2c3f1750-X';

///
/// Paystack
///
const String payStackPublicKey =
    "pk_test_cb290d59b9ec539d7bc3617d1fee3d8a9cdb78b3";
