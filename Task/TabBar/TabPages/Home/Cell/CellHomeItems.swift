//
//  CellHomeItems.swift
//  Task
//
//  Created by Anuwesh Khadka on 14/03/2023.
//

import UIKit

class CellHomeItems: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    var khaltiModel = [KhaltiModel]() {

        didSet {

            collectionIcons.reloadData()

        }

    }

    var carouselTimer: Timer?

    lazy var mainView: UIView = {

        var view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = .white

        return view

    }()

    // MARK: - Title Label Created
    lazy var lblTitle: UILabel = {

        var label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = KhaltiFonts.bold.getFont(withSize: 12)

        label.textColor = UIColor(named: "label")

        label.text = " "

        return label

    }()

    lazy var collectionIcons: UICollectionView = {

        let layout = UICollectionViewFlowLayout()

        layout.itemSize = CGSize(width: 60, height: 80)

        layout.minimumInteritemSpacing = 30

        layout.minimumLineSpacing = 30

        layout.sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)

        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.backgroundColor = .white

        collectionView.dataSource = self

        collectionView.delegate = self

        collectionView.isScrollEnabled = true

        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        return collectionView

    }()

    lazy var collectionCarousel: UICollectionView = {

        let layout = UICollectionViewFlowLayout()

        layout.minimumLineSpacing = 0

        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        layout.scrollDirection = .horizontal

        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.backgroundColor = .white

        collectionView.dataSource = self

        collectionView.delegate = self

        collectionView.isScrollEnabled = true

        collectionView.isPagingEnabled = true

        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(CellCarousel.self, forCellWithReuseIdentifier: "CellCarousel")

        return collectionView

    }()

    // MARK: - Main Stack View Created
    lazy var stackMain: UIStackView = {

        var stackView = UIStackView()

        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .vertical

        stackView.alignment = .fill

        stackView.distribution = .fill

        stackView.spacing = 15

        stackView.addArrangedSubview(lblTitle)

        stackView.addArrangedSubview(collectionIcons)

        stackView.addArrangedSubview(collectionCarousel)

        return stackView

    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear

        contentView.backgroundColor = .clear

        self.selectionStyle = .none

        self.separatorInset = .zero

        autoLayoutForMainView()

        autoLayoutForMainStack()

    }

    required init?(coder: NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupData(data: HomeDataModel) {

        if let title = data.sectionTitle {

            collectionIcons.isHidden = false

            lblTitle.isHidden = false

            collectionCarousel.isHidden = true

            self.lblTitle.text = "     \(title)"

        } else {

            collectionIcons.isHidden = true

            lblTitle.isHidden = true

            collectionCarousel.isHidden = false

            startTimer()

        }

        self.khaltiModel = data.items

    }

    func startTimer() {
        
        carouselTimer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] timer in
            
            guard let self = self else { return }
            
            let currentOffset = self.collectionCarousel.contentOffset.x
            
            let nextOffset = currentOffset + self.collectionCarousel.frame.width
            
            if nextOffset < self.collectionCarousel.contentSize.width {
                
                self.collectionCarousel.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)
                
            } else {
                
                self.collectionCarousel.setContentOffset(CGPoint.zero, animated: true)
                
            }
            
        }
        
    }

    func autoLayoutForMainView() {

        contentView.addSubview(mainView)

        NSLayoutConstraint.activate([

            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),

            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)

        ])

    }
    func autoLayoutForMainStack() {

        mainView.addSubview(stackMain)

        NSLayoutConstraint.activate([

            stackMain.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),

            stackMain.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),

            stackMain.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),

            stackMain.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15)
        ])

    }

    // MARK: - mainViewView

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return khaltiModel.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == collectionIcons {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell

            cell.configure(with: khaltiModel[indexPath.item])

            return cell

        } else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCarousel", for: indexPath) as! CellCarousel

            cell.imageView.image = khaltiModel[indexPath.item].icon

            return cell

        }

    }

}
