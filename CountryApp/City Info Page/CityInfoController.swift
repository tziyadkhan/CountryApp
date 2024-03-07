//
//  CityInfoController.swift
//  CountryApp
//
//  Created by Ziyadkhan on 05.03.24.
//

import UIKit
import SnapKit

class CityInfoController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        
        return scroll
    }()
    
    lazy var cityImageView: UIImageView = {
        let cityImage = UIImageView()
        cityImage.contentMode = .scaleToFill
        cityImage.backgroundColor = .red
        cityImage.layer.cornerRadius = 10
        cityImage.layer.masksToBounds = true
        
        return cityImage
    }()
    
    lazy var cityInfo: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    var cityItems: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        fillElements()
        configConstraints()
    }
}

extension CityInfoController {
    
    func configUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(cityImageView)
        scrollView.addSubview(cityInfo)
        
    }
    
    func fillElements() {
        cityImageView.image = UIImage(named: cityItems?.image ?? "")
        cityInfo.text = cityItems?.info
    }
    
    func configConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cityImageView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(200)
            make.width.equalTo(354)
        }
        
        cityInfo.snp.makeConstraints { make in
            make.top.equalTo(cityImageView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
