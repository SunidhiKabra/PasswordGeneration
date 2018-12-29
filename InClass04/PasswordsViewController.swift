//
//  PasswordsViewController.swift
//  InClass04
//
//  Created by Kabra, Sunidhi on 11/2/18.
//  Copyright © 2018 Kabra, Sunidhi. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var typeSelected: Int?
    var noOfPasswordsSelected: Int?
    var array1 = [String]()
    var selected: String = ""
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noOfPasswordsSelected!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForPasswords", for: indexPath)
        
        let label0 = cell.viewWithTag(10) as! UILabel
        label0.text = array1[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = array1[indexPath.row]
        performSegue(withIdentifier: "unwindSegueTo1", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSegueTo1"{
            let vc = segue.destination as! ViewController
            vc.selectedPassword.text = selected
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
