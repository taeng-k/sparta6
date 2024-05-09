//
//  ViewController2.swift
//  ReadingBooks2
//
//  Created by 강태영 on 5/9/24.
//

import UIKit
import SnapKit

class ViewController2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let wishLabel = UILabel()
    let wishListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let deleteButton = UIButton()
    let addButton = UIButton()
    let wishList: [Document] = [] // 데이터 모델은 여기에 정의되어 있다고 가정합니다
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupWishLabel()
        setupWishListCollectionView()
        setupDeleteButton()
    }
    
    func setupWishLabel() {
        view.addSubview(wishLabel)
        wishLabel.backgroundColor = .green
        wishLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().offset(20)
            make.height.equalTo(30)
        }
    }
    
    func setupWishListCollectionView() {
        view.addSubview(wishListCollectionView)
        wishListCollectionView.backgroundColor = .blue
        wishListCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(20)
            make.top.equalTo(wishLabel.snp.bottom).offset(15)
            make.height.equalTo(200) // 콜렉션 뷰 높이 설정
        }
        
        wishListCollectionView.dataSource = self
        wishListCollectionView.delegate = self
        // Register WishListCell instead of ListCollectionViewCell
        wishListCollectionView.register(WishListCell.self, forCellWithReuseIdentifier: WishListCell.identifier)
    }
    
    func setupDeleteButton() {
        view.addSubview(deleteButton)
        deleteButton.backgroundColor = .black
        deleteButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(20)
            make.top.equalTo(wishListCollectionView.snp.bottom)
            make.height.equalTo(50) // 버튼 높이 설정
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wishList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WishListCell.identifier, for: indexPath) as! WishListCell
        cell.configure(with: wishList[indexPath.item])
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 각 셀의 크기를 조정합니다
        return CGSize(width: collectionView.bounds.width, height: 120)
    }
}
