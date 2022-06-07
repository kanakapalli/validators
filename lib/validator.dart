void main(List<String> args) {
  var test = HeyValidate();

  print(test.email(6789));
  // print(test.phonenumber('kanakapalli.anurag@gmail.com'));
  // print(test.number('kanakapalli.anurag@gmail.com'));
  // print(test.trueorfalse('kanakapalli.anurag@gmail.com'));
  // print(test.date('kanakapalli.anurag@gmail.com'));
  // print(test.postalcode('kanakapalli.anurag@gmail.com'));
  // print(test.url('kanakapalli.anurag@gmail.com'));
  // print(test.checkwhitespacess('kanakapalli.anurag@gmail.com'));
  // print(test.email('kanakapalli.anurag@gmail.com'));
}

class HeyValidate {
  String? email(Object email) {
    if (email is String) {
      bool isemail = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);
      if (isemail) return null;
      return 'this not a email';
    }
    Exception('object is not string');
    return null;
  }

  String? phonenumber(Object number, {Countrycode? code}) {
    if (number is String) {
      number = number.replaceAll(' ', '');
      if (number.length != 10)
        return 'Mobile Number must be of 10 digit';
      else
        return null;
    }

    if (number is int) {
      if (number.toString().length != 10)
        return 'Mobile Number must be of 10 digit';
      else
        return null;
    }
    Exception('can only pass int or string');
    return null;
  }

  Object? number(Object number, [bool convert = false]) {
    // resposnce will be either String or int
    // u can validate string being number and also canvert to int
    //by passing convert varable as true
    //usage : for validation & converting
    if (number is String) {
      try {
        int.parse(number);
        if (convert) return int.parse(number);
        return 'it is a number';
      } catch (e) {
        return 'it is not a number';
      }
    }

    if (number is int) return 'it is a number';
  }

  String trueorfalse(Object value) {
    if (value is bool) return '';
    return '';
  }

  String? password(String password,
      [PasswordStrength strength = PasswordStrength.strong]) {
    if (strength == PasswordStrength.weak) {}
    if (strength == PasswordStrength.modrate) {}
    if (strength == PasswordStrength.strong) {}
  }

  String date(Object date) {
    if (date is String) {}
    if (date is DateTime) return '';
    return '';
  }

  String postalcode(Object code) {
    String regex = "^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}\$";
    bool check(String code) {
      return RegExp(regex).hasMatch(code);
    }

    if (code is String) {
      if (check(code)) return 'its a postal code';
      return 'not a postal code';
    }
    if (code is int) {}
    return 'only string and int';
  }
  // String url(Object url) {}

  // String checkwhitespacess(Object) {}
}

enum PasswordStrength { weak, modrate, strong }

enum Countrycode { us, ind }
