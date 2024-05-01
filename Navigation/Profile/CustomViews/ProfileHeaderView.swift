//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Apple Mac Air on 28.08.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView  {
    
    var statusText: String = ""
    
     lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fox.jpg")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .createColor(lightMode: .black, darkMode: .white)
        nameLabel.text = "Yulia Valieva"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .createColor(lightMode: .black, darkMode: .white)
        status.text = ~"status-text"
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var statusTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.textAlignment = .center
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.cornerRadius = 12
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.placeholder = ~"placeholder"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var changeTitle: UIButton = {
        let titleButton = UIButton()
        titleButton.setTitle(~"title", for: .normal)
        titleButton.setTitleColor(UIColor.black, for: .normal)
        titleButton.backgroundColor = .createColor(lightMode: .white, darkMode: .black)
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        return titleButton
    }()
    
    private lazy var setStatusButton = CustomButton(title: ~"status-button",
                                                    cornerRadius: 4,
                                                    titleColor: .white,
                                                    color: .systemBlue,
                                                    buttonAction: { [self] in
        print(statusLabel.text ?? "No text")
        statusLabel.text = statusTextField.text
        statusText = statusTextField.text ?? "No text"
    } )
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    
    func addView() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(changeTitle)
    }
    
    func setupConstraints() {
        
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            avatarImageView.topAnchor.constraint(equalTo: changeTitle.bottomAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: changeTitle.bottomAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -50),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -5),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            changeTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            changeTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            changeTitle.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
        ])
    }
}
