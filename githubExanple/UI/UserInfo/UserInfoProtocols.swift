//
//  UserInfoProtocols.swift
//  githubExanple
//
//  Created George Kyrylenko on 12/16/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol UserInfoWireframeProtocol: class {
    
}
//MARK: Presenter -
protocol UserInfoPresenterProtocol: class {
    
    func getUserData()
    func setUserData(user: UserModel)
    func logOut()
}

//MARK: Interactor -
protocol UserInfoInteractorProtocol: class {
    
    var presenter: UserInfoPresenterProtocol?  { get set }
    func getUserData()
    func logOut()
}

//MARK: View -
protocol UserInfoViewProtocol: class {
    
    var presenter: UserInfoPresenterProtocol?  { get set }
    func setUserData(user: UserModel)
}
