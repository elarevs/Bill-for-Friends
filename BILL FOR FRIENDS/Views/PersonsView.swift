//
//  PersonsView.swift
//  BILL FOR FRIENDS
//
//  Created by Artem Elchev on 07.06.2023.
//

import UIKit

class PersonsView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9660720229, green: 0.9660721421, blue: 0.9660720229, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 48)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var counter = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
        counterLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(backGrayView)
        backGrayView.addSubview(minusButton)
        backGrayView.addSubview(plusButton)
        backGrayView.addSubview(counterLabel)
    }
    
    @objc func minusButtonTapped() {
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter <= 1 {
            minusButton.isEnabled = false
        }
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            backGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backGrayView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            minusButton.topAnchor.constraint(equalTo: backGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: backGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLabel.centerYAnchor.constraint(equalTo: backGrayView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10)
        ])
    }
    
}
