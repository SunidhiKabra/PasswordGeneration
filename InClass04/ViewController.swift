//
//  ViewController.swift
//  InClass04
//
//  Created by Kabra, Sunidhi on 11/2/18.
//  Copyright © 2018 Kabra, Sunidhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data = AppsData();
    
    @IBOutlet weak var noOfPasswords: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var selectedPassword: UILabel!
    
    
    var types = ["Weak (Length 5)", "Medium (Length 8)", "Strong (Length 15)", "Extra Strong (Length 25)"]
    var typeSelected = 0
    var noOfPasswordsSelected: Int?
    var array1 = [String]()
    var selected: String = ""
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
        let label0 = cell.viewWithTag(1) as! UILabel
        
        label0.text = types[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(types[indexPath.row]){
            case "Weak (Length 5)":
                typeSelected = 5
            case "Medium (Length 8)":
                typeSelected = 8
            case "Strong (Length 15)":
                typeSelected = 15
            case "Extra Strong (Length 25)":
            	typeSelected = 25
            default:
                typeSelected = 0
        }
        
    }
    
    @IBAction func buttonOnClick(_ sender: Any) {
        
        noOfPasswordsSelected = Int(noOfPasswords.text!)
        if((noOfPasswordsSelected != nil) && ((typeSelected != 0))){
            DispatchQueue.global(qos: .background).async{
                for i in 1...self.noOfPasswordsSelected! {
                    let pass = AppsData.getPassword(len: self.typeSelected)
                    self.array1.append(pass)
                }
                
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "passwordSegue", sender: self)
                }
            }
        }
        else{
            showToast(controller: self, message: "Input needed", seconds: 2.0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "passwordSegue"){
            let vc = segue.destination as! PasswordsViewController
            vc.noOfPasswordsSelected = noOfPasswordsSelected
            vc.typeSelected = typeSelected
            vc.array1 = array1
        }
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
   @IBAction func unwindToFirstVC(segue:UIStoryboardSegue) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

