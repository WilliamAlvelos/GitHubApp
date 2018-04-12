//
//  RepositoryDetailTableViewCell.swift
//  GitHub
//
//  Created by William Alvelos on 16/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import UIKit

class RepositoryDetailTableViewCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var lblPullRequestTitle: UILabel!
    @IBOutlet weak var lblPullRequestDescription: UILabel!
    //MARK: User
    @IBOutlet weak var imgUserPhoto: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblCreateAt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgUserPhoto.image = Images.userPlaceholder
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configColors(){
        lblPullRequestTitle.textColor       = Colors.quaternary
        lblPullRequestDescription.textColor = Colors.primary
        
        lblUserName.textColor               = Colors.quaternary
        lblCreateAt.textColor               = Colors.primary
    }
    
    //MARK:- CONFIG CELL
    func configCellWith(_ pullRequest: PullRequest){
        
        self.configColors()
        
        //MARK: PullRequest Title
        lblPullRequestTitle.text = pullRequest.title
        
        //MARK: PullRequest Description
        lblPullRequestDescription.text = pullRequest.body
        
        //MARK: USER IMAGE
        imgUserPhoto.makeCircularView()
        imgUserPhoto.borderWidth(width: 0.5, color: Colors.primary.cgColor)
        imgUserPhoto.sd_setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
        imgUserPhoto.sd_addActivityIndicator()
        imgUserPhoto.sd_setImage(with: URL(string: pullRequest.user?.avatar_url ?? ""), placeholderImage: Images.userPlaceholder, completed: nil)
        
        lblUserName.text = pullRequest.user?.login
        lblCreateAt.text = String.formatDate(dateStr: pullRequest.created_at ?? "")
        
    }
    

}
