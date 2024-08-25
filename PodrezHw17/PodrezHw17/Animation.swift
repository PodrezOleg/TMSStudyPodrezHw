//
//  Animation.swift
//  PodrezHw17
//
//  Created by Oleg Podrez on 25.08.24.
//

import UIKit

class Animation {

    static func animationSquare(_ squareView: UIView, direction: String, in view: UIView) {
        var newFrame = squareView.frame
        
        switch direction {
             case "up":
                 newFrame.origin.y = max(newFrame.origin.y - 20, 0)
             case "down":
                 newFrame.origin.y = min(newFrame.origin.y + 20, view.bounds.height - newFrame.height)
             case "left":
                 newFrame.origin.x = max(newFrame.origin.x - 20, 0)
             case "right":
                 newFrame.origin.x = min(newFrame.origin.x + 20, view.bounds.width - newFrame.width)
             default:
                 break
            
             }
        UIView.animate(withDuration: 0.2, animations: {
            squareView.frame = newFrame
        })
    }

}
