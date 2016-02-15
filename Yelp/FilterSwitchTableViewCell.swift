//
//  FilterSwitchTableViewCell.swift
//  Yelp
//
//  Created by Matthis Perrin on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class FilterSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var toggle: UISwitch!
    
    var switchUpdate: ((Bool) -> Void)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func switchValueChanged(sender: AnyObject) {
        if let switchUpdate = self.switchUpdate {
            switchUpdate(toggle.on)
        }
    }
    
    func setData(title: String, toggled: Bool, switchUpdate: (toggled: Bool) -> Void) {
        self.titleLabel.text = title
        self.toggle.setOn(toggled, animated: false)
        self.switchUpdate = switchUpdate
    }

}
