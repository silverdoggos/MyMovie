//
//  LogViewController.swift
//  MyMovies
//
//  Created by Артём Шишкин on 30.01.2020.
//  Copyright © 2020 Артём Шишкин. All rights reserved.
//

import UIKit
import Firebase

class LogViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    // log in user
    @IBAction func buttonPressed(_ sender: Any) {
        if let email = emailtextField.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "loginToMovies", sender: self)
                }
            }
        }
    }
    
}
