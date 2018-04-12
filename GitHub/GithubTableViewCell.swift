//
//  GithubTableViewCell.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import UIKit
import SDWebImage

class GithubTableViewCell: UITableViewCell {
    //MARK:- IBOutlets
    
    //MARK: User
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblName: UILabel!
    //MARK: Repository
    @IBOutlet weak var lblRepositoryTitle: UILabel!
    @IBOutlet weak var lblRepositoryDescription: UILabel!
    @IBOutlet weak var lblRepositoryNumberOfStars: UILabel!
    @IBOutlet weak var lblRepositoryNumberOfForks: UILabel!
    
    //MARK: Custom Images
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImageView.image = Images.userPlaceholder
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userImageView.image = nil
        userImageView.sd_cancelCurrentImageLoad()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configColors(){
        lblUserName.textColor                = Colors.primary
        lblName.textColor                    = Colors.quaternary
        
        lblRepositoryTitle.textColor         = Colors.primary
        lblRepositoryDescription.textColor   = Colors.quaternary
        lblRepositoryNumberOfStars.textColor = Colors.quaternary
        lblRepositoryNumberOfForks.textColor = Colors.quaternary
    }
    
    
    //MARK:- CONFIG CELL
    func configCellWith(_ repository: Repository){
        
        self.configColors()
        
        //MARK: USER IMAGE
        userImageView.makeCircularView()
        userImageView.borderWidth(width: 0.5, color: Colors.primary.cgColor)
        userImageView.sd_setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
        userImageView.sd_addActivityIndicator()
        userImageView.sd_setImage(with: URL(string: repository.owner?.avatar_url ?? ""), placeholderImage: Images.userPlaceholder, completed: nil)
    
        //MARK: USERNAME
        lblUserName.text = repository.owner?.login
        
        //MARK: NAME
        lblName.text = repository.full_name
        
        //MARK: Repository Title
        lblRepositoryTitle.text = repository.name
        
        //MARK: Repository Description
        lblRepositoryDescription.text = repository.description
        
        lblRepositoryNumberOfForks.text = "\(repository.forks_count ?? 0)"
        
        lblRepositoryNumberOfStars.text = "\(repository.stargazers_count ?? 0)"
        
    }

}
