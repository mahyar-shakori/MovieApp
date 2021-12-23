//
//  SecondViewController.swift
//  MovieApp
//
//  Created by MahyarShakouri on 8/26/1400 AP.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var seasonTF: UITextField!
    @IBOutlet weak var saveTap: UIButton!
    
    var realm : Realm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.saveTap.isEnabled = false
        self.saveTap.backgroundColor = UIColor.init(red: 128/255, green: 102/255, blue: 56/255, alpha: 1.0)
        self.titleTF.delegate = self
        
        realm = try! Realm()
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            
            if updatedText.count > 1 {
                self.saveTap.isEnabled = true
                self.saveTap.backgroundColor = UIColor.init(red: 255/255, green: 162/255, blue: 5/255, alpha: 1.0)
            }
            else {
                self.saveTap.isEnabled = false
                self.saveTap.backgroundColor = UIColor.init(red: 128/255, green: 102/255, blue: 56/255, alpha: 1.0)
                
            }
            
        }
        
        return true
    }
    
    
    @IBAction func backBtn1(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let movie = Movie()
        
        movie.title = titleTF.text ?? ""
        movie.year = Int(yearTF.text ?? "") ?? 0
        movie.numOfSeasons = Int(seasonTF.text ?? "") ?? 0
        
        try! realm?.write {
            realm?.add(movie)
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "showList")
        self.navigationController?.show(vc!, sender: nil)
        
    }
    
    
    
}
