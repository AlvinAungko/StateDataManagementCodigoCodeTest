//
//  BaseTableViewCell.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation
import UIKit

class BaseTableViewCell<T>: UITableViewCell {
  
    var item: T? {
        didSet {
            if let item = item {
                bindData(item)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUIs()
        applyTheme()
        setupTest()
    }
    
    func setupUIs() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        applyTheme()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
 
    func applyTheme() {
        selectionStyle = .none
    }
    
    func setupTest() {
        
    }
    
    func bindData(_ item: T) {
        
    }
    
    func setUpFontAndTextColor(label: UILabel, font: UIFont, color: UIColor) {
        label.font = font
        label.textColor = color
    }
}
