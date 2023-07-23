//
//  RegisterViewController+TableView.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation
import UIKit

extension RegisterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch inputDataSource[indexPath.row].inputType {
        case .firstName, .lastName, .emailAddress:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NormalInputTableViewCell.className, for: indexPath) as? NormalInputTableViewCell else {
                return UITableViewCell()
            }
            cell.item = inputDataSource[indexPath.row]
            cell.delegate = self
            return cell
        case .dobAndGender:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DOBandGenderTableViewCell.className, for: indexPath) as? DOBandGenderTableViewCell else {
                return UITableViewCell()
            }
            cell.item = inputDataSource[indexPath.row]
            cell.delegate = self
            return cell
        case .nationality, .countryOfResidence:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InputListPickerTableViewCell.className, for: indexPath) as? InputListPickerTableViewCell else {
                return UITableViewCell()
            }
            cell.item = inputDataSource[indexPath.row]
            cell.delegate = self
            return cell
        case .mobileNo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCodeMobileNumerTableViewCell.className, for: indexPath) as? CountryCodeMobileNumerTableViewCell else {
                return UITableViewCell()
            }
            cell.item = inputDataSource[indexPath.row]
            cell.delegate = self
            return cell
        }
    }
}
