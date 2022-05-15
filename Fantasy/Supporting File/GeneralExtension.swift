//
//  GeneralExtension.swift
//  Fantasy
//
//  Created by mac on 15/05/22.
//

import UIKit

extension UIView {

    func setShadow() {
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.67
        layer.shadowOffset = CGSize(width: 1, height: 3)
        layer.shadowRadius = CGFloat(5)
    }
}
