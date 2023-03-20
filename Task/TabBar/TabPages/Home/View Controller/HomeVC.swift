//
//  firstVC.swift
//  Task
//
//  Created by Anuwesh Khadka on 20/02/2023.
//

import Foundation
import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
   
    // MARK: - Constants and Variables
    
    var balance = 32402.00
    
    var collectionViewHeightConstraint: NSLayoutConstraint!
    
    var khaltiModel: [KhaltiModel] = [
    
       KhaltiModel(icon: UIImage(named: "topup") ?? UIImage(), title: "Topup", cashback: true),
       
       KhaltiModel(icon: UIImage(named: "datapack") ?? UIImage(), title: "Data/Voice Pack"),
       
       KhaltiModel(icon: UIImage(named: "internet") ?? UIImage(), title: "Internet", cashback: true),
       
       KhaltiModel(icon: UIImage(named: "tv") ?? UIImage(), title: "TV", cashback: true),
       
       KhaltiModel(icon: UIImage(named: "movies") ?? UIImage(), title: "Movies"),
       
       KhaltiModel(icon: UIImage(named: "flight") ?? UIImage(), title: "Flight", cashback: true),
       
       KhaltiModel(icon: UIImage(named: "electricity") ?? UIImage(), title: "Electricity"),
       
       KhaltiModel(icon: UIImage(named: "voting") ?? UIImage(), title: "Insurance"),
       
       KhaltiModel(icon: UIImage(named: "recharge-card") ?? UIImage(), title: "Events"),
       
       KhaltiModel(icon: UIImage(named: "government-services") ?? UIImage(), title: "Government"),
       
       KhaltiModel(icon: UIImage(named: "insurance") ?? UIImage(), title: "Insurance"),
       
       KhaltiModel(icon: UIImage(named: "landline") ?? UIImage(), title: "Landline"),
       
       KhaltiModel(icon: UIImage(named: "khanepani") ?? UIImage(), title: "Khanepani"),
       
       KhaltiModel(icon: UIImage(named: "bus") ?? UIImage(), title: "Bus Ticket"),
       
       KhaltiModel(icon: UIImage(named: "cable-car") ?? UIImage(), title: "Cable Car"),
       
       KhaltiModel(icon: UIImage(named: "smart-school") ?? UIImage(), title: "School/College Fee"),
       
       KhaltiModel(icon: UIImage(named: "emi") ?? UIImage(), title: "EMI"),
       
       KhaltiModel(icon: UIImage(named: "antivirus") ?? UIImage(), title: "Antivirus"),
       
       KhaltiModel(icon: UIImage(named: "uptrend") ?? UIImage(), title: "Financial Services"),
       
       KhaltiModel(icon: UIImage(named: "recharge-card") ?? UIImage(), title: "RC Card"),
       
       KhaltiModel(icon: UIImage(named: "ride") ?? UIImage(), title: "Ride"),
       
       KhaltiModel(icon: UIImage(named: "community-electricity") ?? UIImage(), title: "Community Electricity"),
       
       KhaltiModel(icon: UIImage(named: "waste") ?? UIImage(), title: "Waste"),
     
    ]
    
    let homeItems = HomeItems
    
    // MARK: - Initialization
    lazy var mainView: UIView = {

        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = UIColor(named: "gray")

        return view
        
    }()
    
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.isScrollEnabled = true
        
        scrollView.bounces = true

        scrollView.backgroundColor = .clear

        return scrollView
        
    }()
    
    lazy var themeView: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor(named: "themeColor")
        
        return view
        
    }()
    
    lazy var btnProfile: UIButton = {
       
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(named: "imgProfile"), for: .normal)
        
        button.imageView?.contentMode = .scaleAspectFill
        
        button.clipsToBounds = true
        
        return button
        
    }()
    
    lazy var btnName: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Anuwesh", for: .normal)
        
        button.titleLabel?.font = KhaltiFonts.bold.getFont(withSize: 18)
        
        return button
        
    }()
    
    lazy var btnSearch: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "magnifyingglass")?.withConfiguration(UIImage.SymbolConfiguration(weight: .semibold)), for: .normal)
        
        button.tintColor = .white
        
        return button
        
    }()
    
    lazy var btnGift: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "gift.fill")?.withConfiguration(UIImage.SymbolConfiguration(weight: .semibold)), for: .normal)
        
        button.tintColor = .systemPink
        
        return button
        
    }()
    
    lazy var btnNotification: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "bell")?.withConfiguration(UIImage.SymbolConfiguration(weight: .semibold)), for: .normal)
        
        button.tintColor = .white
        
        return button
        
    }()
    
    lazy var stackProfileName: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 8

        stackView.distribution = .fill

        stackView.alignment = .fill

        stackView.axis = .horizontal

        stackView.addArrangedSubview(btnProfile)

        stackView.addArrangedSubview(btnName)
        
        return stackView
        
    }()
    
    lazy var stackIcons: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 4

        stackView.distribution = .fill

        stackView.alignment = .fill

        stackView.axis = .horizontal

        stackView.addArrangedSubview(btnSearch)

        stackView.addArrangedSubview(btnGift)
        
        stackView.addArrangedSubview(btnNotification)
        
        return stackView
        
    }()
    
    lazy var viewBalance: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        
        return view
        
    }()
    
    lazy var lblRs: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "रु"
        
        label.textColor = UIColor(named: "themeColor")
        
        label.font = KhaltiFonts.regular.getFont(withSize: 22)
        
        return label
        
    }()
    
    lazy var lblAmount: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "XXX.X"
        
        label.font = KhaltiFonts.semibold.getFont(withSize: 20)
        
        label.textColor = UIColor(named: "themeColor")
        
        return label
        
    }()
    
    lazy var stackRs: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 8

        stackView.distribution = .fill

        stackView.alignment = .fill

        stackView.axis = .horizontal

        stackView.addArrangedSubview(lblRs)

        stackView.addArrangedSubview(lblAmount)
        
        return stackView
        
    }()
    
    lazy var btnToggleBalance: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        
        button.tintColor = UIColor(named: "themeColor-Light")
        
        return button
        
    }()
    
    lazy var btnRetry: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .white
        
        button.setImage(UIImage(named: "imgRetry"), for: .normal)
        
        button.imageView?.transform3D = CATransform3DMakeScale(0.8, 0.8, 0.8)
        
        button.imageView?.contentMode = .scaleAspectFit
        
        button.layer.shadowColor = UIColor(named: "label")?.cgColor
        
        button.layer.shadowOpacity = 0.3
        
        button.layer.shadowOffset = .zero
                
        return button
        
    }()
    
    lazy var lblKhaltiBalance: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Khalti Balance"
        
        label.font = KhaltiFonts.regular.getFont(withSize: 10)
        
        label.textColor = UIColor(named: "themeColor-Light")
        
        return label
    }()
    
    lazy var stackBalance: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 4

        stackView.distribution = .fill

        stackView.alignment = .center

        stackView.axis = .horizontal

        stackView.addArrangedSubview(btnToggleBalance)

        stackView.addArrangedSubview(lblKhaltiBalance)
        
        return stackView
        
    }()
    
    lazy var btnAddMoney: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(named: "btnAddMoney"), for: .normal)

        button.imageView?.contentMode = .scaleAspectFit

        return button
        
    }()
    
    lazy var btnSendMoney: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(named: "btnSendMoney"), for: .normal)
        
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
        
    }()
    
    // MARK: - Add Send Money Stack View Created
    lazy var stackAddSendMoney: UIStackView = {
        
        var stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        
        stackView.alignment = .fill
        
        stackView.distribution = .fill
        
        stackView.spacing = 20
                
        stackView.addArrangedSubview(btnAddMoney)
        
        stackView.addArrangedSubview(btnSendMoney)
        
        return stackView
        
    }()
    
    lazy var viewAd: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor(named: "secondaryLight")
                
        view.layer.borderWidth = 1
        
        view.layer.borderColor = UIColor(named: "secondary")?.cgColor
        
        view.layer.cornerRadius = 8

        return view
    
    }()
    
    // MARK: - Win Label Created
    lazy var lblWin: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = KhaltiFonts.semibold.getFont(withSize: 11)
        
        label.textColor = UIColor(named: "label")

        label.text = "Win OnePlus 11 on Flight Tickets"
        
        return label
        
    }()
    
    // MARK: - Get Tickets Label Created
    lazy var lblGetTickets: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = KhaltiFonts.semibold.getFont(withSize: 11)
        
        label.textColor = UIColor(named: "secondary")
        
        label.text = "GET TICKETS"
        
        return label
        
    }()
    
    lazy var viewRecharge: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        
        return view
        
    }()
    
    // MARK: - Win Label Created
    lazy var lblRecharge: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = KhaltiFonts.bold.getFont(withSize: 12)
        
        label.textColor = UIColor(named: "label")

        label.text = "Recharge & Bill Payments"
        
        return label
        
    }()
    
    
    lazy var btnViewMore: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .darkGray
        
        button.tintColor = UIColor(named: "theme")
        
        button.setTitle("View More", for: .normal)
        
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        
        button.setTitle("View Less", for: .selected)

        button.setImage(UIImage(systemName: "chevron.up"), for: .selected)

        button.addTarget(self, action: #selector(toggleCollectionViewHeight), for: .touchUpInside)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: -4)
        
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 4)
        
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
        
        button.imageView?.transform3D = CATransform3DMakeScale(0.8, 0.8, 0.8)
        
        button.semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        
        button.backgroundColor = UIColor(named: "themeColor-Superlight")
        
        button.titleLabel?.font = KhaltiFonts.semibold.getFont(withSize: 12)
        
        button.tintColor = UIColor(named: "themeColor")
        
        button.setTitleColor(UIColor(named: "themeColor"), for: .normal)
                
        return button
        
    }()
    
    lazy var collectionView: UICollectionView = {
   
        let layout = UICollectionViewFlowLayout()
        
            layout.itemSize = CGSize(width: 60, height: 80)
        
            layout.minimumInteritemSpacing = 30
        
            layout.minimumLineSpacing = 30
        
            layout.sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
            collectionView.backgroundColor = .white
        
            collectionView.dataSource = self
        
            collectionView.delegate = self
        
            collectionView.isScrollEnabled = false
       
            collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
           return collectionView
        
       }()
    
    lazy var tblHomeItems: DynamicHeightTableView = {
        
        var tableView = DynamicHeightTableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.isScrollEnabled = false
        
        tableView.backgroundColor = .clear
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.register(CellHomeItems.self, forCellReuseIdentifier: "CellHomeItems")
        
        return tableView
        
    }()
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "themeColor")

        setupLayout()
        
        setupUIAction()
        
        apiCall()

    }
    override func viewWillLayoutSubviews() {

        DispatchQueue.main.async {
            
            self.btnProfile.layer.cornerRadius = self.btnProfile.bounds.height / 2
            
            self.btnViewMore.layer.cornerRadius = self.btnViewMore.bounds.height / 2
            
            self.btnRetry.layer.cornerRadius = self.btnRetry.bounds.height / 2
            
            self.themeView.round(corners: [.bottomLeft, .bottomRight], radius: 8)
            
            self.viewBalance.round(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 4)
          
        }
        
    }
    
}

