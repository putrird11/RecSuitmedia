//
//  UserScreenTwo.swift
//  RecSuitmedia
//
//  Created by PUTRI RAHMADEWI on 06/06/22.
//

import UIKit

extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class UserScreenTwo: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTitle: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    var user: userdata1?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.setRounded()

        let fName = user?.first_name
        let lName = user?.last_name
        nameLabel.text = (fName!) + " " + (lName)!
        emailLabel.text = user?.email
        let urlString = user?.avatar
        let url = URL(string: urlString!)
        nameTitle.text = (fName!) + " " + (lName)!
        avatar.downloaded(from: url!)
        
    }
    
    @IBAction func btn(_ sender: Any) {
        performSegue(withIdentifier: "back", sender: nil)
    }
    
    @IBAction func webBtn(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func websiteBtn(_ sender: Any) {
        performSegue(withIdentifier: "web", sender: nil)
    }
}

