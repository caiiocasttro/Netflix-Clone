//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 10.07.23.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    //MARK: Initializers
    private var titleHeader = ModelArray.headerTitles
    
    //MARK: Proprieties
    private var randomTrendingMovies: Title?
    
    private var headerView: HeaderHeroUIView?
    
    private var HomeFeedTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()

    //MARK: Page Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLayout()
        HomeFeedTable.delegate = self
        HomeFeedTable.dataSource = self

    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        //Adding subview
        view.addSubview(HomeFeedTable)
        
        //Adding frame
        HomeFeedTable.frame = view.bounds
        
        //Adding header
        headerView = HeaderHeroUIView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 500))
        HomeFeedTable.tableHeaderView = headerView
        configureHeaderView()
        
        //Configuring navigationBar buttons
        var logo = UIImage(named: "netflix")
        logo = logo?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logo, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    private func configureHeaderView() {
        
        APICaller.shared.gettingTrendingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                print("success")
                let selectedTitle = titles.randomElement()
                    self?.randomTrendingMovies = selectedTitle
                    self?.headerView?.configure(with: TitleViewModel(titleName: selectedTitle?.original_title ?? "", posterURL: selectedTitle?.poster_path ?? ""))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}

//MARK: TableView Delegate & DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleHeader.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        
        cell.delegate = self
        
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            APICaller.shared.gettingTrendingMovies { result in
                switch result {
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TrendingTv.rawValue:
            APICaller.shared.gettingTrendingTv { result in
                switch result {
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Popular.rawValue:
            APICaller.shared.gettingPopular { result in
                switch result {
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Upcoming.rawValue:
            APICaller.shared.gettingUpcoming { result in
                switch result {
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TopRated.rawValue:
            APICaller.shared.gettingTopRated { result in
                switch result {
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffeset = view.safeAreaInsets.top
        let offeset = scrollView.contentOffset.y + defaultOffeset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offeset))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleHeader[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = .init(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizaFirstLetter()
    }
}

//MARK: CollectionViewTableViewCellDelegate
extension HomeViewController: CollectionViewTableViewCellDelegate {
    func CollectionViewTableViewCellDidTapped(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel) {
        DispatchQueue.main.async { [weak self] in
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
}
