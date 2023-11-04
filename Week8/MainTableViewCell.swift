//
//  NameTableViewCell.swift
//  Week8
//
//  Created by Raiymbek Azharbayev on 28.10.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    private lazy var iconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(
            systemName: "questionmark.square.dashed",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18)
        ), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.tintColor = .white
        button.backgroundColor = .cyanCustom
        return button
    }()
    
    private lazy var taskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 18)
        label.textColor = .grayCustom
        label.text = "No text"
        label.attributedText = nil
        label.isEnabled = true
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 14)
        label.textColor = .lightGray
        label.text = "No text"
        label.isEnabled = true
        return label
    }()
    
    private lazy var ellipsisIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "ellipsis")
        imageView.tintColor = .lightGray
        imageView.transform = imageView.transform.rotated(by: .pi / 2)
        return imageView
    }()
    
    private lazy var ellipsisButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(
            systemName: "ellipsis",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 45)
        ), for: .normal)
        button.imageView!.transform = button.imageView!.transform.rotated(by: .pi / 2)
        button.imageView!.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.tintColor = .lightGray
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(task: Task) {
        iconButton.backgroundColor = task.icon.0
        iconButton.setImage(UIImage(systemName: task.icon.1), for: .normal)
        
        taskLabel.attributedText = NSAttributedString(
            string: task.title,
            attributes: [:]
        )
        taskLabel.isEnabled = true
        
        descriptionLabel.text = task.description
        descriptionLabel.isEnabled = true
        
        if task.icon.0 == UIColor.complete || task.icon.0 == UIColor.cancel {
            taskLabel.attributedText = NSAttributedString(
                string: task.title,
                attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
            )
            taskLabel.isEnabled = false
            
            descriptionLabel.isEnabled = false
        }
    }
}

// MARK: - Setup UI
private extension MainTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(iconButton)
        addSubview(taskLabel)
        addSubview(descriptionLabel)
        addSubview(ellipsisIcon)
        addSubview(ellipsisButton)
    }
    
    func setupConstraints() {
        iconButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(5)
            $0.height.equalToSuperview().multipliedBy(0.6)
            $0.width.equalTo(iconButton.snp.height)
        }
        
        taskLabel.snp.makeConstraints {
            $0.leading.equalTo(iconButton.snp.trailing).offset(15)
            $0.top.equalTo(iconButton.snp.top)
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(iconButton.snp.trailing).offset(15)
            $0.bottom.equalTo(iconButton.snp.bottom)
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        ellipsisButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(iconButton.snp.width)
            $0.width.equalTo(iconButton.snp.width)
        }
    }
    
}
