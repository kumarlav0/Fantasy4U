//
//  TableViewExtension.swift
//  ChatBubbleUI
//
//  Created by Kumar Lav on 25/08/21.
//

import UIKit

public extension UICollectionView {
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let bundle = Bundle(for: cellClass)
        let nib = UINib(nibName: identifier, bundle: bundle)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
}

public extension UITableView {
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let bundle = Bundle(for: cellClass)
        let nib = UINib(nibName: identifier, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: identifier)
    }

    func registerHeaderFooterViewNib(_ viewClass: AnyClass) {
        let identifier = String.className(viewClass)
        let bundle = Bundle(for: viewClass)
        let nib = UINib(nibName: identifier, bundle: bundle)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }

    func scrollToBottom(animated: Bool = true) {
        let sections = self.numberOfSections
        let rows = self.numberOfRows(inSection: sections - 1)
        if (rows > 0){
            self.scrollToRow(at: IndexPath(row: rows - 1, section: sections - 1), at: .bottom, animated: animated)
        }
    }

    func setNoDataFoundMessage(message: String) {
//        let noDataFoundView = NoDataFoundView()
//        noDataFoundView.messageLabel.text = message
//        self.backgroundView = noDataFoundView
//        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
    }

}

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}


extension UIView {
    func round(radius: CGFloat? = nil) {
        layer.cornerRadius = radius ??  layer.frame.height / 2
        clipsToBounds = true
    }

    func border(borderWidth: CGFloat, borderColor: UIColor = .white) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}

extension UIView {
    func spin(tintColor: UIColor) {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = 2 * Double.pi
        rotation.duration = 1.1
        rotation.repeatCount = Float.infinity
        layer.add(rotation, forKey: "Spin")
        self.tintColor = tintColor
    }
}