// MARK: - Autolayout for UICOmponents
extension HomeVC {
    
    // MARK: - Setting Up Autolayout for UI Components
    
    func setupLayout() {
        
        autoLayoutscrollView()

        autoLayoutMainView()
                
        autoLayoutThemeView()
        
        autoLayoutStack()
        
        autoLayoutStackIcons()
        
        autoLayoutViewBalance()
        
        autoLayoutStackRs()
        
        autoLayoutStackBalance()
        
        autoLayoutForButtonRetry()
        
        autoLayoutbtnAddSendMoney()
        
        autoLayoutAdView()
        
        autoLayoutForWinLabel()
        
        autoLayoutForGetTicketsLabel()
        
        autoLayoutRechargeView()
        
        autoLayoutForRechargeLabel()
        
        autoLayoutCollectionView()
        
        autoLayoutToggleButton()
        
        autoLayoutForHomeTable()
        
    }
    
    // MARK: - Autolayout
    
    func autoLayoutTxtField() {
        
       
    }
    
    func autoLayoutscrollView(){
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
        
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    func autoLayoutMainView(){
        
        scrollView.addSubview(mainView)
        
        NSLayoutConstraint.activate([
        
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)

        ])
    }
    
    
    func autoLayoutThemeView() {
        
        mainView.addSubview(themeView)
        
        NSLayoutConstraint.activate([
        
            themeView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: -60),
            
            themeView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            
            themeView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
        ])
    }
    
    func autoLayoutStack(){
        
        themeView.addSubview(stackProfileName)
        
        NSLayoutConstraint.activate([
        
            stackProfileName.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            
            stackProfileName.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            
            btnProfile.widthAnchor.constraint(equalToConstant: 28),
            
            btnProfile.heightAnchor.constraint(equalToConstant: 28),
           
        ])
      
    }
    func autoLayoutStackIcons(){
        
        themeView.addSubview(stackIcons)
        
        NSLayoutConstraint.activate([
            
            stackIcons.centerYAnchor.constraint(equalTo: stackProfileName.centerYAnchor),
            
            stackIcons.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            
            btnSearch.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.1),

            btnSearch.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1),

            btnGift.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.1),

            btnGift.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1),

            btnNotification.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.1),

            btnNotification.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1),

        ])
      
    }
    
    func autoLayoutViewBalance(){
        
        themeView.addSubview(viewBalance)
        
        NSLayoutConstraint.activate([
            
            viewBalance.topAnchor.constraint(equalTo: stackProfileName.bottomAnchor, constant: 28),
            
            viewBalance.leadingAnchor.constraint(equalTo: themeView.leadingAnchor, constant: 10),
            
            viewBalance.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.45),
            
            viewBalance.bottomAnchor.constraint(equalTo: themeView.bottomAnchor, constant: -20)
            
        ])
    }
    
    func autoLayoutStackRs(){
        
        viewBalance.addSubview(stackRs)
        
        NSLayoutConstraint.activate([
        
            stackRs.topAnchor.constraint(equalTo: viewBalance.topAnchor, constant: 10),
            
            stackRs.leadingAnchor.constraint(equalTo: viewBalance.leadingAnchor, constant: 10),
            
        ])
    }
    
    func autoLayoutStackBalance(){
        
        viewBalance.addSubview(stackBalance)
        
        NSLayoutConstraint.activate([
        
            stackBalance.topAnchor.constraint(equalTo: stackRs.bottomAnchor, constant: 4),
            
            stackBalance.leadingAnchor.constraint(equalTo: viewBalance.leadingAnchor, constant: 10),
            
            btnToggleBalance.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
            
            stackBalance.bottomAnchor.constraint(equalTo: viewBalance.bottomAnchor, constant: -10)
            
        ])
    }
    
    func autoLayoutForButtonRetry() {
        
        themeView.addSubview(btnRetry)
        
        NSLayoutConstraint.activate([

            btnRetry.centerXAnchor.constraint(equalTo: viewBalance.trailingAnchor),
            
            btnRetry.centerYAnchor.constraint(equalTo: viewBalance.centerYAnchor),
            
            btnRetry.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
            
            btnRetry.widthAnchor.constraint(equalTo: btnRetry.heightAnchor)
            
        ])
        
    }
    
    func autoLayoutbtnAddSendMoney(){
        
        themeView.addSubview(stackAddSendMoney)
        
        NSLayoutConstraint.activate([
                    
            stackAddSendMoney.leadingAnchor.constraint(equalTo: viewBalance.trailingAnchor, constant: 30),
            
            stackAddSendMoney.trailingAnchor.constraint(equalTo: themeView.trailingAnchor, constant: -30),
            
            stackAddSendMoney.centerYAnchor.constraint(equalTo: viewBalance.centerYAnchor),
            
            btnSendMoney.widthAnchor.constraint(equalToConstant: 70),
            
            btnSendMoney.heightAnchor.constraint(equalToConstant: 70),
            
            btnAddMoney.widthAnchor.constraint(equalToConstant: 60),
            
            btnAddMoney.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }

    func autoLayoutAdView(){

        mainView.addSubview(viewAd)

        NSLayoutConstraint.activate([

            viewAd.topAnchor.constraint(equalTo: themeView.bottomAnchor, constant: 6),
            
            viewAd.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            viewAd.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.95),
            
            viewAd.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.045)
        ])
    }
    
    func autoLayoutForWinLabel() {
        
        viewAd.addSubview(lblWin)
        
        NSLayoutConstraint.activate([
            
            lblWin.leadingAnchor.constraint(equalTo: viewAd.leadingAnchor, constant: 10),
            
            lblWin.centerYAnchor.constraint(equalTo: viewAd.centerYAnchor)
            
        ])
        
    }
    
    func autoLayoutForGetTicketsLabel() {
        
        viewAd.addSubview(lblGetTickets)
        
        NSLayoutConstraint.activate([
            
            lblGetTickets.trailingAnchor.constraint(equalTo: viewAd.trailingAnchor, constant: -10),
            
            lblGetTickets.centerYAnchor.constraint(equalTo: viewAd.centerYAnchor)
            
        ])
        
    }
    
    func autoLayoutRechargeView(){
        
        mainView.addSubview(viewRecharge)
        
        NSLayoutConstraint.activate([
        
            viewRecharge.topAnchor.constraint(equalTo: viewAd.bottomAnchor, constant: 6),
            
            viewRecharge.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            
            viewRecharge.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
                        
        ])
    }
    
    func autoLayoutForRechargeLabel() {
        
        viewRecharge.addSubview(lblRecharge)
        
        NSLayoutConstraint.activate([
            
            lblRecharge.topAnchor.constraint(equalTo: viewRecharge.topAnchor, constant: 15),
                        
            lblRecharge.leadingAnchor.constraint(equalTo: viewRecharge.leadingAnchor, constant: 15)
            
        ])
        
    }
    
    func autoLayoutCollectionView() {
        
        viewRecharge.addSubview(collectionView)

        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 320)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: lblRecharge.bottomAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: viewRecharge.leadingAnchor),
            
            collectionView.trailingAnchor.constraint(equalTo: viewRecharge.trailingAnchor),
                        
            collectionViewHeightConstraint
            
        ])
        
    }
    
    func autoLayoutToggleButton(){
        
        viewRecharge.addSubview(btnViewMore)
        
        btnViewMore.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            btnViewMore.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            
            btnViewMore.centerXAnchor.constraint(equalTo: viewRecharge.centerXAnchor),
        
            btnViewMore.bottomAnchor.constraint(equalTo: viewRecharge.bottomAnchor, constant: -20)
        
        ])
        
    }
    
    func autoLayoutForHomeTable() {
        
        mainView.addSubview(tblHomeItems)
        
        NSLayoutConstraint.activate([
            
            tblHomeItems.topAnchor.constraint(equalTo: viewRecharge.bottomAnchor, constant: 10),
            
            tblHomeItems.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
            
            tblHomeItems.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            
            tblHomeItems.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
            
        ])
        
    }
    
    
}

