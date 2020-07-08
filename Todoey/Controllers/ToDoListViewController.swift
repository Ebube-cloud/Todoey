//
//  ViewController.swift
//  Todoey
//
//  Created by Ebube The Coder on 05/07/2020.
//  Copyright © 2020 Ebube The Coder. All rights reserved.
//

import UIKit

class ToDoListViewController : UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let newItem = Item()
        newItem.title = "Buscuits"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buscuits2"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Buscuits3"
        itemArray.append(newItem3)
        
        
        if let item = defaults.array(forKey: "TodoListArray") as? [Item] {

            itemArray = item


        }

//
//
    }
    //Mark - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        cell.accessoryType = item.done ? .checkmark : .none
    
        return cell
    }
    
    //Mark - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        

        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

  // Mark - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()

      let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
          // what would happen when the user clicksthe Add button on our UIAlert
            
            let newItem = Item()
            
            newItem.title.append(textField.text!)
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
 
        }
        
        
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
}
    
    

    



