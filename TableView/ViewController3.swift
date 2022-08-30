//
//  ViewController3.swift
//  TableView
//
//  Created by Devansh Mohata on 30/08/22.
//

import UIKit

class ViewController3: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var arr = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.register(UINib(nibName: "UI1", bundle: nil), forCellReuseIdentifier: "UI1")
        
        for i in 0...1000{
            arr.append(i)
        }
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let valueCell = table.dequeueReusableCell(withIdentifier: "UI1") as? UI1{
            if(indexPath.row % 2 == 0){
                valueCell.uiImage.transform = CGAffineTransform(scaleX: -1, y: 1);
            }
            valueCell.lbl.text = String(arr[indexPath.row])
            return valueCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
