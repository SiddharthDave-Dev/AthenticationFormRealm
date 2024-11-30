//
//  ViewController.swift
//  AthenticationFormRealm
//
//  Created by EMP on 13/10/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTap(_ sender: Any) {
        let loginvc = storyboard?.instantiateViewController(withIdentifier: "loginpage")
        
        loginvc?.modalPresentationStyle = .pageSheet
        
        if let sheet = loginvc?.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        present(loginvc ?? UIViewController() , animated: true)
    }
    
    @IBAction func signupTap(_ sender: Any) {
        let signupvc = storyboard?.instantiateViewController(withIdentifier: "signupPage")
        
//        signupvc?.modalPresentationStyle = .fullScreen
        
        present(signupvc ?? UIViewController() , animated: true)
    }
}

