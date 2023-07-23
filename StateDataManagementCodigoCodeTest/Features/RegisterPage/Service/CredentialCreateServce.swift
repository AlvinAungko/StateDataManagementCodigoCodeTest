//
//  CredentialCreateServce.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation

class CredentialCreateSerivce {
    
    var userInfo: UserInfo
    
    init(userInfo: UserInfo) {
        self.userInfo = userInfo
    }
    
    func storeUserInfo(inputType: InputType, text: String) {
        switch inputType {
        case .firstName:
            self.userInfo.firstName = text
        case .lastName:
            self.userInfo.lastName = text
        case .emailAddress:
            self.userInfo.emailAddress = text
        case .dobAndGender:
            self.userInfo.dateofBirth = text
        case .nationality:
            self.userInfo.nationality = text
        case .countryOfResidence:
            self.userInfo.countryOfResidence = text
        case .mobileNo:
            self.userInfo.mobileNumber = text
            self.userInfo.countryCode = "+65"
        }
    }
    
    func storeUserGenderInfo(genderStatus: GenderSelection) {
        self.userInfo.genderSelectionStatus = genderStatus
    }
    
    func storeUserCountryCode(text: String) {
        self.userInfo.countryCode = text
    }
}
