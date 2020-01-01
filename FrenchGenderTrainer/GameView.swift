//
//  GameView.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 3/7/19.
//  Copyright © 2019 happierplaces. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GameView: UIViewController {
  private let recordsStream: BehaviorRelay<[FrenchWord]> = BehaviorRelay(value: [])
  @IBOutlet var leftButton: UIButton!
  @IBOutlet var rightButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    // Move this to app delegate and inject
    let dataFacade = DataFacade()
    dataFacade.getRecords(fetchLimit: 1, predicate: nil)
  }
}

// MARK: - Data Stream
extension GameView {
  func initObservables() {
   // btnSignUp.rx.tap.subscribe(onNext:{[weak self] _ in
    // perform action you want to perform
    //}).addDisposableTo(disposeBag)
  }

}
