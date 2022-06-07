//
//  HomeScreen.swift
//  RecSuitmedia
//
//  Created by PUTRI RAHMADEWI on 05/06/22.
//

import UIKit

class HomeScreen: UIViewController {
    
    
    @IBOutlet weak var nme: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var finalName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
        //Capture Data
        nme.text = finalName
        
    }
    
    //Button Choose User
    @IBAction func btnChoose(_ sender: Any) {
        performSegue(withIdentifier: "segueToUser", sender: nil)
    }
    
}
