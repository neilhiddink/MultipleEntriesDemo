//
//  ViewController.swift
//  Test
//
//  Created by Neil Hiddink on 8/19/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataArray = [String]()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = UserDefaults.standard.value(forKey: "DataArray") as? [String] {
            dataArray = data
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if textField.text != "" && textField.text != nil {
            let entry = textField.text!
            if !dataArray.contains(entry) {
                dataArray.append(entry)
                textField.text = ""
                UserDefaults.standard.set(dataArray, forKey: "DataArray")
            }
            tableView.reloadData()
        }
    }

}
