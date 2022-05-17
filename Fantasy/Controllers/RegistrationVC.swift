//
//  RegistrationVC.swift
//  Fantasy
//
//  Created by mac on 14/05/22.
//

import UIKit
import  SkyFloatingLabelTextField

class RegistrationVC: UIViewController {

    @IBOutlet weak var fullNameTF: SkyFloatingLabelTextField!
    @IBOutlet weak var contactTF: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTF: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPasswordTF: SkyFloatingLabelTextField!
    @IBOutlet var socialLogoImg: [UIImageView]!

    var successPopUp: SuccessPopUp!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func registrationAction(_ sender: Any) {
        Popup.shared.openPopUp(inController: self) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
