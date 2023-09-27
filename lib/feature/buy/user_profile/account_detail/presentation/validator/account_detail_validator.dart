enum AccountDetailFieldsEnum { firstName, lastName, email }

class AccountDetailErrors {
  Map<AccountDetailFieldsEnum, String?> validator(Map<AccountDetailFieldsEnum, dynamic> values) {
    return {
      AccountDetailFieldsEnum.firstName: null,
      AccountDetailFieldsEnum.lastName: null,
      AccountDetailFieldsEnum.email: null,
    };
  }
}
