//
//  headerView.swift
//  githubExanple
//
//  Created by George Kyrylenko on 12/16/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class HeaderView: UIView {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeView()
    }
    
    func makeView(){
        Bundle.main.loadNibNamed("headerView", owner: self, options: nil)
        self.addSubview(headerView)
        headerView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self)
        }
    }
    
    func setData(user: UserModel){
        userName.text = "\(user.name ?? "No name") \n\(user.login ?? "No login")"
        guard let imgURL = user.avatarURL else {return}
        guard let url = URL(string: imgURL) else {return}
        userPhoto.kf.setImage(with: url)
    }
}
