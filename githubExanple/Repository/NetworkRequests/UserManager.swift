//
//  UserManager.swift
//  githubExanple
//
//  Created by George Kyrylenko on 12/16/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class UserManager {
    let provider = MoyaProvider<UserProvider>()
    
    func loginUser(login: String, password: String) -> Observable<UserModel>{
        let loginPassword = "\(login):\(password)"
        return provider.rx.request(.Login(key: loginPassword.toBase64())).retry(5).filterSuccessfulStatusCodes().map(UserModel.self).asObservable().share()
    }
    
    func getUser(key: String) -> Observable<UserModel>{
        return provider.rx.request(.Login(key: key)).retry(5).filterSuccessfulStatusCodes().map(UserModel.self).asObservable().share()
    }
    
    func updateUser(key: String, user: EditUser) -> Observable<Response>{
        return provider.rx.request(.UpdateInfo(key: key, user: user)).retry(5).filterSuccessfulStatusCodes().asObservable().share()
    }
}
