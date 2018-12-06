//
//  GenericTableViewController.swift
//  MatchResume
//
//  Created by Jorge Mendoza on 12/5/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

import Foundation
import UIKit

class GenericUITableViewController<T, Cell: UITableViewCell>: UITableViewController {
    
    var items: [T]? {
        didSet {
            OperationQueue.main.addOperation { self.tableView.reloadData() }
        }
    }
    
    var configure: ((Cell, T?) -> Void)?
    
    var selectHandler: ((T?) -> Void)?
    
    var identifier:String?
    
    var header:UIView?
    
    var sectionTitle:String?
    
    
    
    init(items: [T], identifier:String, configure: @escaping (Cell, T?) -> Void, selectHandler: @escaping (T?) -> Void, sectionTitle:String?) {
        
        self.items = items
        
        self.configure = configure
        
        self.selectHandler = selectHandler
        
        self.identifier = identifier
        
        self.sectionTitle = sectionTitle
        
        super.init(style: .plain)
        
        self.tableView.register(Cell.self, forCellReuseIdentifier: identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        customizeTableViewHeader()
        
        getData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier!, for: indexPath) as! Cell
        
        let item = items?[indexPath.row]
        
        configure?(cell, item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items?[indexPath.row]
        
        selectHandler?(item!)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func getData(){}
    
    open func customizeTableViewHeader(){
        
    }
    
}
