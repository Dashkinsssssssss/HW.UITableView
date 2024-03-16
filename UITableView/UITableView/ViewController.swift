//
//  ViewController.swift
//  UITableView
//
//  Created by Дарья on 14.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
private lazy var tableView = makeTableView()
    
    let progLanguages = [
    "Python",
    "Java",
    "JavaScript",
    "C++",
    "Ruby",
    "PHP",
    "Swift",
    "HTML",
    "CSS",
    "SQL"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView (_ tableview: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
       
        if indexPath.row < 10 {
            cell.textLabel?.text = "\(indexPath.row)"
            cell.detailTextLabel?.text = "Section: \(indexPath.section)"
        } else {
            let languageIndex = indexPath.row - 10
            cell.textLabel?.text = progLanguages[languageIndex]
        }
        
        return cell
    }
}

private extension ViewController {
    
    func setupUI() {
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func makeTableView() -> UITableView {
        let table =  UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        
        return table
    }
}
