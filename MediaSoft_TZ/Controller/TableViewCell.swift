//
//  TableViewCell.swift
//  MediaSoft_TZ
//
//  Created by Marat Yunusov on 03.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let id = "TableViewCell"

    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewCell.image = nil
    }
}
