//
//  Colors.swift
//  Task
//
//  Created by Anuwesh Khadka on 14/03/2023.
//

import Foundation
import UIKit
enum Colors {

    case primary

    case textFieldBG

    case gray
    

    func getColors() -> UIColor {

        switch self {

        case .primary:

            return UIColor(named: "Buton-Color")!

        case .textFieldBG:

            return UIColor(named: "Textfield-Fill-Color")!

        case.gray:
            return UIColor(named: "Buton-Color-Text")!
            
       
        }

    }

}

