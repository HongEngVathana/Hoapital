class FormUtil {
  // Function to validate First Name
  static String? validateFirstName(String? firstName) {
    if (firstName == null || firstName.isEmpty) {
      return "First Name cannot be empty!";
    } else if (firstName.length < 2) {
      return "First Name must be at least 2 characters!";
    }
    return null;
  }

  // Function to validate Last Name
  static String? validateLastName(String? lastName) {
    if (lastName == null || lastName.isEmpty) {
      return "Last Name cannot be empty!";
    } else if (lastName.length < 2) {
      return "Last Name must be at least 2 characters!";
    }
    return null;
  }

  // Function to validate Gender
  static String? validateGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return "Gender cannot be empty!";
    } else if (gender != "Male" && gender != "Female" && gender != "Other") {
      return "Gender must be Male, Female, or Other!";
    }
    return null;
  }

  // Function to validate Date of Birth
  static String? validateDateOfBirth(DateTime? dateOfBirth) {
    if (dateOfBirth == null) {
      return "Date of Birth cannot be empty!";
    } else if (DateTime.now().year - dateOfBirth.year < 18) {
      return "You must be at least 18 years old!";
    }
    return null;
  }
}

//it is Exmaple How to and Why we use Utilities folder
