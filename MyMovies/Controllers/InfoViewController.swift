//
//  InfoViewController.swift
//  MyMovies
//
//  Created by Артём Шишкин on 30.01.2020.
//  Copyright © 2020 Артём Шишкин. All rights reserved.
//

import UIKit
import FirebaseAuth
import RealmSwift

class InfoViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var imageMov: UIImageView!
    @IBOutlet weak var catelabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imagePath = movie?.image, let category = movie?.category, let text = movie?.stars {
            imageMov.image = UIImage(named: imagePath)
            catelabel.text = category
            starLabel.text = text
        }
    }

    //log out
    @IBAction func logOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

