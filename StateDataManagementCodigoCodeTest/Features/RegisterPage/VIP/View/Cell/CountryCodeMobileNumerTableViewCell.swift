//
//  CountryCodeMobileNumerTableViewCell.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import UIKit

class CountryCodeMobileNumerTableViewCell: BaseTableViewCell<InputDataSourceModel> {

    @IBOutlet weak var countryCodeInputTextfield: CountryCodeWithPhoneNumberTextField!
    var delegate: RegisterViewDelegate?
    
    override func setupUIs() {
        super.setupUIs()
    }
    
    override func bindData(_ item: InputDataSourceModel) {
        super.bindData(item)
        countryCodeInputTextfield.item = item
        countryCodeInputTextfield.handleOnTapTextField { self.delegate?.didTextChange(inputType: $0, text: $1) }
    }
}
