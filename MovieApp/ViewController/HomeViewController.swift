//
//  ViewController.swift
//  MovieApp
//
//  Created by MahyarShakouri on 8/25/1400 AP.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Welcome, \(UserDefaults.standard.string(forKey: "username") ?? "")"
    }
    
    
    
    @IBAction func logOutBtn(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "isLogin")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
        self.navigationController?.show(vc!, sender: nil)
    }
    
    
    
    
}

