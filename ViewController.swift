//
//  ViewController.swift
//  TodoList
//
//  Created by 강태영 on 2024/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var todoList : [String] = ["부자되기", "여행가기", "연애하기"]
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.backgroundColor = .blue
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    @IBAction func addButton(_ sender: Any) {
            let addButton = UIButton(type: .system)
            addButton.setTitle("+", for: .normal)
            addButton.setTitleColor(UIColor.black, for: .normal)
            addButton.frame = CGRect(x: 150, y: 100, width: 20, height: 20)
            addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
            self.view.addSubview(addButton)
        }

        @objc func addButtonTapped() {
            let newList = "todoList \(todoList.count + 1)"
            todoList.append(newList)
            
        }
    
    @IBAction func myfirstSwitch(_ sender: Any) {
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        cell.textLabel?.text = todoList[indexPath.row]
        return cell
    }
    
}
