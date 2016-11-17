//
//  ViewController.swift
//  Exchangerate
//
//  Created by Andrei Palonski on 16.11.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  var rate_list:[String] = ["RUB","USD","BYN","EUR","GBP"]

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return rate_list.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell1", for: indexPath)
    cell.textLabel?.text = rate_list[indexPath.row]
    
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "detail" {
      if let IndexPath = self.tableView.indexPathForSelectedRow {
        let dvc = segue.destination as! TableViewController
        dvc.rate = rate_list[IndexPath.row]
      }
      
    }
  }
}

