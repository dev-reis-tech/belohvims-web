import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TextTranslationConverter with ChangeNotifier {
  String? descriptionLetters(BuildContext context, String stringInfo) {
    switch (stringInfo) {
      case "lovetterDescription":
        return AppLocalizations.of(context)!.lovetterDescription;
      default:
        return null;
    }
  }

  String? stringsMainPageAndMainDrawer(
      BuildContext context, String stringInfo) {
    switch (stringInfo) {
      case "addPartner":
        return AppLocalizations.of(context)!.addPartner;
      case "exitAccount":
        return AppLocalizations.of(context)!.exitAccount;
      case "userInfo":
        return AppLocalizations.of(context)!.userInfo;
      case "changeLanguage":
        return AppLocalizations.of(context)!.changeLanguage;
      case "clickDescription":
        return AppLocalizations.of(context)!.clickDescription;
      case 'descriptionMainPage':
        return AppLocalizations.of(context)!.descriptionAppMainPage;
      default:
        return null;
    }
  }

  String? stringsUserInfoPage(BuildContext context, String stringInfo) {
    switch (stringInfo) {
      case "userInfo":
        return AppLocalizations.of(context)!.userInfo;

      case "email":
        return AppLocalizations.of(context)!.email;
      case "emailNotFound":
        return AppLocalizations.of(context)!.emailNotfound;
      case "name":
        return AppLocalizations.of(context)!.name;
      case "nameNotFound":
        return AppLocalizations.of(context)!.nameNotfound;
      case "securityCode":
        return AppLocalizations.of(context)!.securityCode;
      case "securityCodeNotFound":
        return AppLocalizations.of(context)!.securityCodeNotfound;
      case "partnerName":
        return AppLocalizations.of(context)!.partnerName;
      case "partnerNameNotFound":
        return AppLocalizations.of(context)!.partnerNameNotFound;
      case "phoneNumber":
        return AppLocalizations.of(context)!.phoneNumber;
      case "phoneNumberNotFound":
        return AppLocalizations.of(context)!.phoneNumberNotFound;
      case "infoDiaryUser":
        return AppLocalizations.of(context)!.infoDiaryUser;
      case "diaryName":
        return AppLocalizations.of(context)!.diaryName;
      case "diaryNameNotFound":
        return AppLocalizations.of(context)!.diaryNameNotFound;
      case "datingDate":
        return AppLocalizations.of(context)!.datingDate;
      case "datingDateNotFound":
        return AppLocalizations.of(context)!.datingDateNotFound;
      case "diaryCreationDate":
        return AppLocalizations.of(context)!.diaryCreationDate;
      case "diaryCreationDateNotFound":
        return AppLocalizations.of(context)!.diaryCreationDateNotFound;
      default:
        return null;
    }
  }
}
