//
//  ViewController.swift
//  WishListAppLast
//
//  Created by 강태영 on 4/19/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    private var randomNumber: Int? {
        get {
            
            (1...100).randomElement()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.fetchRemoteProduct()
        
    }
    @IBAction func didTapAnotherItem(_ sender: Any) {
        
        fetchRemoteProduct()
    }
    
       
    private func fetchRemoteProduct(){
        if let id = randomNumber,
        let url = URL(string: "https://dummyjson.com/products/\(id)")
        {
                    
            
                    let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                
                if let error = error {
                    //MARK: 에러처리
                
                }
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode)
                else{
                    //MARK: 에러 등 기타처리
                    return
                }
                
                if let data = data,
                   let product = try? JSONDecoder().decode(RemoteProduct.self, from: data) {
                   
                    DispatchQueue.main.async{
                        
                        self?.titleLabel.text = product.title
                        self?.descLabel.text = product.description
                        self?.priceLabel.text = "\(product.price)"
                        
                    }
                    
                    
                    let imagerequest = URLRequest(url: product.thumbnail)
                    
                    let imageDataTask = URLSession.shared.dataTask(with: imagerequest) { data, response, error in
                        
                        if let error = error {
                            //MARK: 에러처리
                        
                        }
                        guard let response = response as? HTTPURLResponse,
                              (200...299).contains(response.statusCode)
                        else{
                            //MARK: 에러 등 기타처리
                            return
                        }
                        
                        if let data = data{
                            
                            DispatchQueue.main.async{
                                let image = UIImage(data: data)
                                self?.imageView.image = image
                            }
                        }
                        
                    }
                    
                    
                }
            }
            
            task.resume()
        }
        
        

    }
}

