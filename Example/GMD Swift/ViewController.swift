//
//  ViewController.swift
//  GMD Swift
//
//  Created by Patrik Vaberer on 8/29/15.
//  Copyright © 2015 Patrik Vaberer. All rights reserved.
//

//
//  ViewController.swift
//  Google Material Design Icons Swift
//
//  Created by Patrik Vaberer on 7/13/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bGithub: UIBarButtonItem!
    @IBOutlet weak var bTwitter: UIBarButtonItem!
    var filteredData = [String]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.delegate = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.barTintColor = UIColor.blue
            controller.searchBar.placeholder = "Type Icon Name"
            self.tableView.tableHeaderView = controller.searchBar
            return controller
        })()
        
        bGithub.GMDIcon = GMDType.gmdPublic
        bTwitter.GMDIcon = GMDType.gmdPerson


    
    }
    
    
    //MARK: UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let c = tableView.dequeueReusableCell(withIdentifier: "IconCell") as! IconCell
        
        c.lFont.text = resultSearchController.isActive ? filteredData[indexPath.row] : helper[indexPath.row]
        
        let index = resultSearchController.isActive ? helper.index(of: filteredData[indexPath.row])! : indexPath.row
        
        let icon = GMDType.allValues[index]
        
        c.lSmall.GMDIcon = icon
        c.lMedium.GMDIcon = icon
        c.lBig.GMDIcon = icon
        
        return c
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultSearchController.isActive ? filteredData.count :  GMDType.count
    }
    
    
    //MARK: Search
    func updateSearchResults(for searchController: UISearchController)
    {
        filteredData = []
        filterContentForSearchText(searchController.searchBar.text!.lowercased())
        self.tableView.reloadData()
    }
    
    @IBAction func bGithubPressed(_ sender: UIBarButtonItem) {
        
        if let requestUrl = URL(string: "https://github.com/Vaberer/Google-Material-Design-Icons-Swift") {
            UIApplication.shared.openURL(requestUrl)
        }
    }
    
    @IBAction func bTwitterPressed(_ sender: UIBarButtonItem) {
        
        if let twitterURL = URL(string: "twitter://user?id=2271666416") {
            
            if UIApplication.shared.canOpenURL(twitterURL) {
                
                UIApplication.shared.openURL(twitterURL)
            }
        }
    }
    
    //MARK: Helpers
    func filterContentForSearchText(_ searchText: String) {
        
        for f in helper {
            if f.lowercased().range(of: searchText.lowercased()) != nil {
                filteredData.append(f)
            }
        }
    }
    
    let helper = GMDType.cases().map { (item) -> String in
        return "\(item)"
    }

}
