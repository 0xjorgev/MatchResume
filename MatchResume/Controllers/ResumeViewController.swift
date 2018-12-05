//
//  ResumeViewController.swift
//  MatchResume
//
//  Created by Jorge Mendoza on 12/5/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

import Foundation

class ResumeViewController:GenericUITableViewController<EventResume, MatchResumeTableViewCell>{
    
    var matchId:String?
    
    let tags = ["#GOL", "#REDCARD", "#YELLOWCARD", "#AGOL", "#CHANGE"]
    
    override func getData() {
        
        guard let id = self.matchId else { return }
        
        Service.shared.getMatchResume(matchId: id) { (response, error) in
            
            if error == nil {
                
                print("Response Result: \(response)")
                
                let arr = response?.data
                
                for tag in self.tags {
                    
                    let val:EventResume = self.dataProcess(x: tag)(arr ?? [])
                    self.items?.append(val)
                }
                
                //self.items = response?.data
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
        
    }
    
}

extension ResumeViewController {
    
    func dataProcess(x: String) -> ([MatchPlayerEvent]) -> EventResume {
        return { xs in
            
            let homeId = xs.first?.matchID?.homeTeamID
            
            let awayId = xs.first?.matchID?.visitorTeamID
            
            let name = xs.first?.event?.name
            
            let url = xs.first?.event?.imgURL
            
            //Filtered by event Tag
            let arr = xs.filter{ $0.event?.code == x }
            
            let home = self.processEventTeam(x: homeId ?? 0)(arr)
            
            let away = self.processEventTeam(x: awayId ?? 0)(arr)
            
            return EventResume.init(home: home, away: away, name: name, logo: url)
        }
    }
    
    func processEventTeam(x:Int) -> ([MatchPlayerEvent]) -> Int? {
        return { xs in
            //Filtered by event Team
            return xs.filter{ $0.teamID == x }.map{ ($0.event?.incrementsBy ?? 0) * 1 }.reduce(0, +)
            
        }
    }
}
