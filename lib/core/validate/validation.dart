import 'package:flutter/cupertino.dart';

class Validations {
  static String? code(String? code) => code!.isEmpty
      ? 'من فضلك أدخل الكود'
      : code.length < 4
          ? 'من فضلك تأكد من الكود المرسل إليك'
          : null;

  static String? validateUserEmail(String? email) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email!)
          ? null
          : 'أدخل بريد إلكتروني صحيح';

  static String? password(String? value) => value!.isEmpty
      ? 'من فضلك أدخل كلمة المرور'
      : value.length < 8
          ? 'يجب الا تقل كلمة المرور عن ٨ أحرف'
          : null;

  static String? phone(String? value) => value!.isEmpty
      ? 'من فضلك أدخل رقم الجوال'
      : value.length < 9
          ? 'يجب الا يقل رقم الجوال الخاص بك عن ٩ رقم'
          : null;

  static String? username(String? value) =>
      value!.isEmpty ? 'من فضلك أدخل اسم المستخدم' : null;

  static String? phoneOrEmail(String? value) =>
      value!.isEmpty ? 'من فضلك أدخل رقم الهاتف او الإيميل' : null;

  static String? locationDetails(String? value) =>
      value!.isEmpty ? 'من فضلك أدخل تفاصيل الموقع' : null;
  static String? clientCarName(String? value) =>
      value!.isEmpty ? 'من فضلك اختر المركبة المتضررة' : null;

  static String? carBrand(String? value) =>
      value!.isEmpty ? 'من فضلك أدخل نوع السيارة' : null;

  static String? carYear(String? value) =>
      value!.isEmpty ? 'من فضلك أدخل سنة الصنع' : null;

  static String? carModel(String? value) =>
      value!.isEmpty ? 'من فضلك أدخل موديل السيارة' : null;

  static String? chassisNumber(String? value) =>
      value!.isEmpty ? 'من فضلك أدخل رقم الشاسيه' : null;

  static String? licenseNumber(String? value) =>
      value!.isEmpty ? 'من فضلك أدخل رخصة السيارة' : null;

  static String? city(String? value) =>
      value!.isEmpty ? 'من فضلك أدخل المدينة' : null;

  static String? conPassword(String? password, String? passwordConfirmation) =>
      passwordConfirmation!.isEmpty
          ? 'من فضلك أدخل كلمة المرور'
          : passwordConfirmation.length < 8
              ? 'يجب الا تقل كلمة المرور عن ٨ أحرف'
              : passwordConfirmation != password
                  ? 'من فضلك تأكد من كلمة المرور'
                  : null;
}
