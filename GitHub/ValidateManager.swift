//
//  ValidateManager.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation

enum AlamoError: Int, Error {
    case Unknown = 404
    case NoInternet = 401
    case AlamoFailure = 430
    case JSONReturnErro = 431
    case JSONNil = 432
    
    var message: String {
        
        switch self {
        case .Unknown:
            return "Aconteceu um erro desconhecido, Tente Novamente"
        case .NoInternet:
            return "Verifique sua conexão com a Internet."
        case .AlamoFailure:
            return "Alamofire request failed"
        case .JSONReturnErro:
            return "Json request returned error"
        case .JSONNil:
            return "Nenhum resultado foi encontrado"
        }
    }
    var _code: Int { return self.rawValue }
}


struct ErrorManager{
    static func message(error: Error) -> String{
        
        return ValidateManager.ValidateAlamofire(error: error as NSError)
    }
}



class ValidateManager{
    
    class func ValidateAlamofire(error: NSError) -> String {
        var message = ""
        
        switch error.code {
        case 3:
            message = "Não foi possivel acessar no momento"
            break
        case 4:
            message = "Verifique sua conexão com a Internet ou tente novamente mais tarde."
            break
        case -2102:
            message = "Verifique sua conexão com a Internet."
            break
        case -1009:
            message = "Verifique sua conexão com a Internet."
            break
        case 3840:
            message = "Serviço indisponível. Tente novamente mais tarde."
            break
        case -1001:
            message = "Verifique sua conexão com a Internet."
            break
        case AlamoError.NoInternet.rawValue:
            message = "Verifique sua conexão com a Internet."
            break
        case AlamoError.JSONReturnErro.rawValue:
            message = error.domain
            break
        case AlamoError.Unknown.rawValue:
            message = AlamoError.Unknown.message
            break
        case AlamoError.JSONNil.rawValue:
            message = AlamoError.JSONNil.message
            break
        default:
            print(error.code)
            message = "Verifique sua conexão com a Internet, ou tente novamente mais tarde."
            break
        }
        
        return message
    }
}
