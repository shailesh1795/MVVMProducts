//
//  UIImageView + Extension.swift
//  MVVMProducts
//
//  Created by Mac on 17/04/24.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else { return }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
