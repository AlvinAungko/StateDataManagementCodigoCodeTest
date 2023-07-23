//
//  RegisterRouter.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation

class RegisterRouter {
    static func createFeature() -> RegisterViewController {
        let vc = RegisterViewController()
        vc.inputDataSource = InputDataSource.inputDataList
        vc.dataUpdateService = .init(credentialCreateService: .init(userInfo: UserInfo.shared))
        vc.dataValidationService = .init(userInfo: UserInfo.shared)
        return vc
    }
}
