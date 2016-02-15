//
//  BusinessTableViewCell.swift
//  Yelp
//
//  Created by Matthis Perrin on 2/12/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {

    @IBOutlet weak var businessImageView: UIImageView!
    @IBOutlet weak var businessNameLabel: UILabel!
    @IBOutlet weak var businessRatingImageView: UIImageView!
    @IBOutlet weak var businessAddressLabel: UILabel!
    @IBOutlet weak var businessCategories: UILabel!
    @IBOutlet weak var businessDistanceLabel: UILabel!
    @IBOutlet weak var businessReviewLabel: UILabel!
    
    private var business: Business!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        businessImageView.contentMode = .ScaleAspectFill
        businessImageView.layer.cornerRadius = 10
        businessImageView.clipsToBounds = true
    }
    
    func updateBusiness(business: Business) -> Void {
        if let current = self.business {
            if current == business {
                return
            }
        }
        businessImageView.image = nil
        businessRatingImageView.image = nil
        if let businessImageURL = business.imageURL {
            businessImageView.setImageWithURL(businessImageURL)
        }
        if let businessRatingImageURL = business.ratingImageURL {
            businessRatingImageView.setImageWithURL(businessRatingImageURL)
        }
        
        businessNameLabel.text = business.name
        businessAddressLabel.text = business.address
        businessCategories.text = business.categories
        businessDistanceLabel.text = business.distance
        let reviewCount = business.reviewCount ?? 0
        let suffix = reviewCount == 1 ? "" : "s"
        businessReviewLabel.text = "\(reviewCount) Review\(suffix)"
        
        self.business = business
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
