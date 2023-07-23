//
//  DOBandGenderTableViewCell.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import UIKit

class DOBandGenderTableViewCell: BaseTableViewCell<InputDataSourceModel> {

    @IBOutlet weak var dobTextField: DOBnGenderSelectionTextField!
    var delegate: RegisterViewDelegate?
    
    override func setupUIs() {
        super.setupUIs()
    }
    
    override func bindData(_ item: InputDataSourceModel) {
        super.bindData(item)
        dobTextField.item = item
        dobTextField.handleTapDone { self.delegate?.didTapDoneByPicker() }
        dobTextField.handleOnTapTextField { self.delegate?.didTextChange(inputType: $0, text: $1)}
        dobTextField.handleGenderTap { self.delegate?.didGenderChange(inputType: .dobAndGender, genderSelection: $0) }
    }
}
