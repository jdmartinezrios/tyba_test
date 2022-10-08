enum UniversityEndpoints { GETALL }

class UniversityConstants {
  // ********* Strings filters ***********
  static const String LIST_VIEW = 'List';
  static const String GRID_VIEW = 'Grid';
  // **************** // *****************

  // ***************** Strings actions ******************
  static const String TRY_AGAIN = 'Try Again!';
  static const String UPLOAD = 'Upload image';
  static const String INPUT = 'Enter number of students';
  // *********************** // *************************

  // *************** Strings titles **********************
  static const String APP_TITLE = 'Tyba Test';
  static const String HOME_TITLE = 'Universities';
  static const String DETAIL_TITLE = 'University Detail';
  // ********************* // ****************************

  // ******************** Strings api ************************
  static const String API_URL =
      'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test';
  // ************************** // +**************************

  // ***************** Strings endpotins *********************
  static const Map<UniversityEndpoints, dynamic> SERVICES = {
    UniversityEndpoints.GETALL: '$API_URL/universities.json',
  };
  // ************************** // +**************************

  // ******************* Strings validation ********************
  static const String NO_CODE = 'No code';
  static const String NO_COUNTRY = 'No country';
  static const String NO_PROVINCE = 'No province';
  static const String FIELD_REQUIRED = 'This field is required';
  // ************************** // *****************************

  // ************************* Strings errors ***************************
  static const String ERROR_FETCHING = 'Error fetching data from server!';
  // ***************************** // ************************************
}
