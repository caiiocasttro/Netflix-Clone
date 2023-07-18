//
//  DownloadsViewController.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 10.07.23.
//

import UIKit
import CoreData

class DownloadsViewController: UIViewController {
    
    //MARK: Proprieties
    private var titles: [TitleItem] = [TitleItem]()
    
    private var downloadTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        downloadTable.delegate = self
        downloadTable.dataSource = self
        fetchingLocalDataFromStorage()
        downloadTable.reloadData()
        
    }
    
    override func viewDidLayoutSubviews() {
        downloadTable.frame = view.bounds
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        
        //Setting title
        self.title = "Download"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        //Adding subview
        view.addSubview(downloadTable)

    }
    
    
    
    private func fetchingLocalDataFromStorage() {
        
        DataPersistenceManager.shared.fetchingDataFromDataBase { [weak self] result in
            
            switch result {
            case .success(let titles):
                self?.titles = titles
                self?.downloadTable.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}

extension DownloadsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else { return UITableViewCell() }
        
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "Unknown name", posterURL: title.poster_path ?? ""))
        
        return cell
                
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            DataPersistenceManager.shared.deleteTitleWith(model: titles[indexPath.row]) { [weak self] result in
                
                switch result {
                case .success():
                    print("Item deleted")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.titles.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            break
        }
    }
}
