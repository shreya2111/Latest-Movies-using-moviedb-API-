//
//  ViewControllerTableViewCell.swift
//  
//
//  Created by Shreya  on 28/06/18.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var poster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
