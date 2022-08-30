//
//  ViewController1.swift
//  TableView
//
//  Created by Devansh Mohata on 30/08/22.
//

import UIKit

class ViewController1: UIViewController, UITableViewDataSource {

    var numbers = [Int]()

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        for i in 1...1000{
            numbers.append(i)
        }
        table.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let valueCell = table.dequeueReusableCell(withIdentifier: "type1") as! CellType1
        valueCell.label1.text = "\(indexPath.row)"
        return valueCell
    }
    
    
}
