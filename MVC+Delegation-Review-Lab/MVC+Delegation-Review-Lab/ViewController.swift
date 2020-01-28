//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
   private var movieInfo = [Movie]()
    
   
    
        
        var currentFontSize: CGFloat? = 17 {
            didSet {
                tableView.reloadData()
            }
        }
    
    //----------------------------------------------------------------------


        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            loadData()
        }
    
    
    //----------------------------------------------------------------------
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let settingController = segue.destination as? SettingsViewController else {
                fatalError("segue not working")
            }
            settingController.delegate = self
            settingController.fontSize = currentFontSize!
        }
    
    
        
        func loadData() {
            movieInfo = Movie.allMovies
        }
    }

//----------------------------------------------------------------
// MARK: EXTENSION

    extension ViewController: UITableViewDelegate, UITableViewDataSource, TableViewDelegate {
        func fontdidChange(changeVC: SettingsViewController, fontSize: CGFloat) {
            self.currentFontSize = changeVC.fontSize
            
        }

        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movieInfo.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
            let movieCell = movieInfo[indexPath.row]
            
            cell.textLabel?.text = movieCell.name
            cell.textLabel?.font = cell.textLabel!.font.withSize(currentFontSize!)
            cell.detailTextLabel?.font = cell.detailTextLabel?.font.withSize(currentFontSize!)
            return cell
        }
    }


