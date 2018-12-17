//
//  BlueButton.swift
//  githubExanple
//
//  Created by George Kyrylenko on 12/16/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit

class BlackButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeButton()
    }
    
    func makeButton(){
        self.backgroundColor = .black
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 5
    }
}
