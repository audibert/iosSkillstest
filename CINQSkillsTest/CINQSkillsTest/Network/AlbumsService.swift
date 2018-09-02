//
//  AlbumsFactory.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/2/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import Foundation
import UIKit

class AlbumsService {
    
    
    static let instance = AlbumsService()
    
    func fetchAlbums(completion: @escaping ([Album]) -> ()) {
        
        let jsonUrlString = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            
            do {
                let fetchedAlbums = try JSONDecoder().decode([Album].self, from: data)
                let albums = fetchedAlbums
                
                
                DispatchQueue.main.async {
                    completion(albums)
                }
            } catch {
                completion([])
            }
            
            
        }.resume()
        
        
    }
    
    public func fetchAlbumImage(album: Album, completion: @escaping (UIImage) -> () ) {
        let url = URL(string: album.thumbnailUrl)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                completion(UIImage(data: data!)!)
                //self.albumImage.image = UIImage(data: data!)
            }
        }
    }
    
    
    
}
