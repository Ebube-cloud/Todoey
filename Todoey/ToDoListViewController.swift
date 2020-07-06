//
//  ViewController.swift
//  Todoey
//
//  Created by Ebube The Coder on 05/07/2020.
//  Copyright © 2020 Ebube The Coder. All rights reserved.
//

import UIKit

class ToDoListViewController : UITableViewController {
    
    let itemArray = ["Buy yam ", "Buy buscuits" ,"Buy cake"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Mark - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
        
        
        
    }
    
    //Mark - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(itemArray[indexPath.row])
        
        

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none

        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

            
            
            
        }

        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    }
    
    

    



