//
//  ProductCellTableViewCell.swift
//  MVVMProducts
//
//  Created by Mac on 17/04/24.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {

    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product : Product? {
        didSet {
            productDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func productDetailConfiguration () {
        guard let product = product else { return }
            productTitle.text = product.title
            productCategoryLabel.text = product.category
            descriptionLabel.text = product.description
            priceLabel.text = "$\(product.price)"
            rateButton.setTitle("\(product.rating)", for: .normal)
        productImageView.setImage(with: product.image)
        
    }
}
