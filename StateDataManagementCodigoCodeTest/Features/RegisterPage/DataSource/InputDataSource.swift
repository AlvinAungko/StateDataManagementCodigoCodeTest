//
//  InputDataSource.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation

class InputDataSource {
    static var inputDataList: [InputDataSourceModel] = [
        .init(inputText: "", placeHolder: "Regina", mandatoryStatus: .isMandatory, inputType: .firstName),
        .init(inputText: "", placeHolder: "Chan", mandatoryStatus: .isMandatory, inputType: .lastName),
        .init(inputText: "", placeHolder: "regina@codigo.co", mandatoryStatus: .isMandatory, inputType: .emailAddress),
        .init(inputText: "", placeHolder: "DD/ MM/ YYYY", mandatoryStatus: .isMandatory, inputType: .dobAndGender, genderSelectionStatus: .female),
        .init(inputText: "", placeHolder: "Singaporean", mandatoryStatus: .isMandatory, inputType: .nationality, listOfString: ["Singaporean"]),
        .init(inputText: "", placeHolder: "Singapore", mandatoryStatus: .isMandatory, inputType: .countryOfResidence, listOfString: ["Singapore"]),
        .init(inputText: "", placeHolder: "81 39 9124", mandatoryStatus: .isNotMandatory, inputType: .mobileNo, countryCode: "+65")
    ]
}
