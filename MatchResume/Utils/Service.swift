//
//  Service.swift
//  MatchResume
//
//  Created by Jorge Mendoza on 12/5/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

import Foundation

class Service:NSObject {
    
    static let shared = Service()
    
    func getMatchResume(matchId:String, handler: @escaping (String?, Error?) -> Void ){
        
        let url = "https://dsa-core.herokuapp.com/api/v1.0/match/\(matchId)/event"
    }
}
