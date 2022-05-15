//
//  LoginViewController.swift
//  Fantasy
//
//  Created by mac on 09/05/22.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTF: SkyFloatingLabelTextField!
    @IBOutlet var socialLogoImg: [UIImageView]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "MatchesVC") as? MatchesVC else { return }
        let nav = UINavigationController(rootViewController: homeVC)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }

    @IBAction func registerAction(_ sender: Any) {
        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationVC else { return }
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil)
    }

    @IBAction func forgotPasswordAction(_ sender: Any) {
        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC else { return }
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil)
    }
}
