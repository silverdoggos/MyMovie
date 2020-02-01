//
//  MoviesTableViewController.swift
//  MyMovies
//
//  Created by Артём Шишкин on 30.01.2020.
//  Copyright © 2020 Артём Шишкин. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

class MoviesTableViewController: UITableViewController {
    
    let realm = try! Realm()
    
    let sections = ["Drama", "Crime", "Comedy"]
    var movies: Results<Movie>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDefaultMovies()

        tableView.separatorStyle = .singleLine
        
        
        
        navigationItem.hidesBackButton = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies?.filter("category CONTAINS [cd] %@", sections[section]).count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieViewCell
        
        if let movie = movies?.filter("category CONTAINS [cd] %@", sections[indexPath.section])[indexPath.row] {
            
            cell.tit?.text = movie.name
            cell.txt?.text = movie.category
            cell.im?.image = UIImage(named: movie.image)
            
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! InfoViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            
            let mov = movies?.filter("category CONTAINS [cd] %@", sections[indexPath.section])[indexPath.row]
            destinationVC.movie = mov
        }
        
        
    }
    

    
    func loadDefaultMovies() {
        
        movies = realm.objects(Movie.self)
        
        if movies?.count == 0 {
            try! realm.write() {

                let movie1 = Movie()
                movie1.category = "Drama Comedy"
                movie1.director = "Quentin Tarantino"
                movie1.stars = "Leonardo DiCaprio, Brad Pitt, Margot Robbie"
                movie1.name = "Once Upon a Time... in Hollywood"
                movie1.image = "OUTIG"
                
                let movie2 = Movie()
                movie2.category = "Drama Comedy Crime"
                movie2.director = "Bong Joon Ho"
                movie2.stars = "Kang-ho Song, Sun-kyun Lee, Yeo-jeong Jo"
                movie2.name = "Parasite"
                movie2.image = "P"
                
                let movie3 = Movie()
                movie3.category = "Comedy"
                movie3.director = "Taika Waititi"
                movie3.stars = "Roman Griffin, Davis Thomasin McKenzie, Scarlett Johansson"
                movie3.name = "Jojo Rabbit"
                movie3.image = "JoJo"
                
                let movie4 = Movie()
                movie4.category = "Drama"
                movie4.director = "Noah Baumbach"
                movie4.stars = "Adam Driver, Scarlett Johansson, Julia Greer"
                movie4.name = "Marriage Story"
                movie4.image = "MS"
                
                let movie5 = Movie()
                movie5.category = "Drama Crime"
                movie5.director = "Martin Scorsese"
                movie5.stars = "Robert De Niro, Al Pacino, Joe Pesci"
                movie5.name = "The Irishman"
                movie5.image = "I"
                
                let movie6 = Movie()
                movie6.category = "Drama Crime"
                movie6.director = "Todd Phillips"
                movie6.stars = "Joaquin Phoenix, Robert De Niro, Zazie Beetz"
                movie6.name = "Joker"
                movie6.image = "J"
                
                let movie7 = Movie()
                movie7.category = "Drama"
                movie7.director = "James Mangold"
                movie7.stars = "Christian Bale, Matt Damon, Jon Bernthal"
                movie7.name = "Le Mans '66"
                movie7.image = "L"
                
                let movie8 = Movie()
                movie8.category = "Drama"
                movie8.director = "Karim Aïnouz"
                movie8.stars = "Julia Stockler, Carol Duarte, Flávia Gusmão"
                movie8.name = "Invisible Life"
                movie8.image = "IL"
                
                self.realm.add(movie1)
                self.realm.add(movie2)
                self.realm.add(movie3)
                self.realm.add(movie4)
                self.realm.add(movie5)
                self.realm.add(movie6)
                self.realm.add(movie7)
                self.realm.add(movie8)
            }
        }
        tableView.reloadData()
        
    }
    
    
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
          try Auth.auth().signOut()
          navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
}
