//
//  UserInfoInteractor.swift
//  githubExanple
//
//  Created George Kyrylenko on 12/16/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import RxSwift
import Moya

class UserInfoInteractor: UserInfoInteractorProtocol {
    let disposeBag = DisposeBag()
    
    func logOut() {
        let defManager = CurrentUserDefaultsManager()
        defManager.cleanUserDefaults()
    }
    
    func getUserData() {
        let defManager = CurrentUserDefaultsManager()
        guard let user = defManager.getUserInfo() else {return}
        presenter?.setUserData(user: user)
        
        let userManager = UserManager()
        guard let key = defManager.getUserKey() else {return}
        userManager.getUser(key: key).subscribe(onNext: {[weak self] (user) in
            defManager.setUserInfo(user: user)
            self?.presenter?.setUserData(user: user)
        }, onError: { (error) in
            if let moyaError = error as? Moya.MoyaError{
                if moyaError.response?.statusCode == 401{
                    fastLogOut()
                }
            }
        }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    

    weak var presenter: UserInfoPresenterProtocol?
}