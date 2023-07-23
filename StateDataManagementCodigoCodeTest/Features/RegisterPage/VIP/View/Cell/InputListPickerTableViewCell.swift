//
//  InputListPickerTableViewCell.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import UIKit

class InputListPickerTableViewCell: BaseTableViewCell<InputDataSourceModel> {

    @IBOutlet weak var inputTextField: NormalTextField!
    var delegate: RegisterViewDelegate?
    
    override func setupUIs() {
        super.setupUIs()
    }
    
    override func bindData(_ item: InputDataSourceModel) {
        super.bindData(item)
        inputTextField.item = item
        inputTextField.handleOnTapTextField { self.delegate?.didTextChange(inputType: $0, text: $1) }
        inputTextField.handleTapDone { self.delegate?.didTapDoneByPicker() }
    }
}
