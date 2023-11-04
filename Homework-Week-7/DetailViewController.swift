//
//  DetailViewController.swift
//  Week8
//
//  Created by Raiymbek Azharbayev on 01.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let fontRegular = "GillSans"
    private let fontSemibold = "GillSans-SemiBold"
    private let fontBold = "GillSans-Bold"
    
    var selectedTask: Task?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        detailTableView.dataSource = self
        detailTableView.delegate = self
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        setupUI()
    }
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(
                systemName: "chevron.left",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)
            ), for: .normal
        )
        button.tintColor = .grayCustom
        return button
    }()
    
    private lazy var trashButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(
            systemName: "trash",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)
        ), for: .normal)
        button.tintColor = .grayCustom
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = selectedTask!.title
        label.font = UIFont(name: fontBold, size: 25)
        label.textAlignment = .natural
        label.textColor = .grayCustom
        return label
    }()
    
    private lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Created on Nov 2nd @ 11:00pm"
        label.font = UIFont(name: fontSemibold, size: 15)
        label.textAlignment = .natural
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var selectView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrayCustom
        return view
    }()
    
    private lazy var todoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .grayCustom
        button.layer.cornerRadius = 20
        button.setTitle("TO DO (\(selectedTask!.total))", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: fontSemibold, size: 14)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var completeButton: UIButton = {
        let button = UIButton()
        button.setTitle("COMPLETE (\(selectedTask!.done))", for: .normal)
        button.setTitleColor(.grayCustom, for: .normal)
        button.titleLabel?.font = UIFont(name: fontSemibold, size: 14)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var detailTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var downView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayCustom
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var downImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(
            systemName: "arrow.down",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 25
            )
        )
        imageView.tintColor = .white
        return imageView
    }()
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - TableView data source methods
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedTask!.status == .todo {
            selectedTask!.total + 1
        } else {
            selectedTask!.total
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        cell.configure(selectedTask!, indexPath)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
}

// MARK: TableView delegate methods
extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.08
    }
}

// MARK: - UI setup methods
private extension DetailViewController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(navigationView)
        navigationView.addSubview(backButton)
        navigationView.addSubview(trashButton)
        navigationView.addSubview(titleLabel)
        navigationView.addSubview(captionLabel)
        navigationView.addSubview(selectView)
        selectView.addSubview(completeButton)
        selectView.addSubview(todoButton)
        view.addSubview(detailTableView)
        view.addSubview(downView)
        downView.addSubview(downImage)
    }
    
    func setupConstraints() {
        navigationView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.height.equalToSuperview().multipliedBy(0.15)
            $0.width.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.top)
            $0.bottom.equalTo(selectView.snp.top)
            $0.width.equalToSuperview().multipliedBy(0.15)
        }
        
        trashButton.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.top)
            $0.bottom.equalTo(selectView.snp.top)
            $0.width.equalToSuperview().multipliedBy(0.15)
            $0.right.equalTo(0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.top).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        captionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        selectView.snp.makeConstraints {
            $0.width.bottom.equalToSuperview()
            $0.top.equalTo(captionLabel.snp.bottom).offset(15)
        }
        
        completeButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.centerY.equalToSuperview()
            $0.left.equalTo(todoButton.snp.right)
        }
        
        todoButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalToSuperview().multipliedBy(0.75)
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(15)
        }
        
        detailTableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(navigationView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        downView.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.15)
            $0.height.equalTo(downView.snp.width)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-15)
        }
        
        downImage.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
