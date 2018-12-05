//
//  TableViewHeader.swift
//  MatchResume
//
//  Created by Jorge Mendoza on 12/5/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

import Foundation
import UIKit
import PureLayout
import moa

class TableViewHeader:UIView {
    
    var homeTeamScoreLabel:UILabel!
    
    var awayTeamScoreLabel:UILabel!
    
    var homeTeamNameLabel:UILabel!
    
    var awayTeamNameLabel:UILabel!
    
    var homeTeamLogo:UIImageView!
    
    var awayTeamLogo:UIImageView!
    
    var centralImage:UIImageView!
    
    struct HeaderData {
        
        let homeScore:Int?
        
        let awayScore:Int?
        
        let homeName:String?
        
        let awayName:String?
        
        let homeLogo:String?
        
        let awayLogo:String?
        
    }
    
    var headerData:HeaderData? {
        
        didSet{
            
            self.homeTeamNameLabel.text = headerData?.homeName ?? ""
            
            self.awayTeamNameLabel.text = headerData?.awayName ?? ""
            
            self.homeTeamScoreLabel.text = "\(headerData?.homeScore ?? 0)"
            
            self.awayTeamScoreLabel.text = "\(headerData?.awayScore ?? 0)"
            
            self.homeTeamLogo.moa.url = headerData?.homeLogo
            
            self.awayTeamLogo.moa.url = headerData?.awayLogo
        }
    }
    
    
    func createViews(){
        
        homeTeamScoreLabel = UILabel()
        
        homeTeamScoreLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        homeTeamScoreLabel.textAlignment = .center
        
        homeTeamScoreLabel.textColor = .black
        
        self.addSubview(homeTeamNameLabel)
        
        
        awayTeamScoreLabel = UILabel()
        
        awayTeamScoreLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        awayTeamScoreLabel.textAlignment = .center
        
        awayTeamScoreLabel.textColor = .black
        
        self.addSubview(awayTeamScoreLabel)
        
        
        homeTeamNameLabel = UILabel()
        
        homeTeamNameLabel.font = UIFont.systemFont(ofSize: 12.0)
        
        homeTeamNameLabel.textAlignment = .center
        
        homeTeamNameLabel.numberOfLines = 3
        
        homeTeamNameLabel.textColor = .black
        
        self.addSubview(homeTeamNameLabel)
        
        
        awayTeamNameLabel = UILabel()
        
        awayTeamNameLabel.font = UIFont.systemFont(ofSize: 12.0)
        
        awayTeamNameLabel.textAlignment = .center
        
        awayTeamNameLabel.numberOfLines = 3
        
        awayTeamNameLabel.textColor = .black
        
        self.addSubview(awayTeamNameLabel)
        
        
        homeTeamLogo = UIImageView(image: UIImage(named: "empty-badge"))
        
        homeTeamLogo.contentMode = .scaleAspectFit
        
        self.addSubview(homeTeamLogo)
        
        
        awayTeamLogo = UIImageView(image: UIImage(named: "empty-badge"))
        
        awayTeamLogo.contentMode = .scaleAspectFit
        
        self.addSubview(awayTeamLogo)
        
        
        centralImage = UIImageView(image: UIImage(named: "vs"))
        
        centralImage.contentMode = .scaleAspectFit
        
        self.addSubview(centralImage)
        
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        let scoreSize = CGSize(width: 45.0, height: 35.0)
        
        let badgeSize = CGSize(width: 65.0, height: 65.0)
        
        
        homeTeamScoreLabel.autoPinEdge(.top, to: .top, of: self, withOffset: 16.0)
        
        homeTeamScoreLabel.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        homeTeamScoreLabel.autoSetDimensions(to: scoreSize)
        
        
        homeTeamLogo.autoPinEdge(.top, to: .top, of: homeTeamScoreLabel, withOffset: 8.0)
        
        homeTeamLogo.autoPinEdge(.left, to: .left, of: self, withOffset: 16.0)
        
        homeTeamLogo.autoSetDimensions(to: badgeSize)
        
        
        homeTeamNameLabel.autoPinEdge(.top, to: .top, of: homeTeamLogo, withOffset: 8.0)
        
        homeTeamNameLabel.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        homeTeamNameLabel.autoSetDimension(.width, toSize: 120.0)
        
        
        
        centralImage.autoPinEdge(.top, to: .top, of: self, withOffset: 24.0)
        
        centralImage.autoPinEdge(.left, to: .right, of: homeTeamLogo, withOffset: 24.0)
        
        centralImage.autoSetDimensions(to: badgeSize)
        
        
        awayTeamScoreLabel.autoPinEdge(.top, to: .top, of: self, withOffset: 16.0)
        
        awayTeamScoreLabel.autoPinEdge(.right, to: .left, of: self, withOffset: 8.0)
        
        awayTeamScoreLabel.autoSetDimensions(to: scoreSize)
        
        
        awayTeamLogo.autoPinEdge(.top, to: .top, of: awayTeamScoreLabel, withOffset: 8.0)
        
        awayTeamLogo.autoPinEdge(.left, to: .left, of: self, withOffset: 16.0)
        
        awayTeamLogo.autoSetDimensions(to: badgeSize)
        
        
        awayTeamNameLabel.autoPinEdge(.top, to: .top, of: awayTeamLogo, withOffset: 8.0)
        
        awayTeamNameLabel.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        awayTeamNameLabel.autoSetDimension(.width, toSize: 120.0)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
