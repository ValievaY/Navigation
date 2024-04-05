

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var buttonFirst: UIButton = {
        let button = UIButton()
        button.setTitle(~"view-post", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonSecond: UIButton = {
        let button = UIButton()
        button.setTitle(~"view-post", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 25
        label.backgroundColor = .systemGray
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkGuessButton = CustomButton(title: ~"guess-button",
                                                     cornerRadius: 10,
                                                     titleColor: .white,
                                                     color: .systemBlue,
                                                     buttonAction: { [self] in
        if textField.hasText {
            let model = FeedModel().check(textField.text ?? "")
            if model {
                label.backgroundColor = .systemGreen
            } else {
                label.backgroundColor = .systemRed
            }
        } else {
            label.backgroundColor = .systemGray
            print ("TextField is empty")
        }
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ~"title-feed"
        view.backgroundColor = .white
        addTargets()
        setupConstraints()
    }
    
   private func addTargets() {
        buttonFirst.addTarget(self, action: #selector(toPostView), for: .touchUpInside)
       buttonSecond.addTarget(self, action: #selector(toPostView), for: .touchUpInside)
    }
    
   private func setupConstraints() {

       view.addSubview(stackView)
       view.addSubview(textField)
       view.addSubview(checkGuessButton)
       view.addSubview(label)
       stackView.addArrangedSubview(buttonFirst)
       stackView.addArrangedSubview(buttonSecond)
       
       checkGuessButton.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            checkGuessButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            checkGuessButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            checkGuessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: 50),
            label.heightAnchor.constraint(equalToConstant: 50),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func toPostView() {
        let postController = PostViewController()
        self.navigationController?.pushViewController(postController, animated: true)
        postController.titlePost = ~"new-post"
    }
}
