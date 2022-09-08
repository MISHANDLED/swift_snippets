//
//  PickerView.swift
//  UICollection
//
//  Created by Devansh Mohata on 08/09/22.
//

import UIKit

class PickerView: UIViewController {

    var arr = [[Int]]()
    @IBOutlet weak var pickr: UIPickerView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickr.delegate = self
        pickr.dataSource = self
        loadData()
    }
    
    func loadData(){
        for i in 0...1{
            var temp = [Int]()
            for j in i...i+10{
                if i == 0{
                temp.append(j)
                }else{
                    temp.append(j*2)
                }
            }
            arr.append(temp)
        }
    }

}

extension PickerView : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(arr[component][row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component==0){
            lbl1.text = "\(arr[component][pickerView.selectedRow(inComponent: component)])"
        }else if(component==1){
            lbl2.text = "\(arr[component][pickerView.selectedRow(inComponent: component)])"
        }
    }
    
}
