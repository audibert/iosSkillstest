//
//  AlbumTableViewCell.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/2/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitleLbl: UILabel!
    
    
    func setupCell(album: Album) {

        albumTitleLbl.text = album.title
        
        AlbumsService.instance.fetchAlbumImage(album: album) { (image) in
            self.albumImage.image = image
        }
        
    }
    

}
