//
//  DetailTableViewCell.swift
//  Week8
//
//  Created by Raiymbek Azharbayev on 01.11.2023.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    private lazy var iconButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.tintColor = .cyanCustom
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.cyanCustom.cgColor
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ task: Task, _ indexPath: IndexPath) {
        let subtask = task.subtasks[indexPath.row]
        var iconName = ""
        
        if subtask.title == "Add a list item" {
            iconName = "plus"
        }
        
        if subtask.isCompleted {
            iconName = "checkmark"
        }
        
        if task.status == .canceled {
            iconName = "xmark"
        }
    
        taskLabel.attributedText = NSAttributedString(string: subtask.title, attributes: [:])
        taskLabel.isEnabled = true
        
        iconButton.isEnabled = true
        
        if subtask.isCompleted || task.status == .canceled {
            taskLabel.attributedText = NSAttributedString(
                string: subtask.title,
                attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
            )
            taskLabel.isEnabled = false
            
            iconButton.isEnabled = false
            iconButton.tintColor = .lightGray
            iconButton.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        iconButton.setImage(UIImage(
            systemName: iconName,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18)
        ), for: .normal)
    }

}

// MARK: - Setup UI
private extension DetailTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(iconButton)
        addSubview(taskLabel)
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
            $0.centerY.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
    }
}
