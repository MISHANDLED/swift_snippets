//
//  ColorPicker.swift
//  UICollection
//
//  Created by Devansh Mohata on 08/09/22.
//

import UIKit

class ColorPicker: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .blue
        button.setTitle("Select Color", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc  func tapAction(){
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.modalPresentationStyle = .fullScreen
        present(colorPicker, animated: true)
    }
}

extension ColorPicker : UIColorPickerViewControllerDelegate{
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        view.backgroundColor = viewController.selectedColor
    }
    
}
