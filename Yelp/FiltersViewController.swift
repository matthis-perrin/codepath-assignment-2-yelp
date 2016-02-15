//
//  SettingsViewController.swift
//  Yelp
//
//  Created by Matthis Perrin on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

let SECTION_TITLES = ["", "Distance", "Sort By", "Category"]

let DISTANCE_VALUES: [Float?] = [nil, 480, 1609, 8046, 32186]
let DISTANCE_LABELS: [String] = ["Auto", "0.3 miles", "1 mile", "5 miles", "20 miles"]

let SORT_VALUES: [YelpSortMode] = [.BestMatched, .Distance, .HighestRated]
let SORT_LABELS: [String] = ["Best Match", "Distance", "Rating"]

let CATEGORIES: [[String: String]] = [["name" : "Afghan", "code": "afghani"], ["name" : "African", "code": "african"], ["name" : "American, New", "code": "newamerican"], ["name" : "American, Traditional", "code": "tradamerican"], ["name" : "Arabian", "code": "arabian"], ["name" : "Argentine", "code": "argentine"], ["name" : "Armenian", "code": "armenian"], ["name" : "Asian Fusion", "code": "asianfusion"], ["name" : "Asturian", "code": "asturian"], ["name" : "Australian", "code": "australian"], ["name" : "Austrian", "code": "austrian"], ["name" : "Baguettes", "code": "baguettes"], ["name" : "Bangladeshi", "code": "bangladeshi"], ["name" : "Barbeque", "code": "bbq"], ["name" : "Basque", "code": "basque"], ["name" : "Bavarian", "code": "bavarian"], ["name" : "Beer Garden", "code": "beergarden"], ["name" : "Beer Hall", "code": "beerhall"], ["name" : "Beisl", "code": "beisl"], ["name" : "Belgian", "code": "belgian"], ["name" : "Bistros", "code": "bistros"], ["name" : "Black Sea", "code": "blacksea"], ["name" : "Brasseries", "code": "brasseries"], ["name" : "Brazilian", "code": "brazilian"], ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"], ["name" : "British", "code": "british"], ["name" : "Buffets", "code": "buffets"], ["name" : "Bulgarian", "code": "bulgarian"], ["name" : "Burgers", "code": "burgers"], ["name" : "Burmese", "code": "burmese"], ["name" : "Cafes", "code": "cafes"], ["name" : "Cafeteria", "code": "cafeteria"], ["name" : "Cajun/Creole", "code": "cajun"], ["name" : "Cambodian", "code": "cambodian"], ["name" : "Canadian", "code": "New)"], ["name" : "Canteen", "code": "canteen"], ["name" : "Caribbean", "code": "caribbean"], ["name" : "Catalan", "code": "catalan"], ["name" : "Chech", "code": "chech"], ["name" : "Cheesesteaks", "code": "cheesesteaks"], ["name" : "Chicken Shop", "code": "chickenshop"], ["name" : "Chicken Wings", "code": "chicken_wings"], ["name" : "Chilean", "code": "chilean"], ["name" : "Chinese", "code": "chinese"], ["name" : "Comfort Food", "code": "comfortfood"], ["name" : "Corsican", "code": "corsican"], ["name" : "Creperies", "code": "creperies"], ["name" : "Cuban", "code": "cuban"], ["name" : "Curry Sausage", "code": "currysausage"], ["name" : "Cypriot", "code": "cypriot"], ["name" : "Czech", "code": "czech"], ["name" : "Czech/Slovakian", "code": "czechslovakian"], ["name" : "Danish", "code": "danish"], ["name" : "Delis", "code": "delis"], ["name" : "Diners", "code": "diners"], ["name" : "Dumplings", "code": "dumplings"], ["name" : "Eastern European", "code": "eastern_european"], ["name" : "Ethiopian", "code": "ethiopian"], ["name" : "Fast Food", "code": "hotdogs"], ["name" : "Filipino", "code": "filipino"], ["name" : "Fish & Chips", "code": "fishnchips"], ["name" : "Fondue", "code": "fondue"], ["name" : "Food Court", "code": "food_court"], ["name" : "Food Stands", "code": "foodstands"], ["name" : "French", "code": "french"], ["name" : "French Southwest", "code": "sud_ouest"], ["name" : "Galician", "code": "galician"], ["name" : "Gastropubs", "code": "gastropubs"], ["name" : "Georgian", "code": "georgian"], ["name" : "German", "code": "german"], ["name" : "Giblets", "code": "giblets"], ["name" : "Gluten-Free", "code": "gluten_free"], ["name" : "Greek", "code": "greek"], ["name" : "Halal", "code": "halal"], ["name" : "Hawaiian", "code": "hawaiian"], ["name" : "Heuriger", "code": "heuriger"], ["name" : "Himalayan/Nepalese", "code": "himalayan"], ["name" : "Hong Kong Style Cafe", "code": "hkcafe"], ["name" : "Hot Dogs", "code": "hotdog"], ["name" : "Hot Pot", "code": "hotpot"], ["name" : "Hungarian", "code": "hungarian"], ["name" : "Iberian", "code": "iberian"], ["name" : "Indian", "code": "indpak"], ["name" : "Indonesian", "code": "indonesian"], ["name" : "International", "code": "international"], ["name" : "Irish", "code": "irish"], ["name" : "Island Pub", "code": "island_pub"], ["name" : "Israeli", "code": "israeli"], ["name" : "Italian", "code": "italian"], ["name" : "Japanese", "code": "japanese"], ["name" : "Jewish", "code": "jewish"], ["name" : "Kebab", "code": "kebab"], ["name" : "Korean", "code": "korean"], ["name" : "Kosher", "code": "kosher"], ["name" : "Kurdish", "code": "kurdish"], ["name" : "Laos", "code": "laos"], ["name" : "Laotian", "code": "laotian"], ["name" : "Latin American", "code": "latin"], ["name" : "Live/Raw Food", "code": "raw_food"], ["name" : "Lyonnais", "code": "lyonnais"], ["name" : "Malaysian", "code": "malaysian"], ["name" : "Meatballs", "code": "meatballs"], ["name" : "Mediterranean", "code": "mediterranean"], ["name" : "Mexican", "code": "mexican"], ["name" : "Middle Eastern", "code": "mideastern"], ["name" : "Milk Bars", "code": "milkbars"], ["name" : "Modern Australian", "code": "modern_australian"], ["name" : "Modern European", "code": "modern_european"], ["name" : "Mongolian", "code": "mongolian"], ["name" : "Moroccan", "code": "moroccan"], ["name" : "New Zealand", "code": "newzealand"], ["name" : "Night Food", "code": "nightfood"], ["name" : "Norcinerie", "code": "norcinerie"], ["name" : "Open Sandwiches", "code": "opensandwiches"], ["name" : "Oriental", "code": "oriental"], ["name" : "Pakistani", "code": "pakistani"], ["name" : "Parent Cafes", "code": "eltern_cafes"], ["name" : "Parma", "code": "parma"], ["name" : "Persian/Iranian", "code": "persian"], ["name" : "Peruvian", "code": "peruvian"], ["name" : "Pita", "code": "pita"], ["name" : "Pizza", "code": "pizza"], ["name" : "Polish", "code": "polish"], ["name" : "Portuguese", "code": "portuguese"], ["name" : "Potatoes", "code": "potatoes"], ["name" : "Poutineries", "code": "poutineries"], ["name" : "Pub Food", "code": "pubfood"], ["name" : "Rice", "code": "riceshop"], ["name" : "Romanian", "code": "romanian"], ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"], ["name" : "Rumanian", "code": "rumanian"], ["name" : "Russian", "code": "russian"], ["name" : "Salad", "code": "salad"], ["name" : "Sandwiches", "code": "sandwiches"], ["name" : "Scandinavian", "code": "scandinavian"], ["name" : "Scottish", "code": "scottish"], ["name" : "Seafood", "code": "seafood"], ["name" : "Serbo Croatian", "code": "serbocroatian"], ["name" : "Signature Cuisine", "code": "signature_cuisine"], ["name" : "Singaporean", "code": "singaporean"], ["name" : "Slovakian", "code": "slovakian"], ["name" : "Soul Food", "code": "soulfood"], ["name" : "Soup", "code": "soup"], ["name" : "Southern", "code": "southern"], ["name" : "Spanish", "code": "spanish"], ["name" : "Steakhouses", "code": "steak"], ["name" : "Sushi Bars", "code": "sushi"], ["name" : "Swabian", "code": "swabian"], ["name" : "Swedish", "code": "swedish"], ["name" : "Swiss Food", "code": "swissfood"], ["name" : "Tabernas", "code": "tabernas"], ["name" : "Taiwanese", "code": "taiwanese"], ["name" : "Tapas Bars", "code": "tapas"], ["name" : "Tapas/Small Plates", "code": "tapasmallplates"], ["name" : "Tex-Mex", "code": "tex-mex"], ["name" : "Thai", "code": "thai"], ["name" : "Traditional Norwegian", "code": "norwegian"], ["name" : "Traditional Swedish", "code": "traditional_swedish"], ["name" : "Trattorie", "code": "trattorie"], ["name" : "Turkish", "code": "turkish"], ["name" : "Ukrainian", "code": "ukrainian"], ["name" : "Uzbek", "code": "uzbek"], ["name" : "Vegan", "code": "vegan"], ["name" : "Vegetarian", "code": "vegetarian"], ["name" : "Venison", "code": "venison"], ["name" : "Vietnamese", "code": "vietnamese"], ["name" : "Wok", "code": "wok"], ["name" : "Wraps", "code": "wraps"], ["name" : "Yugoslav", "code": "yugoslav"]]

