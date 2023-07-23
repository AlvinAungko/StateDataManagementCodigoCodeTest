//
//  Date+Extension.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation

extension Date {
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.locale = Locale.init(identifier: "en_US")
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }

}
