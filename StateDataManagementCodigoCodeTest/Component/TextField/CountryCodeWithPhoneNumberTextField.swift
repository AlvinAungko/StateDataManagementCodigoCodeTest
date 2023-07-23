//
//  CountryCodeWithPhoneNumberTextField.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import UIKit

class CountryCodeWithPhoneNumberTextField: UIView {

    @IBOutlet weak var countryCodeTextField: UITextField!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var inputTitle: UILabel!
    
    var onTapTextField: ((InputType, String) -> Void)?
    
    var item: InputDataSourceModel? {
        didSet {
            if let item = item {
                self.bindData(item: item)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        addActionListeners()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
        addActionListeners()
    }

    func setUpView() {
        let view = self.loadNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func addActionListeners() {
        inputTextField.delegate = self
    }
    
    func handleOnTapTextField(completion: @escaping(InputType, String) -> Void) {
        self.onTapTextField = completion
    }
    
    func bindData(item: InputDataSourceModel) {
        inputTextField.placeholder = item.placeHolder
        inputTitle.text = item.inputType.inputTitle + (item.mandatoryStatus == .isMandatory ? " *" : "(Optional)")
        switch item.inputType {
        case .mobileNo:
            inputTextField.resignFirstResponder()
            inputTextField.keyboardType = .phonePad
        default:
            break
        }
    }
}

extension CountryCodeWithPhoneNumberTextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let item = item { self.onTapTextField?(item.inputType, textField.text ?? "") }
    }
}

