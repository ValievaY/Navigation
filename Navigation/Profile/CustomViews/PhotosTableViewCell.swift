//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Apple Mac Air on 02.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private var photosNames = PhotosNames()

    private enum Constants {
        static let numberOfItemsInLine: CGFloat = 4
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }()

    private lazy var collectionPhotosView: UICollectionView = {
        let collectionPhotosView = UICollectionView(frame: self.bounds, collectionViewLayout: self.layout)
        collectionPhotosView.register(ProfileCollectionView.self, forCellWithReuseIdentifier: "CustomCell")
        collectionPhotosView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionPhotosView.delegate = self
        collectionPhotosView.dataSource = self
        collectionPhotosView.translatesAutoresizingMaskIntoConstraints = false
        return collectionPhotosView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
       private lazy var label: UILabel = {
        let label = UILabel()
        label.tag = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
           label.textColor = .createColor(lightMode: .black, darkMode: .white)
        label.text = ~"label-text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.tag = 1
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .createColor(lightMode: .black, darkMode: .white)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackView)
        addSubview(collectionPhotosView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(image)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            collectionPhotosView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
            collectionPhotosView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            collectionPhotosView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            collectionPhotosView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
    }
    
    @objc func reloadCollection(timer: Timer) {
        collectionPhotosView.reloadData()
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.photosNames.photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? ProfileCollectionView else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
        return cell
    }
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        
        cell.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector (reloadCollection), userInfo: photosNames.photos.randomElement(), repeats: true)
        cell.timer?.tolerance = 0.5
        cell.setup(with: cell.timer?.userInfo as! String)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let interItemSpacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0

        let width = collectionView.frame.width - (Constants.numberOfItemsInLine - 1) * interItemSpacing - insets.left - insets.right
        let itemWidth = floor(width / Constants.numberOfItemsInLine)

        return CGSize(width: itemWidth, height: itemWidth)
    }
}
