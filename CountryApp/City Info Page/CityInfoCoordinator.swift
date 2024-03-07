//
//  CityInfoCoordinator.swift
//  CountryApp
//
//  Created by Ziyadkhan on 06.03.24.
//

import UIKit

class CityInfoCoordinator:Coordinator {
    
    var navigationController: UINavigationController
    var item: City
    var title: String
    
    init(navigationController: UINavigationController, item: City, title: String) {
        self.navigationController = navigationController
        self.item = item
        self.title = title
    }
    
    func start() {
        let controller = CityInfoController()
        controller.cityItems = item
        controller.title = title
        navigationController.show(controller, sender: nil)
    }
}
