//
//  MatchResumeTableViewCell.swift
//  MatchResume
//
//  Created by Jorge Mendoza on 12/5/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

import Foundation
import UIKit

class MatchResumeTableViewCell:UITableViewCell {
    
    var homeAmountLabel:UILabel!
    
    var awayAmountLabel:UILabel!
    
    var eventNameLabel:UILabel!
    
    var eventLogo:UIImageView!
    
    struct CellData {
        
        let homeCount:Int?
        
        let awayCount:Int?
        
        let eventName:String?
        
        let eventLogo:String?
    }
    
    var cellData:CellData? {
        
        didSet{
            
            homeAmountLabel.text = "\(cellData?.homeCount ?? 0)"
            
            awayAmountLabel.text = "\(cellData?.awayCount ?? 0)"
            
            eventNameLabel.text = cellData?.eventName ?? ""
            
            eventLogo.moa.url = cellData?.eventLogo
            
            eventLogo.moa.onSuccess = {image in return image}
        }
        
    }
    
    func createViews(){
        
        homeAmountLabel = UILabel()
        
        homeAmountLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        homeAmountLabel.textAlignment = .center
        
        homeAmountLabel.textColor = .black
        
        self.addSubview(homeAmountLabel)
        
        
        awayAmountLabel = UILabel()
        
        awayAmountLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        awayAmountLabel.textAlignment = .center
        
        awayAmountLabel.textColor = .black
        
        self.addSubview(awayAmountLabel)
        
        
        eventNameLabel = UILabel()
        
        eventNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        eventNameLabel.textAlignment = .center
        
        eventNameLabel.textColor = .black
        
        self.addSubview(eventNameLabel)
        
        
        eventLogo = UIImageView(image: UIImage(named: "gray-box"))
        
        eventLogo.contentMode = .scaleAspectFit
        
        self.addSubview(eventLogo)
        
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        homeAmountLabel.autoPinEdge(.top, to: .top, of: self, withOffset: 38.0)
        
        homeAmountLabel.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        homeAmountLabel.autoSetDimension(.width, toSize: 40.0)
        
        
        awayAmountLabel.autoPinEdge(.top, to: .top, of: self, withOffset: 38.0)
        
        awayAmountLabel.autoPinEdge(.right, to: .right, of: self, withOffset: -8.0)
        
        awayAmountLabel.autoSetDimension(.width, toSize: 40.0)
        
        
        eventLogo.autoPinEdge(.top, to: .top, of: self, withOffset: 8.0)
        
        eventLogo.autoPinEdge(.left, to: .right, of: homeAmountLabel, withOffset: 8.0)
        
        eventLogo.autoPinEdge(.right, to: .left, of: awayAmountLabel, withOffset: -8.0)
        
        eventLogo.autoSetDimension(.height, toSize: 40.0)
        
        
        eventNameLabel.autoPinEdge(.top, to: .bottom, of: eventLogo, withOffset: 5.0)
        
        eventNameLabel.autoPinEdge(.left, to: .left, of: self, withOffset: 95.0)
        
        eventNameLabel.autoPinEdge(.right, to: .right, of: self, withOffset: -95.0)
        
        eventNameLabel.autoSetDimension(.height, toSize: 40.0)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
