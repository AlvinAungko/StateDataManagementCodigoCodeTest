//
//  InputDataSourceModel.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation

enum GenderSelection {
    case male
    case female
}

enum InputType {
    case firstName
    case lastName
    case emailAddress
    case dobAndGender
    case nationality
    case countryOfResidence
    case mobileNo
    
    var inputTitle: String {
        switch self {
        case .firstName:
            return "First Name"
        case .lastName:
            return "Last Name"
        case .emailAddress:
            return "Email Address"
        case .dobAndGender:
            return "Date of Birth"
        case .nationality:
            return "Nationality"
        case .countryOfResidence:
            return "Country of Residence"
        case .mobileNo:
            return "Mobile no."
        }
    }
}

enum Mandatory {
    case isMandatory
    case isNotMandatory
}

class InputDataSourceModel {
    var inputText: String
    var placeHolder: String
    var mandatoryStatus: Mandatory
    var inputType: InputType
    var genderSelectionStatus: GenderSelection?
    var listOfString: [String]?
    var countryCode: String?
    
    init(inputText: String, placeHolder: String, mandatoryStatus: Mandatory, inputType: InputType, genderSelectionStatus: GenderSelection? = nil, listOfString: [String]? = nil, countryCode: String? = nil) {
        self.inputText = inputText
        self.placeHolder = placeHolder
        self.mandatoryStatus = mandatoryStatus
        self.inputType = inputType
        self.genderSelectionStatus = genderSelectionStatus
        self.listOfString = listOfString
        self.countryCode = countryCode
    }
}
