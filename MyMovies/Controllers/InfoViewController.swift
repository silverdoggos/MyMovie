//
//  InfoViewController.swift
//  MyMovies
//
//  Created by Артём Шишкин on 30.01.2020.
//  Copyright © 2020 Артём Шишкин. All rights reserved.
//

import UIKit
import FirebaseAuth

class InfoViewController: UIViewController {
    
    var imageST: String?
    var catST: String?
    var textST: String?
    
    @IBOutlet weak var imageMov: UIImageView!
    @IBOutlet weak var catelabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imagePath = imageST, let category = catST, let text = textST {
            imageMov.image = UIImage(named: imagePath)
            catelabel.text = category
            starLabel.text = text
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func logOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
