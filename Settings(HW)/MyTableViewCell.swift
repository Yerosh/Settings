//
//  MyTableViewCell.swift
//  Settings(HW)
//
//  Created by Yernur Adilbek on 10/19/23.
//

import SnapKit
import UIKit

final class MyTableViewCell: UITableViewCell{
    func configure(image: UIImage?, text: String?){
        iconView.image = image
        label.text = text
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var iconView: UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
}

//MARK: - setupUi
// MARK: - setting iui methods
private extension MyTableViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(iconView)
        addSubview(label)
    }
    
    func setupConstraints() {
        iconView.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        label.snp.makeConstraints{make in
            make.leading.equalTo(iconView.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
        }
    }
}
