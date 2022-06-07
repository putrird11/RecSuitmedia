//
//  UserScreen.swift
//  RecSuitmedia
//
//  Created by PUTRI RAHMADEWI on 05/06/22.
//

import UIKit

class UserScreen: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    

    @IBOutlet weak var tableView: UITableView!
    var users = [userdata1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
           codablegetservice()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        
        //MARK: Modify Navigation bar
        
        //Delete text back
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //Change Colour
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.17, green: 0.39, blue: 0.48, alpha: 1.00)]
        
        

        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        navigationController?.navigationBar.tintColor = UIColor(red: 0.17, green: 0.39, blue: 0.48, alpha: 1.00)
        
        configureItems()
        
    }
    
    private func configureItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "ic_show_map"),
            style: .plain,
            target: self,
            action: nil
        )
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UserScreenTwo {
            destination.user = users[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")

        
        
        let show = users[indexPath.row]
        cell.textLabel?.text = show.first_name + " " + show.last_name
        cell.detailTextLabel?.text = show.email
        
        let urlString = show.avatar
        let url = URL(string: urlString)
        cell.imageView?.downloaded(from: url!)
     
       
        
        cell.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 40, leading: 16, bottom: 16, trailing: 16)
        return cell
    }


    func codablegetservice(){
        let url = URL(string: "https://reqres.in/api/users?page=1&per_page=10")!
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    guard let data = data else { return }
                    do{
                        let jsonDataModels = try JSONDecoder().decode(User1.self, from: data)
                    
                        print(jsonDataModels)
                        DispatchQueue.main.async{
                        
                        self.users = jsonDataModels.data
                        self.tableView.reloadData()
                        }
                    }catch{}
                }
                task.resume()
    }
    

    @IBAction func unwindTo(_ sender: UIStoryboardSegue){
    }
//
    
    
    
}
        
