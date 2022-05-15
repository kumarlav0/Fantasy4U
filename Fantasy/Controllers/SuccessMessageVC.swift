//
//  SuccessMessageVC.swift
//  Fantasy
//
//  Created by mac on 14/05/22.
//

import UIKit

class SuccessMessageVC: UIViewController {

    @IBOutlet weak var successMessageLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goToLoginAction(_ sender: Any) {
        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil)
    }

}
