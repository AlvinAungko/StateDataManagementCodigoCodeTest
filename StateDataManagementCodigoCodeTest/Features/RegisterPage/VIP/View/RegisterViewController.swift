//
//  RegisterViewController.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import UIKit

protocol RegisterViewDelegate: AnyObject {
    func didTextChange(inputType: InputType, text: String)
    func didGenderChange(inputType: InputType, genderSelection: GenderSelection)
    func didTapCountryCode()
    func didTapDoneByPicker()
}

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var inputDataSource: [InputDataSourceModel] = []
    var dataUpdateService: DataUpdateService?
    var dataValidationService: ValidatorService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        createAccountButton.layer.cornerRadius = 15
        setUpTableView()
        addActionListeners()
    }
    
    func setUpTableView() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.contentInset = .zero
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.registerForCells(
            NormalInputTableViewCell.className,
            DOBandGenderTableViewCell.className,
            InputListPickerTableViewCell.className,
            CountryCodeMobileNumerTableViewCell.className
        )
    }
    
    func addActionListeners() {
        createAccountButton.addTarget(self, action: #selector(self.handleCreateAction), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(self.handleBackAction), for: .touchUpInside)
    }
    
    @objc func handleCreateAction() {
        if let dataValidationService = dataValidationService {
            switch dataValidationService.checkeMandatoryDataList() {
            case .missingFirstName:
                self.showDialog(descriptionMessage: "First Name Must not be Empty!")
            case .missingLastName:
                self.showDialog(descriptionMessage: "Last Name Must not be Empty!")
            case .missingEmailAddress:
                self.showDialog(descriptionMessage: "Email Address Must not be Empty!")
            case .missingDateOfBirth:
                self.showDialog(descriptionMessage: "Date Of Birth Must not be Empty!")
            case .missingGender:
                self.showDialog(descriptionMessage: "Gender Must not be Empty!")
            case .missingNationality:
                self.showDialog(descriptionMessage: "Nationality Must not be Empty!")
            case .missingResidence:
                self.showDialog(descriptionMessage: "Residence Must not be Empty!")
            case .allValid:
                self.showDialog(descriptionMessage: "Creation Success")
            }
        }
        
    }
    
    @objc func handleBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController: RegisterViewDelegate {
    func didTapDoneByPicker() {
        view?.endEditing(true)
    }
    
    func didTextChange(inputType: InputType, text: String) {
        inputDataSource = dataUpdateService?.updateDataModel(model: inputDataSource, inputType: inputType, text: text) ?? []
        self.validateInputData(inputType: inputType, text: text)
    }
    
    func didGenderChange(inputType: InputType, genderSelection: GenderSelection) {
        inputDataSource = dataUpdateService?.updateDataModel(model: inputDataSource, inputType: inputType, genderStatus: genderSelection) ?? []
    }
    
    func didTapCountryCode() {}
    
    func validateInputData(inputType: InputType, text: String) {
        if let validationService = dataValidationService {
            switch inputType {
            case .emailAddress:
                if !validationService.isEmailValid(email: text) {
                    self.showDialog(descriptionMessage: "Invalid Email Format!")
                }
            case .mobileNo:
                if !validationService.isPhoneNumberValid(phoneNumber: text) {
                    self.showDialog(descriptionMessage: "Invalid Phone Format!")
                }
            default:
                break
            }
        }
    }
}
