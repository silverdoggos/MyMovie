//
//  ViewController.swift
//  MyMovies
//
//  Created by Артём Шишкин on 30.01.2020.
//  Copyright © 2020 Артём Шишкин. All rights reserved.
//

import UIKit
import  GoogleSignIn
import FirebaseAuth

class StartViewController: UIViewController, GIDSignInDelegate {

    let user = Auth.auth().currentUser
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
        
        if user?.uid != nil {
            performSegue(withIdentifier: "startToMovies", sender: self)
        }
        
    }
    
    @IBAction func pressedLog(_ sender: Any) {
    }
    @IBAction func pressedSign(_ sender: Any) {
    }
    
    //MARK: - Autentifiction with Google
    

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let auth = user.authentication else { return }
        
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login Successful.")
                self.performSegue(withIdentifier: "startToMovies", sender: self)
            }
        }
    }
    
    @IBAction func googleSingInPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
    }

}

