//
//  ListCollectionViewCell.swift
//  ReadingBooks2
//
//  Created by 강태영 on 5/10/24.
//

import UIKit
import SnapKit

class ListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ListCollectionViewCell.self)
    
    let bookThumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let bookTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    let bookAuthors: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [bookThumbnail, bookTitle, bookAuthors].forEach { subview in
            contentView.addSubview(subview)
        }
        
        bookThumbnail.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(100) // Adjust thumbnail height as needed
        }
        
        bookTitle.snp.makeConstraints { make in
            make.top.equalTo(bookThumbnail.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }
        
        bookAuthors.snp.makeConstraints { make in
            make.top.equalTo(bookTitle.snp.bottom).offset(4)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
