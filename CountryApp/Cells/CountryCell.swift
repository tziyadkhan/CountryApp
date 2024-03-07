//
//  CountryCell.swift
//  CountryApp
//
//  Created by Ziyadkhan on 05.03.24.
//

import UIKit
import SnapKit

class CountryCell: UITableViewCell {
    
    lazy var flagImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 25
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy var countryName: UILabel = {
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
        addSubview(flagImage)
        addSubview(countryName)
        flagImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.left.equalToSuperview().inset(8)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        countryName.snp.makeConstraints { make in
            make.left.equalTo(flagImage.snp.right).inset(-8)
            make.centerY.equalTo(flagImage)
        }
    }
    
    func configureData(data: CountryModel) {
        flagImage.image = UIImage(named: data.flag)
        countryName.text = data.name
    }
    
}
