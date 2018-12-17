//
//  LoginInteractor.swift
//  githubExanple
//
//  Created George Kyrylenko on 12/16/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import RxSwift

class LoginInteractor: LoginInteractorProtocol {
    
    weak var presenter: LoginPresenterProtocol?
    let disposeBag = DisposeBag()
    
    func loginUser(login: String, password: String) {
        let userManager = UserManager()
        userManager.loginUser(login: login, password: password).subscribe(onNext: {[weak self] (user) in
            self?.presenter?.loginOK()
            let defManager = CurrentUserDefaultsManager()
            defManager.setUserKey(key: "\(login):\(password)".toBase64())
            defManager.setUserInfo(user: user)
            }, onError: {[weak self] (error) in
                self?.presenter?.showMessage(message: error.localizedDescription)
            }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
}