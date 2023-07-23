//
//  ValidatorService.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation

enum MandatoryDataChecker {
    case missingFirstName
    case missingLastName
    case missingEmailAddress
    case missingDateOfBirth
    case missingGender
    case missingNationality
    case missingResidence
    case allValid
}

class ValidatorService {
    
    var userInfo: UserInfo
    
    init(userInfo: UserInfo) {
        self.userInfo = userInfo
    }
    
    func isEmailValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isPhoneNumberValid(phoneNumber: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
    
    func checkeMandatoryDataList() -> MandatoryDataChecker {
        if userInfo.firstName == nil || userInfo.firstName == "" {
            return .missingFirstName
        } else if userInfo.lastName == nil || userInfo.lastName == "" {
            return .missingLastName
        } else if userInfo.emailAddress == nil || userInfo.emailAddress == "" {
            return .missingEmailAddress
        } else if userInfo.dateofBirth == nil || userInfo.dateofBirth == "" {
            return .missingDateOfBirth
        } else if userInfo.genderSelectionStatus == nil {
            return .missingGender
        } else if userInfo.nationality == nil || userInfo.nationality == "" {
            return .missingNationality
        } else if userInfo.countryOfResidence == nil || userInfo.countryOfResidence == "" {
            return .missingResidence
        } else {
            return .allValid
        }
    }
    
}
