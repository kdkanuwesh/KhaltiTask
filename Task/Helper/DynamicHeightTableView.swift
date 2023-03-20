//
//  DynamicHeightTableView.swift
//  Task
//
//  Created by Anuwesh Khadka on 23/02/2023.
//

import Foundation
import Foundation
import UIKit

class DynamicHeightTableView: UITableView {

   override var contentSize: CGSize {

       didSet {

           invalidateIntrinsicContentSize()

       }

   }

   override var intrinsicContentSize: CGSize {

       layoutIfNeeded()

       return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)

   }

}
