//
//  DetailViewController.swift
//  ReadingBooks2
//
//  Created by 강태영 on 5/9/24.
//
import SwiftUI
import UIKit
import SnapKit

class DetailViewController: UIViewController {

    var data: Document?
    let titleLabel = UILabel()
    let imageView = UIImageView(image: UIImage(named: "titleImage"))
    let detailScrollView = UIScrollView()
    let plusButton = UIButton()
    let cancelButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = data {
        
        }
    }
    func setupNameLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().offset(20)
            make.height.equalTo(77)
        }
    }
    func setupImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().offset(20)
        }
    }
    func setupDetailScrollView() {
        view.addSubview(detailScrollView)
        detailScrollView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().offset(10)
        }
    }
    func setupPlusButton() {
        view.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(detailScrollView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(20)
            make.width.equalTo(cancelButton.snp.width)
        }
    }
    func setupCancelButton() {
        view.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(detailScrollView.snp.bottom).offset(20)
            make.leading.equalTo(plusButton.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(20)
        }
    }
}

