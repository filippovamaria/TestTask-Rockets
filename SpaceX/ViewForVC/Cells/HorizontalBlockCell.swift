//
//  HorizontalBlockCell.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

// MARK: Подумать над названием
class HorizontalBlockCell: UITableViewCell {
    
    private lazy var layoutTableViewCell: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        return layout
    }()
    
    lazy var horizontalBlockCV: UICollectionView = {
        let photosCV = UICollectionView(frame: .zero,
                                        collectionViewLayout: layoutTableViewCell)
        photosCV.delegate = self
        photosCV.dataSource = self
        photosCV.register(HorizontalBlockCVCell.self,
                          forCellWithReuseIdentifier: "HorizontalBlockCVCell")
        photosCV.backgroundColor = .black
        photosCV.translatesAutoresizingMaskIntoConstraints = false
        return photosCV
    }()
    
    var parametersValues: [String] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell() {
        self.addSubview(horizontalBlockCV)
        
        NSLayoutConstraint.activate([horizontalBlockCV.topAnchor.constraint(equalTo: self.topAnchor),
                                     horizontalBlockCV.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     horizontalBlockCV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
                                     horizontalBlockCV.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     horizontalBlockCV.heightAnchor.constraint(equalToConstant: 120)])
    }
    
    private func itemSize(height: CGFloat, spacing: CGFloat) -> CGSize{
        let neededWidth = height - spacing * 4.5
        let itemWidth = neededWidth / 3.5
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension HorizontalBlockCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parametersValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalBlockCVCell", for: indexPath) as! HorizontalBlockCVCell
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true
        cell.parameter.text = parameters[indexPath.row]
        cell.parameterValue.text = parametersValues[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (horizontalBlockCV.collectionViewLayout as? UICollectionViewFlowLayout)!.minimumInteritemSpacing
        let width = collectionView.frame.height - 3 * spacing
        return CGSize(width: width + 5, height: width)
    }
    
    
}

extension HorizontalBlockCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
