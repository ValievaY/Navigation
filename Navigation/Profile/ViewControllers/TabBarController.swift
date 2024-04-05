

import UIKit

class TabBarController: UITabBarController {
    
    var feedNavigationController : UINavigationController!
    var logInNavigationController : UINavigationController!
    var favoritesPostsController: UINavigationController!
    
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
        favoritesPostsController = UINavigationController.init(rootViewController: FavorietsPostsVC())
        
        self.viewControllers = [feedNavigationController, logInNavigationController, favoritesPostsController]
        
        feedNavigationController.tabBarItem = UITabBarItem (title: ~"feed", image: UIImage(systemName: "heart.text.square"), tag: 0)
        logInNavigationController.tabBarItem = UITabBarItem (title: ~"profile", image: UIImage(systemName: "person"), tag: 1)
        favoritesPostsController.tabBarItem = UITabBarItem (title: ~"like", image: UIImage(systemName: "heart"), tag: 2)
        
        UITabBar.appearance().tintColor = UIColor (red: 0/105.0, green: 0/105.0, blue: 236/105.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = .systemGray6
        
    }
}

