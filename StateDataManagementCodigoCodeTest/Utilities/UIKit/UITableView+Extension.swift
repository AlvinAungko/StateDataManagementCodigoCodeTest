//
//  UITableView+Extension.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerForCells(_ strIDs: String...) {
        strIDs.forEach { (strID) in
            register(UINib(nibName: strID, bundle: nil), forCellReuseIdentifier: strID)
        }
    }
    
    func registerForCells(_ strIDs: [String]) {
        strIDs.forEach { (strID) in
            register(UINib(nibName: strID, bundle: nil), forCellReuseIdentifier: strID)
        }
    }
}
