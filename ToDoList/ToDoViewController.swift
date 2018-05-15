//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Sadie Flick on 5/13/18.
//  Copyright © 2018 Sadie Flick. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewController: UIViewController {
    
    var delegate: AddItemButtonDelegate?
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var detailLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addItemButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        print("In view controller")
        
        let title = titleLabel.text
        let desc = detailLabel.text
        let date = datePicker
        delegate?.addItemButtonPressed(by: self, with: title, and: desc, on: date)
        
    }
    
}

