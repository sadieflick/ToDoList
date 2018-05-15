//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Sadie Flick on 5/13/18.
//  Copyright © 2018 Sadie Flick. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController, AddItemButtonDelegate  {
    
    var titlesArray: [TitleEntry] = []
    var descArray: [DescEntry] = []
    var dateArray: [DateEntry] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request1:NSFetchRequest<TitleEntry> = TitleEntry.fetchRequest()
        do {
            titlesArray = try context.fetch(request1)
            // Here we can store the fetched data in an array
        } catch {
            print(error)
        }
        
        let request2:NSFetchRequest<DescEntry> = DescEntry.fetchRequest()
        do {
            descArray = try context.fetch(request2)
            // Here we can store the fetched data in an array
        } catch {
            print(error)
        }
        
        let request3:NSFetchRequest<DateEntry> = DateEntry.fetchRequest()
        do {
            dateArray = try context.fetch(request3)
            // Here we can store the fetched data in an array
        } catch {
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("Entering numrows func")
        print("Titles Array: ", titlesArray)

        return titlesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as! ToDoTableViewCell
        print("Title array at tableview cell init: ", titlesArray)
        
        if titlesArray[indexPath.row].checked == true {
            cell.accessoryType = .checkmark
        }
        
        cell.titleLabel?.text = titlesArray[indexPath.row].text
        cell.descLabel?.text = descArray[indexPath.row].text
        cell.dateLabel?.text = dateArray[indexPath.row].date
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        let toDoViewController = segue.destination as? ToDoViewController
    
        toDoViewController?.delegate = self
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                titlesArray[indexPath.row].checked = true
                saveContext()
            }
            
            else if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                titlesArray[indexPath.row].checked = false
                saveContext()
            }
        }
    }
    
    func addItemButtonPressed(by: UIViewController, with title: String?, and desc: String?, on date: UIDatePicker?) {

        
        let titleObj = NSEntityDescription.insertNewObject(forEntityName: "TitleEntry", into: context) as! TitleEntry
        titleObj.text = title
        titlesArray.append(titleObj)
        
        let descObj = NSEntityDescription.insertNewObject(forEntityName: "DescEntry", into: context) as! DescEntry
        descObj.text = desc
        descArray.append(descObj)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let dateText = dateFormatter.string(from: (date?.date)!)
        self.view.endEditing(true)
        
        
        let dateObj = NSEntityDescription.insertNewObject(forEntityName: "DateEntry", into: context) as! DateEntry
        dateObj.date = dateText
        dateArray.append(dateObj)
        
        saveContext()
        
        tableView.reloadData()

        
        dismiss(animated: true, completion: nil)
    }

}
