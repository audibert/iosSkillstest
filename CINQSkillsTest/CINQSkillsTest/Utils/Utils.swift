//
//  Utils.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/1/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import Foundation
import UIKit

 class Utils {
    
    static func makeNavigationTransparent(vc: UIViewController) {
        vc.navigationController?.navigationBar.isTranslucent = true
        vc.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        vc.navigationController?.navigationBar.shadowImage = UIImage() //remove pesky 1 pixel line
        
    }
    
}
