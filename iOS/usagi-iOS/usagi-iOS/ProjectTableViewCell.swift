//
//  ProjectTableViewCell.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    var project: Project? {
        didSet {
            if participantsView != nil {
                guard let participantsListController = participantsView.dataSource as? ParticipantsCollectionViewController else {
                    fatalError()
                }
                
                participantsListController.participantPictures = self.project!.participants.flatMap({$0.profilePicture})
                
                participantsListController.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "participantID")
//                participantsListController.collectionView?.reloadData()
            }
        }
    }
    
    // Outlets
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectDescription: UILabel!
    @IBOutlet weak var participantsView: UICollectionView!
    @IBOutlet weak var participantsCount: UILabel!
    @IBOutlet weak var participantsCountBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        participantsCountBackgroundView.layer.cornerRadius = participantsCountBackgroundView.frame.width / 2
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
