//
//  API.swift
//
//  Generated usign MoyaPaw Export https://github.com/narlei/SwiftMoyaCodeGenerator.git

import Moya

public enum UserProvider {
    case Login(key: String)
    case UpdateInfo(key: String, user: EditUser)
}

extension UserProvider: TargetType {
    
    public var baseURL: URL { return URL(string: "https://api.github.com")! }
    
    public var path: String {
        switch self {
        case .Login, .UpdateInfo:
            return "/user"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .Login:
            return .get
        case .UpdateInfo:
            return .patch
        }
    }
    
    public var task: Task {
        switch self {
        case .Login:
            return .requestPlain
        case .UpdateInfo(_ , let user):
            return .requestJSONEncodable(user)
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .Login(let key), .UpdateInfo(let key, _):
            return ["Content-Type" : "application/json", "Authorization" : "Basic \(key)"]
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
}

