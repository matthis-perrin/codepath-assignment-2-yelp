//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MBProgressHUD

// TODO(matthis) - Use extension
class BusinessesViewController: UIViewController, UITableViewDelegate, FilterViewControllerDelegate {

    private var businesses: [Business]!
    private var search: YelpSearch = YelpSearch()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 120
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Restaurants"
        searchBar.sizeToFit()
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        
        self.doSearch()
    }
    
    func doSearch(showHUD: Bool = false) -> Void {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        Business.search(self.search, completion: { (businesses: [Business]!, error: NSError!) in
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            self.businesses = businesses
            self.tableView.reloadData()
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "filtersButtonAction" {
                if let nav = segue.destinationViewController as? UINavigationController {
                    if let dest = nav.viewControllers[0] as? FiltersViewController {
                        dest.filterDelegate = self
                        dest.updateSearch(self.search)
                    }
                }
            }
        }
    }
    
    func filtersDidUpdate(filters: YelpSearch) {
        self.search = filters
        doSearch()
    }
    
    func _getBusinesses() -> [Business] {
        if let all = self.businesses {
            return all
        } else {
            return []
        }
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        code
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BusinessesViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as! BusinessTableViewCell
        cell.updateBusiness(_getBusinesses()[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _getBusinesses().count
    }
    
}

extension BusinessesViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.search.term = searchBar.text
        self.doSearch()
        searchBar.resignFirstResponder()
    }
}
