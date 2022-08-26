import '../textfiled_vars.dart';
import 'validating_and_error_msgs.dart';

void validator(){
  if (titleTextfields.text.isEmpty) {
        titleValidator.value = true;
        titleErrMsg.value = "Book's at least must be 1 character";
        // return null;
      } else if (titleTextfields.text.length > 25) {
        titleValidator.value = true;
        titleErrMsg.value = "Book's must be less than 25";
        // return null;
      } else
        titleValidator.value = false;

      if (authorTextfields.text.isEmpty) {
        authorValidator.value = true;
        authorErrMsg.value = "Author's name at least must be 1 character";
        // return null;
      } else if (authorTextfields.text.length > 25) {
        authorValidator.value = true;
        authorErrMsg.value = "author must be less than 25";
        // return null;
      } else
        authorValidator.value = false;

      if (priceTextfields.text.isEmpty) {
        priceValidator.value = true;
        priceErrMsg.value = "Price is required field";
      } else
        priceValidator.value = false;

      if (imageLinkTextfields.text.isEmpty) {
        imageLinkValidator.value = true;
        imageLinkErrMsg.value = "Image is required field";
      } else
        imageLinkValidator.value = false;
      if (titleValidator.value ||
          authorValidator.value ||
          priceValidator.value ||
          imageLinkValidator.value) return null;
}