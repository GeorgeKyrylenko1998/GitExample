//
//  ViewController.swift
//  githubExanple
//
//  Created by George Kyrylenko on 12/16/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userManager = CurrentUserDefaultsManager()
        if userManager.getUserKey() == nil {
            self.present(LoginRouter.createModule(), animated: true, completion: nil)
        } else {
            self.present(UserInfoRouter.createModuleWithNav(), animated: true, completion: nil)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

