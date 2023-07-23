//
//  UserInfo.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation

class UserInfo {
    
    static let shared = UserInfo()
    
    var firstName: String?
    var lastName: String?
    var emailAddress: String?
    var genderSelectionStatus: GenderSelection?
    var nationality: String?
    var countryOfResidence: String?
    var countryCode: String?
    var mobileNumber: String?
    var dateofBirth: String?
    
    var fullName: String {
        return (self.firstName ?? "") + (self.lastName ?? "")
    }
    
    var gender: String {
        switch genderSelectionStatus {
        case .female:
            return "Female"
        case .male:
            return "Male"
        default:
            return ""
        }
    }
    
    private init() {}
    
}
