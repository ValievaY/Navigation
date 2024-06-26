

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = ""
    
    let info = InfoViewController().self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titlePost
        postViewUI()
    }
    
    func postViewUI () {
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.createColor(lightMode: .black, darkMode: .white)]
        navigationController?.navigationBar.barTintColor = .lightGray
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toInfoView))
        self.navigationItem.rightBarButtonItem = add
        view.backgroundColor = .createColor(lightMode: .white, darkMode: .black)
    }
    @objc func toInfoView() {
        self.present(info, animated: true, completion: nil)
    }
}
