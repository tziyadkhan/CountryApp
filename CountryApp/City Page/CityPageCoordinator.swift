//
//  CityPageCoordinator.swift
//  CountryApp
//
//  Created by Ziyadkhan on 06.03.24.
//

import UIKit

class CityPageCoordinator:Coordinator {
    var navigationController: UINavigationController
    var item: CountryModel
    var title: String
    
    init(navigationController: UINavigationController, item: CountryModel, title: String) {
        self.navigationController = navigationController
        self.item = item
        self.title = title
    }
    
    func start() {
        let controller = CityPageController()
        controller.cityItems = item.cities
        controller.title = title
        navigationController.show(controller, sender: nil)
    }
    
    
}
