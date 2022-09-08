//
//  PodViewController.swift
//  UICollection
//
//  Created by Devansh Mohata on 08/09/22.
//

import UIKit
import PanModal
import Kingfisher

class PodViewController: UIViewController, PanModalPresentable {
    
    @IBOutlet weak var uiEmail: UILabel!
    @IBOutlet weak var uiPost: UILabel!
    @IBOutlet weak var uiName: UILabel!
    @IBOutlet weak var uiImage: UIImageView!
    
    var data : ApiModel.data?
    
    
    
    
    
    var panScrollable: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let email = data?.email,
           let id = data?.id,
           let first = data?.first_name,
           let lasst = data?.last_name{
            uiEmail.text = email
            uiPost.text = "\(id)"
            uiName.text = "\(first) \(lasst)"
        }
        
        if let img = data?.avatar{
            uiImage.kf.setImage(with: URL(string: img))
        }

    }
}


