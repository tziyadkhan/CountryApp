//
//  CountryPageController.swift
//  CountryApp
//
//  Created by Ziyadkhan on 05.03.24.
//

import UIKit
import SnapKit

class CountryPageController: UIViewController {
    
    lazy var countryTable: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.register(CountryCell.self, forCellReuseIdentifier: "\(CountryCell.self)")
            
        return table
    }()
    
    let items = CountryData()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configConstraints()
    }
    
}
//MARK: Table Functions
extension CountryPageController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        
        let data = items.countries[indexPath.row]
        cell.configureData(data: data)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = items.countries[indexPath.row]
        showCityPage(data: data, title: data.name)
    }
}


//MARK: Functions
extension CountryPageController {
    func configUI() {
        view.backgroundColor = .systemBackground
        title = "Country List"
        view.addSubview(countryTable)
    }
    
    func configConstraints() {
        countryTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func showCityPage(data: CountryModel, title: String) {
        let coordinator = CityPageCoordinator(navigationController: navigationController ?? UINavigationController(), item: data, title: title)
        coordinator.start()
    }
}
