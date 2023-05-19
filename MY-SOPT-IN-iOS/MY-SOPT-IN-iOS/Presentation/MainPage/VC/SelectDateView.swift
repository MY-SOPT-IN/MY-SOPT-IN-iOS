//
//  SelectDateView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/18.
//

import UIKit

class SelectDateView: UICollectionView {
    
    // MARK: - Properties
    
    let flowLayout = UICollectionViewFlowLayout()
    private let itemSpacing: CGFloat = 16
    private let itemCount: Int = 7
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setStyle() {
        self.backgroundColor = .Mono.white
        self.showsHorizontalScrollIndicator = false
        self.collectionViewLayout = flowLayout
        
        flowLayout.do{
            $0.itemSize = CGSize(width: (50) , height: 50)
            $0.minimumInteritemSpacing = itemSpacing
            $0.scrollDirection = .horizontal
        }
    }
    
    func setLayout() {}
    
    // MARK: - @objc Function
    
    
}
