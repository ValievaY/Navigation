//
//  CustomButton.swift
//  Navigation
//
//  Created by Apple Mac Air on 18.01.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    typealias Action = () -> Void
    
    var title: String?
    var cornerRadius: CGFloat?
    var titleColor: UIColor?
    var color: UIColor?
    var buttonAction: Action?
    
    init (title: String?, cornerRadius: CGFloat?, titleColor: UIColor?, color: UIColor?, buttonAction: @escaping Action) {
        super.init(frame: .zero)
        self.title = title
        self.cornerRadius = cornerRadius
        self.titleColor = titleColor
        self.color = color
        self.buttonAction = buttonAction
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        layer.cornerRadius = cornerRadius ?? 0
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        if let action = buttonAction {
            action()
        } else {
            print ("No target")
        }
    }
}
