

import UIKit

class TabBarController: UITabBarController {
    
    var feedNavigationController : UINavigationController!
    var logInNavigationController : UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarUI()
    }
    
    private func tabBarUI () {
        let loginViewController = LogInViewController()
        loginViewController.loginDelegate = MyLoginFactory().makeLoginInspector()
//        let loginInspector = LoginInspector()
//        loginViewController.loginDelegate = loginInspector - задача 1
        feedNavigationController = UINavigationController.init(rootViewController: FeedViewController ())
        logInNavigationController = UINavigationController.init(rootViewController: loginViewController)
        
        self.viewControllers = [feedNavigationController, logInNavigationController]
        
        feedNavigationController.tabBarItem = UITabBarItem (title: "Feed", image: UIImage(systemName: "heart.text.square"), tag: 0)
        logInNavigationController.tabBarItem = UITabBarItem (title: "Profile", image: UIImage(systemName: "person"), tag: 1)
        
        UITabBar.appearance().tintColor = UIColor (red: 0/105.0, green: 0/105.0, blue: 236/105.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = .systemGray6
        
    }
}

