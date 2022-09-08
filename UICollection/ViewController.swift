//
//  ViewController.swift
//  UICollection
//
//  Created by Devansh Mohata on 08/09/22.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    //    var userData = [UserModel]()
    
    var apiData : ApiModel?
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //        loadData()
        api_call()
        
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        
    }
    
    //    func loadData(){
    //        userData.append(UserModel(userName: "Devansh Mohata", userPost: "iOS Developer"))
    //        userData.append(UserModel(userName: "Rajat", userPost: "iOS Developer"))
    //        userData.append(UserModel(userName: "Ajay", userPost: "Android Developer"))
    //        userData.append(UserModel(userName: "Anshul", userPost: "Android Developer"))
    //        userData.append(UserModel(userName: "Tushar", userPost: "SDET"))
    //    }
    
    func api_call(){
        
        let request = AF.request("https://reqres.in/api/users?page=1")
        
        request.responseData{ data in
            let dataAPI = data.data
            
            do{
                let value = try JSONDecoder().decode(ApiModel.self, from: dataAPI!)
                self.apiData = value
                
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
        
    }
    
}


extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiData?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let valueCell = table.dequeueReusableCell(withIdentifier: "MyCell") as? MyCell{
            
            if let value = apiData?.data{
                if let firstName = value[indexPath.row].first_name,
                   let lastName = value[indexPath.row].last_name,
                   let id = value[indexPath.row].id,
                   let url = value[indexPath.row].avatar{
                    valueCell.myLabel.text = "\(firstName) \(lastName)"
                    valueCell.levelLabe.text = "\(id)"
                    valueCell.uiImage.kf.setImage(with: URL(string: url))
                }
            }
            
            return valueCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "storyPerson") as?
            PodViewController{
            
            vc.data = apiData?.data?[indexPath.row]
            presentPanModal(vc)
        }
    }
    
}

