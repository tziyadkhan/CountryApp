//
//  CityCell.swift
//  CountryApp
//
//  Created by Ziyadkhan on 05.03.24.
//

import UIKit

class CityCell: UITableViewCell {
    
    lazy var cityName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCellElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellElements() {
        addSubview(cityName)
        cityName.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
        }
    }
    
    func configureData(data: City) {
        cityName.text = data.name
    }
}
