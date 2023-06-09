//
//  TipsCollectionView.swift
//  BILL FOR FRIENDS
//
//  Created by Artem Elchev on 07.06.2023.
//

import UIKit

class TipsCollectionView: UICollectionView {
    
    var flowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setipView() {
        delegate = self
        dataSource = self
    }
    
}

extension TipsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell
        else { return UICollectionViewCell() }
        return cell
    }
    
}
