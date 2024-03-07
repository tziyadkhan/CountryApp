//
//  CountryPageCoordinator.swift
//  CountryApp
//
//  Created by Ziyadkhan on 06.03.24.
//

import UIKit

class CountryPageCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CountryPageController()
        navigationController.show(controller, sender: nil)
    }
}
