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
    
    let session = URLSession.shared
    
    func getMatchResume(matchId:String, handler: @escaping (RequestResponse?, Error?) -> Void ){
        
        let url = URL(string: "https://dsa-core.herokuapp.com/api/v1.0/match/\(matchId)/event")
        
        let dataTask = session.dataTask(with: url!) {
            (data, response, error) in
            
            guard let responseData = data else {
                handler(nil, error)
                return
            }
            
            guard error == nil else {
                handler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                //print("jsonData: ", String(data: data!, encoding: .utf8) ?? "no body data")
                let time = try decoder.decode(RequestResponse.self, from: responseData)
                handler(time, nil)
            } catch {
                print("error trying to convert data to JSON")
                print(error)
                handler(nil, error)
            }
        }
        
        dataTask.resume()
    }
}
