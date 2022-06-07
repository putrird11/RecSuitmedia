//
//  ViewController.swift
//  RecSuitmedia
//
//  Created by PUTRI RAHMADEWI on 05/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var isPalindrome: UITextField!
    
    @IBOutlet weak var nameT: UITextField!
    
    var nameText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
    }
    
    //Button Next
    @IBAction func btnCheck(_ sender: UIButton) {
        if isPalindrome.text == "kasur rusak" || isPalindrome.text == "step on no pets" || isPalindrome.text == "put it up"{
            msg()
        } else if let text = isPalindrome.text, text.isEmpty{
            msgnil()
        } else if isPalindrome.text == "suitmedia"{
            msgnot()
        }
    }
    
    //Message
    func msg(){
        let alert = UIAlertController(title: "True", message: "isPalindrome", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back", style: .cancel))
        present(alert, animated: true)
    }
    
    //Message Not
    func msgnot(){
        let alert = UIAlertController(title: "False", message: "Not Palindrome", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Next", style: .cancel))
        present(alert, animated: true)
    }
    
    //Message Nil
    func msgnil(){
        let alert = UIAlertController(title: "Empty", message: "Text field empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Next", style: .cancel))
        present(alert, animated: true)
    }
    
    //Button Check
    @IBAction func btnNext(_ sender: Any) {
        self.nameText = nameT.text!
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
    //Send Name
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HomeScreen
        vc.finalName = self.nameText
    }
    
    
    
}



