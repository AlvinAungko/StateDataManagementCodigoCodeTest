//
//  CustomSegmentControl.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import Foundation
import UIKit

class CustomSegmentedControl: UISegmentedControl {
    private let segmentInset: CGFloat = 10
    private let segmentImage: UIImage? = UIImage(color: UIColor.white)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .normal)
        
        setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .selected)
        
        // background
        backgroundColor = UIColor(named: "#C8CEE4")
        layer.cornerRadius = 30
        // foreground
        let foregroundIndex = numberOfSegments
        if subviews.indices.contains(foregroundIndex),
           let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
          
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset,
                                                                            dy: segmentInset)
            foregroundImageView.image = segmentImage
            // substitute with our own colored image
            foregroundImageView.layer.borderColor = UIColor.green.cgColor
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")
            // this removes the weird scaling animation!
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = 25
        }
    }
}
extension UIImage {
    // creates a UIImage given a UIColor
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
