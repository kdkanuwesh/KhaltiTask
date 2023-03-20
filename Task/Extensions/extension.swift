//
//  extension.swift
//  Task
//
//  Created by Anuwesh Khadka on 20/02/2023.
//

import Foundation
import UIKit

let button = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle() {
        
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        rightView = button
        
        button.tintColor = .white
        
        rightViewMode = .always
        
        button.alpha = 0.4
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        
        isSecureTextEntry.toggle()
        
        button.isSelected.toggle()
    }
}

extension UIView {


    func round(corners: UIRectCorner, radius: CGFloat) {

        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))

        let mask = CAShapeLayer()

        mask.path = path.cgPath

        self.layer.mask = mask
    }
}

extension UIButton {
    
    func enableToggle() {
        
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        button.tintColor = .black
        
        button.alpha = 0.4
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        
//        isSecureTextEntry.toggle()
        
        button.isSelected.toggle()
    }
    
}
