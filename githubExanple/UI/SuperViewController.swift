//
//  SuperViewController.swift
//  githubExanple
//
//  Created by George Kyrylenko on 12/16/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeTapToCloseKeyboard()
    }
    
    func makeTapToCloseKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc fileprivate func closeKeyboard(){
        view.endEditing(true)
    }
    
    public func isEmptyTF (_ textField: UITextField) -> Bool{
        
        guard textField.text?.isEmpty ?? true else {
            textField.layer.borderWidth = 0
            return false
        }
        
        let animation = CAKeyframeAnimation()
        
        let currentPosition = textField.center.x
        
        let pathArray = [currentPosition, currentPosition + 5, currentPosition - 5, currentPosition]
        
        animation.keyPath = "position.x"
        
        animation.values = pathArray
        
        animation.repeatCount = 2
        
        animation.duration = 0.15
        textField.layer.add(animation, forKey: "position")
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        UIView.animate(withDuration: 0.2, animations: {
            textField.layer.borderColor = UIColor.red.cgColor
        })
        
        return true
    }
    
    public func alertOK (text :String){
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil) }))
        self.present(alert, animated: true, completion: nil)
    }
}


func fastLogOut(){
    let defManager = CurrentUserDefaultsManager()
    defManager.cleanUserDefaults()
    let appDelegate = UIApplication.shared.delegate
    guard let window = appDelegate?.window! else {return}
    UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft, animations: {
        window.rootViewController = LoginRouter.createModule()
    }, completion: nil)
}
