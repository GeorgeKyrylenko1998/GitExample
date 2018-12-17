//
//  CurrentUserDefaults.swift
//  githubExanple
//
//  Created by George Kyrylenko on 12/16/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation

class CurrentUserDefaultsManager{
    let userKey = "userKey"
    let userDataKey = "userData"
    
    let defaults = UserDefaults.standard
    
    func setUserKey(key: String){
        defaults.setValue(key, forKey: userKey)
    }
    
    func getUserKey() -> String?{
        let key = defaults.string(forKey: userKey)
        return key
    }
    
    func setUserInfo(user: UserModel){
        do{
            let userData = try JSONEncoder().encode(user)
            defaults.setValue(userData, forKey: userDataKey)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getUserInfo() -> UserModel?{
        do{
            let dataOptional = defaults.data(forKey: userDataKey)
            guard let data = dataOptional else {return nil}
            let user = try JSONDecoder().decode(UserModel.self, from: data)
            return user
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func cleanUserDefaults(){
        defaults.setValue(nil, forKey: userKey)
        defaults.setValue(nil, forKey: userDataKey)
    }
}
