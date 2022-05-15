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


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginAction(_ sender: Any) {
        dismiss(animated: true) {
            print("Controller Dismissing... Please Save your data")
        }
    }
    
    @IBAction func registrationAction(_ sender: Any) {
        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "SuccessMessageVC") as? SuccessMessageVC else { return }
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil)
    }
    
}
