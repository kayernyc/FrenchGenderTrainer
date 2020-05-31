//
//  GenderButton.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 5/30/20.
//  Copyright © 2020 happierplaces. All rights reserved.
//

import UIKit

class GenderButton: UIButton, CAAnimationDelegate {
  private let animationDuration = 0.3
  private let flashCount: Double = 2.0

  private var targetColor: UIColor?

  func flash() {
    let flash = CABasicAnimation(keyPath: "opacity")
    flash.autoreverses = true
    flash.duration = animationDuration / flashCount
    flash.fromValue = 1
    flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    flash.repeatCount = Float(flashCount)
    flash.toValue = 0.1

    layer.add(flash, forKey: nil)
  }

  func fadeTo(fromColor: UIColor, toColor: UIColor) {
    targetColor = toColor
    let fadeTo = CABasicAnimation(keyPath: "backgroundColor")
    fadeTo.delegate = self
    fadeTo.duration = animationDuration * 1.1
    fadeTo.fillMode = CAMediaTimingFillMode.forwards
    fadeTo.fromValue = fromColor.cgColor
    fadeTo.isRemovedOnCompletion = true
    fadeTo.toValue = toColor.cgColor

    layer.add(fadeTo, forKey: "backgroundColor")
  }

  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    if targetColor != nil {
      backgroundColor = targetColor
    }
  }
}
