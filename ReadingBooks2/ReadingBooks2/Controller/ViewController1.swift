//
//  ViewController1.swift
//  ReadingBooks2
//
//  Created by 강태영 on 5/9/24.
//
import UIKit
import SnapKit

class ViewController1: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {

    let searchBar = UISearchBar()
    lazy var searchResultsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var searchResults: [Document] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSearchBar()
        setupSearchResultsCollectionView()
        
        searchBar.delegate = self
    }
    
    func setupSearchBar() {
        searchBar.placeholder = "Search"
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
    }
    
    private func setupSearchResultsCollectionView() {
        view.addSubview(searchResultsCollectionView)
        searchResultsCollectionView.backgroundColor = .clear
        searchResultsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        searchResultsCollectionView.dataSource = self
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.identifier)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.identifier, for: indexPath) as! SearchResultCell
        let data = searchResults[indexPath.item]
        cell.configure(with: data)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.data = searchResults[indexPath.item]
        present(detailVC, animated: true, completion: nil)
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        NetworkManager.shared.searchBooks(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let books):
                        self?.searchResults = books
                        self?.searchResultsCollectionView.reloadData()
                    case .failure(let error):
                        print("Error searching books: \(error)")
                }
            }
        }
    }
}
