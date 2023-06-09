//
//  TipsCollectionViewCell.swift
//  BILL FOR FRIENDS
//
//  Created by Artem Elchev on 07.06.2023.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool { //ячейка выделена, обводим.
        didSet {
            if isSelected == true {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.642036438, green: 0.2482411861, blue: 0.6239321828, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.9559090734, green: 0.9558081031, blue: 0.9488416314, alpha: 1)
        layer.cornerRadius = 10
        
        addSubview(percentLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        percentLabel.font = UIFont(name: "Avenir Next Bold", size: 24)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            percentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            percentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
