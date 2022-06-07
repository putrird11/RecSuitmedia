//
//  ListUser.swift
//  RecSuitmedia
//
//  Created by PUTRI RAHMADEWI on 07/06/22.
//


import UIKit

class ListUser: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
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
            action: #selector(maps))
    }
    
    @objc func maps() {
        performSegue(withIdentifier: "map", sender: nil)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomeCell", for: indexPath) as! CustomeCell
        
        let show = users[indexPath.row]
        
        let urlString = show.avatar
        let url = URL(string: urlString)
        cell.avatarImg.setRounded()
        cell.avatarImg.downloaded(from: url!)
        cell.nameLbl?.text = show.first_name + " " + show.last_name
        cell.emailLbl?.text = show.email
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
}


