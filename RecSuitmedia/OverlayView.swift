//
//  OverlayView.swift
//  SlideOverTutorial
//
//  Created by PUTRI RAHMADEWI on 07/06/22.
//

import UIKit


class OverlayView: UIViewController {
    
    var buttonrr = UIButton()
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slideIndicator: UIView!
    @IBOutlet weak var NameUser: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideIndicator.roundCorners(.allCorners, radius: 10)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }

        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 6000, y: 400)
                }
            }
        }
    }
    
    @IBAction func btnSelect(_ sender: Any) {
       
    }
    
}
