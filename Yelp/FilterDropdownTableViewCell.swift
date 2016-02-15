//
//  FilterDropdownTableViewCell.swift
//  Yelp
//
//  Created by Matthis Perrin on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class FilterDropdownTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dropdownImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dropdownImage.image = UIImage(named: "dropdown")
        dropdownImage.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        dropdownImage.contentMode = .ScaleAspectFill
    }
    
    func setData(title: String) {
        titleLabel.text = title
    }

}
