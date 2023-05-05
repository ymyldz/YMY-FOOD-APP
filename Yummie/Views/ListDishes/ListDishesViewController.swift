//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 2.05.2023.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dishes : [Dish] = [
        
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 24),
        .init(id: "id1", name: "Indomie", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 324),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 1024),
    ]
    var category : DishCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
        registerCells()
    }
   
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
}
extension ListDishesViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contoller = DishDetailViewController.instantiate()
        contoller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(contoller, animated: true)
    }
}
