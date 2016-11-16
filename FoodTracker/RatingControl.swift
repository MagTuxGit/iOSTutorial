//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Andrij Trubchanin on 11/15/16.
//  Copyright © 2016 Andrij Trubchanin. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // MARK: Properties
    
    var rating = 0
    var ratingButtons = [UIButton]()
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<5 {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            button.backgroundColor = UIColor.red
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (44 + 5))
            button.frame = buttonFrame
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: 240, height: 44)
    }

    // MARK: Button Action
    
    func ratingButtonTapped(_ button: UIButton) {
        print("Button pressed 👍")
    }
    
}
