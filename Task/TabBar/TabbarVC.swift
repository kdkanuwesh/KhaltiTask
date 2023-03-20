//
//  TabbarVC.swift
//  Task
//
//  Created by Anuwesh Khadka on 20/02/2023.
//

import Foundation
import UIKit

class TabbarVC: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Constants and Variables
    var isHomeSelected = true

    lazy var btnCenter: UIButton = {

        let btnCenter = UIButton()

        btnCenter.translatesAutoresizingMaskIntoConstraints = false

        btnCenter.tintColor = .white

        btnCenter.isHidden = false

        btnCenter.backgroundColor = UIColor(named: "themeColor")

        btnCenter.setImage(UIImage(systemName: "qrcode.viewfinder"), for: .normal)
        
        btnCenter.imageView?.transform3D = CATransform3DMakeScale(1.5, 1.5, 1.5)

        return btnCenter
    }()


    // MARK: - Initialization

    // MARK: - View Did Load
    override func viewDidLoad() {

        super.viewDidLoad()

        tabBar.tintColor = UIColor(named: "themeColor")

        self.delegate = self
        
        setupLayout()

        generateTabBar()

        setTabBarAppearence()

    }

    // MARK: - View Will Appear
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true

    }

    override func viewWillLayoutSubviews() {

        DispatchQueue.main.async {
            self.btnCenter.layer.cornerRadius = self.btnCenter.bounds.height / 2
        }
    }

    // MARK: - Additional Functions

    private func generateTabBar() {

        viewControllers = [

            generateVC(viewController: HomeVC(), title: "Home", image: UIImage(systemName: "house.fill")),

            generateVC(viewController: SupportVC(), title: "Support", image: UIImage(systemName: "phone.and.waveform")),

            generateVC(viewController: ScanPayVC(), title: "Scan & Pay", image: UIImage(systemName: "qrcode.viewfinder")),

            generateVC(viewController: TransactionsVC(), title: "Transactions", image: UIImage(systemName: "newspaper")),

            generateVC(viewController: MenuVC(), title: "Menu", image: UIImage(systemName: "circle.grid.3x3")),



        ]
    }

    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) ->

    UIViewController {

        viewController.tabBarItem.title = title

        viewController.tabBarItem.image = image
        
        return viewController
    }

    private func setTabBarAppearence() {

        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .white
        
        tabBar.layer.shadowColor = UIColor(named: "label")?.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowOpacity = 0.15
    }
    
  
    // UITabBarControllerDelegate
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if let homeVC = viewController as? HomeVC {
            
            // Animate the btnCenter appearing
            UIView.animate(withDuration: 0.3) {
                
                self.btnCenter.alpha = 1.0
                
                self.btnCenter.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
            
        } else {
            
            // Animate the btnCenter disappearing
            UIView.animate(withDuration: 0.3) {
                
                self.btnCenter.alpha = 0.0
                
                self.btnCenter.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            }
            
        }
    }



    }


// MARK: - Autolayout for UICOmponents
extension TabbarVC {

    // MARK: - Setting Up Autolayout for UI Components
    func setupLayout() {

        autoLayoutForBtnCenter()

    }

    // MARK: - Autolayout

    func autoLayoutForBtnCenter() {

        view.addSubview(btnCenter)

        NSLayoutConstraint.activate([

            btnCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            btnCenter.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),

            btnCenter.widthAnchor.constraint(equalToConstant: 60),

            btnCenter.heightAnchor.constraint(equalToConstant: 60)

        ])
    }

}

// MARK: - Actions for UIComponents
