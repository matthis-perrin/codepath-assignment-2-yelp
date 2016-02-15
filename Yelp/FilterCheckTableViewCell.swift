//
//  FilterCheckTableViewCell.swift
//  Yelp
//
//  Created by Matthis Perrin on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class FilterCheckTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkImage.image = UIImage(named: "circle-check")
        checkImage.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        checkImage.contentMode = .ScaleAspectFill
    }
    
    func setData(title: String, checked: Bool) {
        titleLabel.text = title
        if checked {
            checkImage.tintColor = UIColor(red: 189/255, green: 27/255, blue: 0, alpha: 1)
        } else {
            checkImage.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        }
    }

}