protocol FilterViewControllerDelegate {
    func filtersDidUpdate(filters: YelpSearch)
}

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var search: YelpSearch = YelpSearch()
    var filterDelegate: FilterViewControllerDelegate?
    
    var distanceDropdownOpened = false
    var sortDropdownOpened = false
    var categoriesListOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func updateSearch(search: YelpSearch) {
        self.search = search
    }

    @IBAction func searchButtonAction(sender: AnyObject) {
        if let filterDelegate = self.filterDelegate {
            filterDelegate.filtersDidUpdate(self.search)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SECTION_TITLES[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        if section == 1 {
            var indexPaths = [NSIndexPath]()
            for index in 1...DISTANCE_VALUES.count - 1 {
                indexPaths.append(NSIndexPath(forRow: index, inSection: section))
            }
            self.tableView.beginUpdates()
            self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: section)], withRowAnimation: .Fade)
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: section)], withRowAnimation: .Fade)
            if distanceDropdownOpened {
                distanceDropdownOpened = false
                search.radius = DISTANCE_VALUES[row]
                self.tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
            } else {
                distanceDropdownOpened = true
                self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
            }
            self.tableView.endUpdates()
        } else if section == 2 {
            var indexPaths = [NSIndexPath]()
            for index in 1...SORT_VALUES.count - 1 {
                indexPaths.append(NSIndexPath(forRow: index, inSection: section))
            }
            self.tableView.beginUpdates()
            self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: section)], withRowAnimation: .Fade)
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: section)], withRowAnimation: .Fade)
            if sortDropdownOpened {
                sortDropdownOpened = false
                search.sort = SORT_VALUES[row]
                self.tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
            } else {
                sortDropdownOpened = true
                self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
            }
            self.tableView.endUpdates()
        } else if section == 3 && row == 3 && !sortDropdownOpened {
            categoriesListOpened = true
            var indexPaths = [NSIndexPath]()
            for index in 4...CATEGORIES.count - 1 {
                indexPaths.append(NSIndexPath(forRow: index, inSection: section))
            }
            self.tableView.beginUpdates()
            self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 3, inSection: section)], withRowAnimation: .Fade)
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 3, inSection: section)], withRowAnimation: .Fade)
            self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
            self.tableView.endUpdates()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return distanceDropdownOpened ? DISTANCE_VALUES.count : 1
        } else if section == 2 {
            return sortDropdownOpened ? SORT_VALUES.count : 1
        } else if section == 3 {
            return categoriesListOpened ? CATEGORIES.count : 4
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("switchFilterCell") as! FilterSwitchTableViewCell
            cell.setData("Offering a Deal", toggled: search.deals, switchUpdate: { toggled in
                self.search.deals = toggled
            })
            return cell
        } else if section == 1 {
            if distanceDropdownOpened {
                let cell = tableView.dequeueReusableCellWithIdentifier("checkFilterCell") as! FilterCheckTableViewCell
                cell.setData(DISTANCE_LABELS[row], checked: search.radius == DISTANCE_VALUES[row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("dropdownFilterCell") as! FilterDropdownTableViewCell
                let selectionIndex = DISTANCE_VALUES.indexOf({(radius: Float?) in return radius ?? 0 == search.radius ?? 0}) ?? 0
                cell.setData(DISTANCE_LABELS[selectionIndex])
                return cell
            }
        } else if section == 2 {
            if sortDropdownOpened {
                let cell = tableView.dequeueReusableCellWithIdentifier("checkFilterCell") as! FilterCheckTableViewCell
                cell.setData(SORT_LABELS[row], checked: search.sort == SORT_VALUES[row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("dropdownFilterCell") as! FilterDropdownTableViewCell
                let selectionIndex = SORT_VALUES.indexOf({(sort: YelpSortMode) in return sort == search.sort}) ?? 0
                cell.setData(SORT_LABELS[selectionIndex])
                return cell
            }
        } else if section == 3 {
            if !categoriesListOpened && row == 3 {
                let cell = tableView.dequeueReusableCellWithIdentifier("seeAllFilterCell") as! FilterSeeAllTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("switchFilterCell") as! FilterSwitchTableViewCell
                cell.setData(CATEGORIES[row]["name"]!, toggled: search.categories.indexOf({cat in return cat == CATEGORIES[row]["code"]!}) != nil, switchUpdate: { toggled in
                    let label = CATEGORIES[row]["code"]!
                    if toggled {
                        self.search.categories.append(label)
                    } else {
                        if let index = self.search.categories.indexOf({cat in return cat == label}) {
                            self.search.categories.removeAtIndex(index)
                        }
                    }
                })
                return cell
            }
        }
        return UITableViewCell()
    }
    
}
