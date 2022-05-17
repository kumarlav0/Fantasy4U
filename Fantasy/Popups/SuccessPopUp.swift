//
//  SuccessPopUp.swift
//  Fantasy
//
//  Created by mac on 15/05/22.
//

import UIKit

public typealias clickCloser = (() -> Void)

class SuccessPopUp: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var successLbl: UILabel!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var greenView: UIView!

    private var didTapOnOkBtn: clickCloser?

    var viewController: UIViewController!
    var view: UIView!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    init(frame: CGRect, inController: UIViewController) {
        super.init(frame: frame)
        xibSetUp(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    }

    func xibSetUp(frame: CGRect) {
        view = loadNibView()
        view.frame = frame
        addSubview(view)
        setUpUI()
    }

    func loadNibView() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return UIView()
        }
        return view
    }

    func setUpUI() {
        popupView.round(radius: 5)
        okButton.round(radius: 5)
        greenView.round()
        let jeremyGif = UIImage.gifImageWithName("success")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = greenView.frame
        imageView.round()
        imageView.contentMode = .scaleToFill
        view.addSubview(imageView)
    }

    func didTapOnOkBtn(OkBtn didTapOnOkBtn: @escaping () -> Void ) {
        self.didTapOnOkBtn = didTapOnOkBtn
    }

    @IBAction private func didTapOnOkAction(_ sender: UIButton) {
        didTapOnOkBtn?()
    }


}


class Popup {
    static let shared = Popup()
    private init() { }
    var successPopUp: SuccessPopUp!

    func openPopUp(inController: UIViewController, onHide: @escaping clickCloser) {
        DispatchQueue.main.async {
            self.successPopUp = SuccessPopUp(frame: inController.view.frame, inController: inController)
            inController.view.addSubview(self.successPopUp)

            self.successPopUp.didTapOnOkBtn {
                self.successPopUp.removeFromSuperview()
                onHide()
            }
        }
    }
}
