//
//  RegisterView+Dialog.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation
import UIKit

extension RegisterViewController {
    func showDialog(descriptionMessage: String) {
        let dialog = BaseDialog()
        dialog.preferredDialogSizing = .init(horizontal: .large, vertical: .fit)
        dialog.descriptionMessage = descriptionMessage
        self.present(dialog, animated: true)
    }
}
