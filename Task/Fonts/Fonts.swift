//
//  Fonts.swift
//  Task
//
//  Created by Anuwesh Khadka on 14/03/2023.
//

import Foundation
import UIKit

enum KhaltiFonts {
    
    case bold
    
    case medium
    
    case semibold
    
    case regular
    
    func getFont(withSize size: CGFloat) -> UIFont {
        
        switch self {
            
        case .bold:
            return UIFont(name: "Montserrat-Bold", size: size)!
            
        case .medium:
            return UIFont(name: "Montserrat-Medium", size: size)!
            
        case .semibold:
            return UIFont(name: "Montserrat-SemiBold", size: size)!

        case .regular:
            return UIFont(name: "Montserrat-Regular", size: size)!

        }
        
    }
    
}
