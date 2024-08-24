import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
//*******! this class for how to save data into sharrd pref using Expire date *******************************

class CacheHelper {
  static const String _keyData = 'myData';
  static const String _keyExpiration = 'exipartionTime';

  ///save data with expiration date in sharred pref
  Future<bool> savedDataWithExpireDate(
      String data, Duration expireDuration) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      DateTime expireTime = DateTime.now().add(expireDuration);

      pref.setString(_keyData, data);
      pref.setString(_keyExpiration, expireTime.toIso8601String());

      log('Data saved successfully with expire time  SharredPref ');
      return true;
    } catch (e) {
      log('Data saved Not Saved  ');

      return false;
    }
  }

  //******************************************************************* */
//! get data if not expire *////////////////////////////////////////////////
  // get data from sharred pref if not expire
  Future<String?> getDataIfNotExpired() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var dataSaved = pref.getString(_keyData);
      var expireDateStr = pref.getString(_keyExpiration);

      if (dataSaved == null || expireDateStr == null) {
        log('No Data found or expiration data in sharred pref');
        return null;
      }
      //** Here we check if the expire time in valid or not */
      DateTime expireTime = DateTime.parse(expireDateStr);
      if (expireTime.isAfter(DateTime.now())) {
        //expire date not end so the data is stable and i did not need
        /// to connet the api to fetch new data
        return dataSaved;
      } else {
        // data expired i need to fetch antoher data i remove the sharred pref
        pref.remove(_keyData);
        pref.remove(_keyExpiration);
        log('Data has expired. Removed from SharedPreferences.');
        return null;
      }
    } catch (e) {
      print('Error retrieving data from SharedPreferences: $e');
      return null;
    }
  }
  //******************************-*************************************** */

  void clearDataFormSharredPref() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove(_keyData);
      preferences.remove(_keyExpiration);
      log('Data removed successffully');
    } catch (e) {
      log(e.toString());
    }
  }
}
