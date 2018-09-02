//
//  AlbumListViewController.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/2/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import UIKit

class AlbumListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 180

        AlbumsService.instance.fetchAlbums { (albums) in
            if !albums.isEmpty {
                self.albums = albums
                self.tableView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumViewCell", for: indexPath) as? AlbumTableViewCell
        
        if let cell = cell {
            
            cell.setupCell(album: albums[indexPath.row])
            
            
        }
        
        return cell!
        
        
    }
    
    
}
