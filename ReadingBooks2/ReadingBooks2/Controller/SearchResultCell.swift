//
//  SearchResultCell.swift
//  ReadingBooks2
//
//  Created by 강태영 on 5/10/24.
//
import UIKit
import SnapKit

class SearchResultCell: UICollectionViewCell {
    
    static let identifier = "SearchResultCell"
    
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(8)
        }
        
        authorLabel.numberOfLines = 1
        authorLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.lessThanOrEqualToSuperview().inset(8)
        }
    }
    
    func configure(with book: Document) {
        titleLabel.text = book.title
        authorLabel.text = book.authors.joined(separator: ", ")
    }
}
