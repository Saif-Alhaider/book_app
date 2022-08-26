import 'package:get/get.dart';

Rx<bool> titleValidator = Rx<bool>(false);
Rx<bool> authorValidator = Rx<bool>(false);
Rx<bool> priceValidator = Rx<bool>(false);
Rx<bool> imageLinkValidator = Rx<bool>(false);
Rx<bool> descriptionValidator = Rx<bool>(false);
Rx<String> titleErrMsg = Rx<String>("");
Rx<String> authorErrMsg = Rx<String>("");
Rx<String> priceErrMsg = Rx<String>("");
Rx<String> imageLinkErrMsg = Rx<String>("");
Rx<String> descriptionErrMsg = Rx<String>("");
