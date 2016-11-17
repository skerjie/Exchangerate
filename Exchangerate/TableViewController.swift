//
//  TableViewController.swift
//  Exchangerate
//
//  Created by Andrei Palonski on 16.11.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
  
  var rate_name_list : [String] = []
  var rate_list_value: [String] = []
  var rate: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = rate
    let url = "https://api.fixer.io/latest?base=\(rate)"
    
    Alamofire.request(url).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        //print("JSON: \(json)")
        for (value, key) in json["rates"] {
          self.rate_name_list.append(value)
          self.rate_list_value.append(String(describing: key))
        }
        self.tableView.reloadData()
      case .failure(let error):
        print(error)
      }
    }
  }

  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return rate_name_list.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell2", for: indexPath)
    cell.textLabel?.text = rate_name_list[indexPath.row]
    cell.detailTextLabel?.text = rate_list_value[indexPath.row]
    // Configure the cell...
    
    return cell
  }
}
