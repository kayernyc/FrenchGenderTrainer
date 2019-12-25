//
//  ViewController.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 3/7/19.
//  Copyright © 2019 happierplaces. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    // Move this to app delegate and inject
    let wordDictionary = DictionaryFactory()
    wordDictionary.processDictionary()
  }
}
