//
//  ViewController2.swift
//  TableView
//
//  Created by Devansh Mohata on 30/08/22.
//

import UIKit

class ViewController2: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let valueCell = table.dequeueReusableCell(withIdentifier: "type1") as! CellType1
            valueCell.label1.text = "\(indexPath.row)"
            return valueCell
        }else{
            let valueCell = table.dequeueReusableCell(withIdentifier:"type2") as! CellType2
            valueCell.btn1.setTitle("\(indexPath.row)", for: UIControl.State.normal)
            return valueCell
        }
    }
    
}
