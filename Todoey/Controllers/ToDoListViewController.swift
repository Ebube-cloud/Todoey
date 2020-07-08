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
    
 let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       
        
        print(dataFilePath)
        
        
        
        loadIteams()
 
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
            
              self.saveItems()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
 
        }
        
        
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    // Mark - Model menupulation methods
    
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        
        
        do {
            
            
            let data = try encoder.encode(itemArray)
            try data.write(to : dataFilePath!)
        } catch {
            
            print("error encoding item array, \(error)")
            
        }
        self.tableView.reloadData()
        
    }
    
    func loadIteams() {
        
        

        if  let data = try? Data(contentsOf: dataFilePath!)  {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)

            }catch{
                
                print("error decoding item array, \(error)")
                
            }
            
        }
        
        
    }
    
    
}
    
    

    



