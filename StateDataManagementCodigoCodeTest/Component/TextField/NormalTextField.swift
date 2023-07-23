//
//  NormalTextField.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import UIKit

class NormalTextField: UIView {
    
    var pickerView = UIPickerView()
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var inputTitle: UILabel!
    var onTapTextField: ((InputType, String) -> Void)?
    var onTapDone: (() -> Void)?
    var pickerList: [String] = []
    
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
        setupUI()
        addActionListeners()
    }
    
    func setupUI() {
        inputTextField.autocorrectionType = .no
    }
    
    func addActionListeners() {
        inputTextField.delegate = self
    }
    
    func setUpView() {
        let view = self.loadNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func handleOnTapTextField(completion: @escaping(InputType, String) -> Void) {
        self.onTapTextField = completion
    }
    
    func bindData(item: InputDataSourceModel) {
        inputTextField.placeholder = item.placeHolder
        inputTitle.text = item.inputType.inputTitle + (item.mandatoryStatus == .isMandatory ? " *" : "(Optional)")
        switch item.inputType {
        case .emailAddress:
            inputTextField.keyboardType = .emailAddress
        case .nationality:
            inputTextField.resignFirstResponder()
            pickerList = item.listOfString ?? []
            configurePicker(textField: inputTextField)
        case .countryOfResidence:
            inputTextField.resignFirstResponder()
            pickerList = item.listOfString ?? []
            configurePicker(textField: inputTextField)
        default:
            break
        }
    }
    
    private func configurePicker(textField: UITextField) {
        let dropDown = UIImageView(image: UIImage(named: "Dropdown"))
        let stackView = UIStackView(arrangedSubviews: [dropDown])
        stackView.isUserInteractionEnabled = false
        dropDown.contentMode = .center
        dropDown.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dropDown.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        var rightView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: textField.frame.height))
        rightView = stackView
        
        textField.rightView = rightView
        textField.rightViewMode = .always
        
        createPickerView(textField: textField)
        dismissPickerView(textField: textField)
        
    }
    
    func dismissPickerView(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.tintColor = .black
        toolBar.barTintColor = .white
        toolBar.layer.cornerRadius = 30
        toolBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        toolBar.layer.masksToBounds = true
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handlePickerAction))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexibleSpace, button], animated: true)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    func createPickerView(textField: UITextField) {
        pickerView.delegate = self
        pickerView.backgroundColor = .white
        textField.inputView = pickerView
    }
    
    @objc func handlePickerAction() {
        self.onTapDone?()
    }
    
    func handleTapDone(completion: @escaping() -> Void) {
        self.onTapDone = completion
    }
}

extension NormalTextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let item = item {
            switch item.inputType {
            case .nationality, .countryOfResidence:
                textField.text = textField.text?.isEmpty == true ? pickerList.first : textField.text
            default:
               break
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let item = item { self.onTapTextField?(item.inputType, textField.text ?? "") }
    }
}

extension NormalTextField: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.inputTextField?.text = pickerList[row]
    }
}
