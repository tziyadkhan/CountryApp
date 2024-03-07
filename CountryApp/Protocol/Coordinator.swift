//
//  Coordinator.swift
//  CountryApp
//
//  Created by Ziyadkhan on 06.03.24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    
    func start()
}
