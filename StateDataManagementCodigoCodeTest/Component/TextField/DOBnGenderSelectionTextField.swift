//
//  DOBnGenderSelectionTextField.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import UIKit

class DOBnGenderSelectionTextField: UIView {

    @IBOutlet weak var inputTitle: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var segmentControl: CustomSegmentedControl!
    var onTapTextField: ((InputType, String) -> Void)?
    var onTapGender: ((GenderSelection) -> Void)?
    var onTapDone: (() -> Void)?
    
    var item: InputDataSourceModel? {
        didSet {
            if let item = item {
                self.bindData(item: item)
            }
        }
    }
    
    var datePicker = UIDatePicker()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
        setupUI()
    }
    
    func setUpView() {
        let view = self.loadNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        setupUI()
    }
    
    func setupUI() {
        segmentControl.addTarget(self, action: #selector(handleSegmentAction(_:)), for: .valueChanged)
        segmentControl.setTitle("Female", forSegmentAt: 0)
        segmentControl.setTitle("Male", forSegmentAt: 1)
    }
    
    func bindData(item: InputDataSourceModel) {
        segmentControl.selectedSegmentIndex = item.genderSelectionStatus == .female ? 0 : 1
        inputTextField.placeholder = item.placeHolder
        inputTextField.delegate = self
        inputTitle.text = item.inputType.inputTitle + (item.mandatoryStatus == .isMandatory ? " *" : "(Optional)")
        switch item.inputType {
        case .dobAndGender:
            inputTextField.resignFirstResponder()
            configureDatePicker(textField: inputTextField)
        default:
            break
        }
    }
    
    private func configureDatePicker(textField: UITextField) {
        let dropDown = UIImageView(image: UIImage(named: "date"))
        let stackView = UIStackView(arrangedSubviews: [dropDown])
        stackView.isUserInteractionEnabled = false
        dropDown.contentMode = .center
        dropDown.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dropDown.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        var rightView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: textField.frame.height))
        rightView = stackView
        
        textField.rightView = rightView
        textField.rightViewMode = .always
        
        createDatePicker(textField: textField)
        dismissPickerView(textField: textField)
    }
    
    func createDatePicker(textField: UITextField) {
        datePicker.date = Date()
        datePicker.maximumDate = Date()
        datePicker.locale = Locale.init(identifier: "en_US")
        datePicker.datePickerMode = .date
        inputTextField.inputView = datePicker
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.backgroundColor = .white
        datePicker.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
    }
    
    @objc func handleDateSelection() {
        inputTextField.text = datePicker.date.toString
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
    
    func handleOnTapTextField(completion: @escaping(InputType, String) -> Void) {
        self.onTapTextField = completion
    }
    
    func handleTapDone(completion: @escaping() -> Void) {
        self.onTapDone = completion
    }
    
    @objc func handlePickerAction() {
        self.onTapDone?()
    }
    
    @objc func handleSegmentAction(_ sender: UISegmentedControl) {
        self.onTapGender?(sender.selectedSegmentIndex == 0 ? .female : .male)
    }
    
    func handleGenderTap(completion: @escaping(GenderSelection) -> Void) {
        self.onTapGender = completion
    }
}

extension DOBnGenderSelectionTextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let item = item { self.onTapTextField?(item.inputType, textField.text ?? "") }
    }
}
