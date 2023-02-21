//
//  ViewController.swift
//  Task-21-2-23
//
//  Created by Sejal on 21/02/23.
//

import UIKit

class TableViewController: UIViewController {
    var product : [Products] = []
    
    @IBOutlet weak var productTableviewcontroller: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUsersFromApi()
        
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        productTableviewcontroller.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        
        productTableviewcontroller.delegate = self
        productTableviewcontroller.dataSource = self
        
    }
    
    func fetchUsersFromApi(){
        
            let url = URL(string: "https://dummyjson.com/products")!
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let urlSession = URLSession(configuration: .default)
            
            let dataTask = urlSession.dataTask(with: request) { data, response, error in
                print(String(data: data!, encoding: .utf8)!)
                         
                let decoder = JSONDecoder()
                let root: Roots = try! decoder.decode(Roots.self, from: data!)
                
                self.product = root.products
                
                DispatchQueue.main.async {
                    self.productTableviewcontroller.reloadData()
                }
            }
            
            dataTask.resume()
        }
        
    }


extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        product.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = product[indexPath.row]
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        viewController.product = selectedProduct
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        let product = product[indexPath.row]
        cell.celLTitleLabel.text = product.title
        cell.decriptionLabel.text = product.description
        cell.priceLabel.text = "\(product.price)"
        cell.brandLabel.text = product.brand
        
        return cell
    }
    
    
}

        
