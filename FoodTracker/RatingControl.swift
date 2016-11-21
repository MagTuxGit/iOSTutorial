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
    
    var rating = 0 {
        // property observer
        didSet {
            setNeedsLayout()    // triggers layout update on rating set
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount {
            let button = UIButton()
            //let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            //button.backgroundColor = UIColor.red
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }

        // update buttons on load
        updateButtonSelectionStates()
    }
    
    override public var intrinsicContentSize: CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
        //return CGSize(width: 240, height: 44)
    }

    // MARK: Button Action
    
    func ratingButtonTapped(_ button: UIButton) {
        //print("Button pressed 👍")
        // index is optional integer, but button is 100% exist so unwrap it with !
        rating = ratingButtons.index(of: button)! + 1
        // update buttons on rating change
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
}
