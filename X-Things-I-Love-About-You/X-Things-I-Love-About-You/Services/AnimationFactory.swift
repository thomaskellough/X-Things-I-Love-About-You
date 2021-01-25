//
//  AnimationFactory.swift
//  X-Things-I-Love-About-You
//
//  Created by Thomas Kellough on 1/24/21.
//

import UIKit

struct AnimationFactory {
    
    func animateAlphaComponent(_ label: UIView, duration: Double, delay: Double) {
        label.alpha = 0
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: .curveEaseInOut,
            animations: {
                label.alpha = 1
            })
    }
    
    func animateViewSmallToBig(_ view: UIView, duration: Double, delay: Double) {
        view.transform = CGAffineTransform(scaleX: 0/01, y: 0.01)
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: .curveEaseInOut,
            animations: {
                view.transform = .identity
            })
    }
    
    func randomAnimation(_ view: UIView, duration: Double, delay: Double) {
        let random = Int.random(in: 0...1)
        
        switch random {
        case 0:
            animateAlphaComponent(view, duration: duration, delay: delay)
        case 1:
            animateViewSmallToBig(view, duration: duration, delay: delay)
        default:
            animateAlphaComponent(view, duration: duration, delay: delay)
        }
    }

}
