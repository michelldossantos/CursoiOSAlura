//
//  HomeTableViewCell.swift
//  AgendaM
//
//  Created by Michel dos Santos on 08/03/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var imageAluno: UIImageView!
    @IBOutlet weak var labelNomeDoAluno: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
