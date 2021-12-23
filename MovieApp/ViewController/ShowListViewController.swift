//
//  ThirdViewController.swift
//  MovieApp
//
//  Created by MahyarShakouri on 8/25/1400 AP.
//

import UIKit
import RealmSwift

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    var list = [Movie]()
    var realm : Realm?
    
    @IBAction func backBtn2(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePage")
        self.navigationController?.show(vc!, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.realm = try! Realm()
        self.loadValues()
        
    }
    
    
    func loadValues() {
        self.list = Array(try! Realm().objects(Movie.self))
        self.tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
        cell.config(self.list[indexPath.row])
        
        return cell
    }
    //delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            
            try! realm?.write {
                realm?.delete(list[indexPath.row])
            }
            loadValues()
            
        } else if editingStyle == .insert {
        }
        
    }
    
}







