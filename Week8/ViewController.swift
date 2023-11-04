//
//  ViewController.swift
//  Week8
//
//  Created by Raiymbek Azharbayev on 28.10.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let fontRegular = "GillSans"
    private let fontSemibold = "GillSans-SemiBold"
    private let fontBold = "GillSans-Bold"
    
    private var totalCount = Constants.getTotalCount()
    private var toDoCount = Constants.getToDoCount()
    private var completedCount = Constants.getCompletedCount()
    private var canceledCount = Constants.getCanceledCount()
    
    private var sections = Constants.sections
    private var tasks = Constants.tasks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        setupUI()
    }
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
    
    private lazy var calendarButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(
                systemName: "calendar",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 25
                )
            ),
            for: .normal
        )
        button.tintColor = .grayCustom
        return button
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(
                systemName: "magnifyingglass",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 25
                )
            ),
            for: .normal
        )
        button.tintColor = .grayCustom
        return button
    }()
    
    private lazy var todoLabel: UILabel = {
        let label = UILabel()
        label.text = "To Do List"
        label.font = UIFont(name: fontBold, size: 25)
        label.textAlignment = .center
        label.textColor = .grayCustom
        return label
    }()
    
    private lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.text = "\(totalCount) tasks, \(completedCount) completed"
        label.font = UIFont(name: fontSemibold, size: 15)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var daysView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrayCustom
        return view
    }()
    
    private lazy var tomorrowButton: UIButton = {
        let button = UIButton()
        button.setTitle("YESTERDAY", for: .normal)
        button.setTitleColor(.grayCustom, for: .normal)
        button.titleLabel?.font = UIFont(name: fontSemibold, size: 14)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var todayButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .grayCustom
        button.layer.cornerRadius = 20
        button.setTitle("TODAY (\(totalCount))", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: fontSemibold, size: 14)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var yesterdayButton: UIButton = {
        let button = UIButton()
        button.setTitle("TOMORROW", for: .normal)
        button.setTitleColor(.grayCustom, for: .normal)
        button.titleLabel?.font = UIFont(name: fontSemibold, size: 14)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var addView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayCustom
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var addImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(
            systemName: "plus.circle",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 25
            )
        )
        imageView.tintColor = .white
        return imageView
    }()
}

// MARK: - TableView data source methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0: return toDoCount
            case 1: return completedCount
            default: return canceledCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        switch indexPath.section {
            case 0:
                cell.configure(
                    task: tasks[indexPath.row]
                )
            case 1:
                cell.configure(
                    task: tasks[indexPath.row + toDoCount]
                )
            default:
                cell.configure(
                    task: tasks[indexPath.row + completedCount + toDoCount]
                )
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        
        switch indexPath.section {
            case 0:
                detailViewController.selectedTask = tasks[indexPath.row]
            case 1:
                detailViewController.selectedTask = tasks[indexPath.row + toDoCount]
            default:
                detailViewController.selectedTask = tasks[indexPath.row + completedCount + toDoCount]
        }
        
        detailViewController.modalPresentationStyle = .fullScreen
        detailViewController.modalTransitionStyle = .crossDissolve
        
        self.present(detailViewController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { sections.count }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].uppercased()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        headerView.backgroundColor = .white
        
        let label = UILabel()
        let tmp = (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.08 * 0.6 + 20
        label.frame = CGRect.init(
            x: tmp,
            y: 5,
            width: headerView.frame.width - 10,
            height: headerView.frame.height - 10
        )
        label.text = sections[section].uppercased()
        switch section {
            case 0: label.text! += " (\(toDoCount))"
            case 1: label.text! += " (\(completedCount))"
            default: label.text! += " (\(canceledCount))"
        }
        label.font = UIFont(name: "GillSans-SemiBold", size: 14)
        label.textColor = .grayCustom
        
        headerView.addSubview(label)
        
        return headerView
    }
}

// MARK: TableView delegate methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.08
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
}

// MARK: - UI setup methods
private extension ViewController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(navigationView)
        navigationView.addSubview(calendarButton)
        navigationView.addSubview(searchButton)
        navigationView.addSubview(todoLabel)
        navigationView.addSubview(captionLabel)
        navigationView.addSubview(daysView)
        daysView.addSubview(yesterdayButton)
        daysView.addSubview(todayButton)
        daysView.addSubview(tomorrowButton)
        view.addSubview(mainTableView)
        view.addSubview(addView)
        addView.addSubview(addImage)
    }
    
    func setupConstraints() {
        navigationView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.height.equalToSuperview().multipliedBy(0.15)
            $0.width.equalToSuperview()
        }
        
        calendarButton.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.top)
            $0.bottom.equalTo(daysView.snp.top)
            $0.width.equalToSuperview().multipliedBy(0.15)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.top)
            $0.bottom.equalTo(daysView.snp.top)
            $0.width.equalToSuperview().multipliedBy(0.15)
            $0.right.equalTo(0)
        }
        
        todoLabel.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.top).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        captionLabel.snp.makeConstraints {
            $0.top.equalTo(todoLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        daysView.snp.makeConstraints {
            $0.width.bottom.equalToSuperview()
            $0.top.equalTo(captionLabel.snp.bottom).offset(15)
        }
        
        yesterdayButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.33)
            $0.centerY.equalToSuperview()
            $0.right.equalTo(todayButton.snp.left)
        }
        
        todayButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.33)
            $0.height.equalToSuperview().multipliedBy(0.75)
            $0.center.equalToSuperview()
        }
        
        tomorrowButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.33)
            $0.centerY.equalToSuperview()
            $0.left.equalTo(todayButton.snp.right)
        }
        
        mainTableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(navigationView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        addView.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.15)
            $0.height.equalTo(addView.snp.width)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-15)
        }
        
        addImage.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

    }
}
