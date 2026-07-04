//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Adilkhan on 4/6/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderHeight = 32
        tableView.dataSource = self
        tableView.delegate = self
    }


}


let words = [
    ["Apple", "Pear", "Watermelon"],
    ["Carrot", "Pickle", "Potato", "Tomato"],
    ["Strawberry","Raspberry","Blackberry","Blueberry"]
]
let headers = ["Fruits", "Vegetables", "Berries"]

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vegOrFruitArray = words[section]
        return vegOrFruitArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: nil,
                                      message: "Вы нажали на: \(words[indexPath.section][indexPath.row])",
                                      preferredStyle: .alert)                         // 1
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in             // 2
            alert.dismiss(animated: true)                                             // 3
        }
        alert.addAction(okAction)                                                     // 4
        present(alert, animated: true)                                                // 5
    }
}

