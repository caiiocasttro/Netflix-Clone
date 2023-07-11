//
//  UpcomingViewController.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 10.07.23.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    //MARK: Proprieties
    private var titles: [Title] = [Title]()
    
    private var upcomingTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        fetchData()
    }
    

    //MARK: Configuring layout
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        self.title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        //Adding subview
        view.addSubview(upcomingTable)
        upcomingTable.frame = view.bounds
    }
    
    private func fetchData() {
        APICaller.shared.gettingUpcoming { result in
            switch result {
            case .success(let titles):
                self.titles = titles
                DispatchQueue.main.async { [weak self ] in
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
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
    
}
