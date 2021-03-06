//
//  OrderMenuTableViewCell.swift
//  BoardGameForest
//
//  Created by Finn on 2017/9/1.
//  Copyright © 2017年 Finn. All rights reserved.
//

import UIKit

class OrderMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!

    @IBOutlet weak var controlView: UIView!
    
    private var _count: Int = 0
    
    var count:Int {
        get {
            return _count
        }
        set {
            _count = newValue < 0 ? 0 : newValue
            controlView.isHidden = _count == 0
            countLabel.text = String(_count)
        }
    }
    
    var addButtonTapAction: (() -> Void)? = nil

    var removeButtonTapAction: (() -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

    @IBAction func clickAdditionButton(_ sender: UIButton) {
        if (self.addButtonTapAction != nil) {
            self.addButtonTapAction!()
        }
    }
    
    @IBAction func clickSubtractionButton(_ sender: UIButton) {
        if (self.removeButtonTapAction != nil) {
            self.removeButtonTapAction!()
        }
    }
    
    

}
