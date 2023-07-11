//
//  SearchViewController.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 11.07.23.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    //MARK: Proprieties
    public var titles: [Title] = [Title]()
    
    public var searchResultsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width / 3 - 5, height: 200)
        layout.minimumInteritemSpacing = 1
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collection
    }()

    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        
        //Adding subviews
        view.addSubview(searchResultsCollectionView)
        searchResultsCollectionView.frame = view.bounds
        
        
    }


}

//MARK: CollectionView delegate & dataSource
extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else { return UICollectionViewCell() }
        let titles = titles[indexPath.row]
        
        cell.configure(with: titles.poster_path ?? "")
        return cell
    }
    
    
}
