//
//  SignViewController.swift
//  MyMovies
//
//  Created by Артём Шишкин on 31.01.2020.
//  Copyright © 2020 Артём Шишкин. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
class SignViewController: UIViewController {
    

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passworTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
 

    @IBAction func signPressed(_ sender: UIButton) {
        guard passworTextField.text == confirmTextField.text else {
            confirmTextField.backgroundColor = .red
            return
        }
        
        if let email = emailTextField.text, let password = passworTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "signToMovies", sender: self)
                }
            }
        }
    }

}
