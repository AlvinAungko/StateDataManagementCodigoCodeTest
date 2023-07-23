//
//  DataUpdateService.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation

class DataUpdateService {
    
    var credentialCreateService: CredentialCreateSerivce
    
    init(credentialCreateService: CredentialCreateSerivce) {
        self.credentialCreateService = credentialCreateService
    }
    
    func updateDataModel(model: [InputDataSourceModel], inputType: InputType, text: String) -> [InputDataSourceModel] {
        model.forEach { if $0.inputType == inputType { $0.inputText = text } }
        credentialCreateService.storeUserInfo(inputType: inputType, text: text)
        return model
    }
    
    func updateDataModel(model: [InputDataSourceModel], inputType: InputType, genderStatus: GenderSelection) -> [InputDataSourceModel] {
        model.forEach { if $0.inputType == .dobAndGender { $0.genderSelectionStatus = genderStatus } }
        credentialCreateService.storeUserGenderInfo(genderStatus: genderStatus)
        return model
    }
    
}
