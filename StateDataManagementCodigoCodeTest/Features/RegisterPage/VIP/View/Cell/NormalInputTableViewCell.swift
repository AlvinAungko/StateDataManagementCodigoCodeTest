//
//  NormalInputTableViewCell.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import UIKit

class NormalInputTableViewCell: BaseTableViewCell<InputDataSourceModel> {

    @IBOutlet weak var normalInputTextField: NormalTextField!
    var delegate: RegisterViewDelegate?
    
    override func setupUIs() {
        super.setupUIs()
    }
    
    override func bindData(_ item: InputDataSourceModel) {
        super.bindData(item)
        normalInputTextField.item = item
        normalInputTextField.handleOnTapTextField { self.delegate?.didTextChange(inputType: $0, text: $1)}
    }
}
