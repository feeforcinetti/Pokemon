//
//  ViewsConfiguration.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 18/05/21.
//

import UIKit

class ViewsConfiguration: UIImageView{
    
        override func awakeFromNib() {
            self.layoutIfNeeded()
            layer.cornerRadius = self.frame.height / 183.5
            layer.masksToBounds = true
        }
}