// MARK: - Actions for UIComponents
extension HomeVC {
    
    // MARK: - Setup Actions for UIComponents
    func setupUIAction() {
                    
        btnRetry.addTarget(self, action: #selector(btnRetryTapped), for: .touchUpInside)
        
        btnToggleBalance.addTarget(self, action: #selector(btnToggleTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(btnToggleTapped))
        
        lblKhaltiBalance.isUserInteractionEnabled = true
        
        lblKhaltiBalance.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func toggleCollectionViewHeight() {
        
            if collectionViewHeightConstraint.constant == 320 {
               
                btnViewMore.isSelected = true
                
               collectionViewHeightConstraint.constant = 650
                
            } else {
                
                btnViewMore.isSelected = false

               collectionViewHeightConstraint.constant = 320
                
            }

            UIView.animate(withDuration: 0.3) {
                
                self.view.layoutIfNeeded()
                
            }
        }

    @objc func btnRetryTapped() {
        
        UIView.animate(withDuration: 0.5) {
            
            self.btnRetry.transform = CGAffineTransform(rotationAngle: .pi)
            
        }

        UIView.animate(withDuration: 0.5) {

            self.btnRetry.transform = CGAffineTransform(rotationAngle: .pi * 2)

        }

        balance = Double.random(in: 35000...100000).rounded()

        if btnToggleBalance.isSelected {
                        
            lblAmount.text = "\(balance)".currencyFormatting()
            
        }
        
    }
    
    @objc func btnToggleTapped() {
        
        btnToggleBalance.isSelected = !btnToggleBalance.isSelected
        
        if btnToggleBalance.isSelected {
            
            lblAmount.text = "\(balance)".currencyFormatting()
            
        } else {
            
            lblAmount.text = "XXX.X"
            
        }
        
    }
  
    // MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return khaltiModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        
        cell.configure(with: khaltiModel[indexPath.item])
        
        return cell
        
    }
    
    
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return homeItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellHomeItems", for: indexPath) as? CellHomeItems
        
        cell?.setupData(data: homeItems[indexPath.row])
        
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
        
    }
    
}

extension HomeVC {
    
    // MARK: - API Call
    func apiCall() {
        
    }
    
}

extension String {
    
    // formatting text for currency textField
    func currencyFormatting() -> String {
        
        if let value = Double(self) {
            
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .currency
            
            formatter.locale = Locale(identifier: "en_NP")
            
            formatter.currencySymbol = ""
            
            formatter.maximumFractionDigits = 2
            
            formatter.minimumFractionDigits = 2
            
            if let str = formatter.string(for: value) {
                
                return str
                
            }
            
        }
        
        return ""
        
    }
    
}
