//
//  CityPageController.swift
//  CountryApp
//
//  Created by Ziyadkhan on 05.03.24.
//

import UIKit

class CityPageController: UIViewController {
    
    lazy var cityTable: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.register(CityCell.self, forCellReuseIdentifier: "\(CityCell.self)")
        
        return table
    }()
    
    var cityItems: [City]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configConstraints()
    }

}

extension CityPageController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CityCell.self)", for: indexPath) as! CityCell
        guard let data = cityItems?[indexPath.row] else { return UITableViewCell() }
        cell.configureData(data: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = cityItems?[indexPath.row] else {return}
        showCityInfo(data: data, title: data.name)
    }
}

extension CityPageController {
    func configUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(cityTable)
    }
    
    func configConstraints() {
        cityTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func showCityInfo(data: City, title: String) {
        let coordinator = CityInfoCoordinator(navigationController: navigationController ?? UINavigationController(), item: data, title: title)
        coordinator.start()
    }
    
}
