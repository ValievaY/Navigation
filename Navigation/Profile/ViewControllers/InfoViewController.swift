
import UIKit

class InfoViewController: UIViewController {
    
    let alert = UIAlertController(title: ~"alert-title", message: ~"alert-message", preferredStyle: .alert)
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle(~"button-title", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let labelUser: UILabel = {
        let labelUser = UILabel()
        labelUser.translatesAutoresizingMaskIntoConstraints = false
        return labelUser
    }()
    
    private let labelPlanet: UILabel = {
        let labelPlanet = UILabel()
        labelPlanet.layer.cornerRadius = 25
        labelPlanet.clipsToBounds = true
        labelPlanet.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelPlanet.textColor = .systemBlue
        labelPlanet.textAlignment = .center
        labelPlanet.numberOfLines = 3
        labelPlanet.backgroundColor = .createColor(lightMode: .systemGray6, darkMode: .systemGray2)
        labelPlanet.translatesAutoresizingMaskIntoConstraints = false
        return labelPlanet
    }()
    
    let userNetwork = UserNetwork()
    let planetNetwork = PlanetNetwork()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .createColor(lightMode: .white, darkMode: .black)
        constraints()
        setupAlert()
        addAlert()
        userNetwork.request { [weak self] title in
            DispatchQueue.main.async {
                self?.labelUser.text = title
            }
        }
        
        planetNetwork.request { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let planet):
                    self?.labelPlanet.text = ~"planet-text" + planet.orbitalPeriod
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func constraints() {
        
        view.addSubview(button)
        view.addSubview(labelUser)
        view.addSubview(labelPlanet)
        
        NSLayoutConstraint.activate([
            labelUser.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            labelUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelUser.heightAnchor.constraint(equalToConstant: 20),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            labelPlanet.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            labelPlanet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelPlanet.heightAnchor.constraint(equalToConstant: 100),
            labelPlanet.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupAlert() {
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            _ in
            print("OK")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {
            _ in
            print("cancel")
        }))
    }
    
    func addAlert() {
        button.addTarget(self, action: #selector(toAlert), for: .touchUpInside)
    }
    
    @objc func toAlert() {
        self.present(alert, animated: true, completion: nil)
    }
}
