//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 2.05.2023.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders : [Order] = [
        .init(id: "id1", name: "Yusuf Mert Yıldız", dish: .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 24)),.init(id: "id1", name: "Talha İçöz", dish: .init(id: "id1", name: "Mantı", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 24)),.init(id: "id1", name: "Yasin Şahbaz", dish: .init(id: "id1", name: "Kokoreç", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 24))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        registerCells()
    }
     

    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}
extension ListOrdersViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
        
    }
}
