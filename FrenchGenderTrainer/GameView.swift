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
import AVKit

class GameView: UIViewController {
  @IBOutlet var leftButton: UIButton!
  @IBOutlet var rightButton: UIButton!
  @IBOutlet var wordLabel: UILabel!

  private let dataFacade = DataFacade()
  private let disposeBag = DisposeBag()

  // TODO: Move this to external model
  private var frenchWord: FrenchWord?
  private var labelObservable = BehaviorRelay<String>(value: "Start")

  override func viewDidLoad() {
    super.viewDidLoad()

    initObservation()
  }
}

// MARK: - Data Stream
extension GameView {
  private func newWord() {
    // TODO: dataFacade.getRecords should be able to throw
    // TODO: if dataFacade fails, retry
    self.frenchWord = dataFacade.getRecords(fetchLimit: 1, predicate: nil)[0]

    guard let frenchWord = self.frenchWord else {
      // TODO: Create meaningful error
      return
    }
    self.labelObservable.accept(frenchWord.french!)   //  = frenchWord.french!

    print(frenchWord)
  }

  private func initObservation() {
    let gameViewModel = GameViewModel.init(leftButton: leftButton, rightButton: rightButton)

    let interactionObservable = Observable
      .combineLatest(gameViewModel.stateStream,
                     gameViewModel.buttonStream.distinctUntilChanged())

    let interactionStream = interactionObservable
      .subscribe(onNext: { (state, button) in
        switch state {
        case .present:
          self.newWord()
        case .explain:
          print("is it correct? show correct, else show explanation")
        case .verify:
          let button16 = Int16(button)
          if button16 == self.frenchWord?.gender {
            print("CORRECT")
          } else {
            print("INCORRECT")
          }
        }
      }, onError: { (err) in
        print("ERROR: \(err)")
      }, onCompleted: {
        print("complete")
      })
    let labelSubscription = labelObservable
      .subscribe(onNext: { (string) in
        self.wordLabel.attributedText = NSAttributedString.init(string: string)
      }, onError: { (err) in
        print("ERROR: \(err)")
      }, onCompleted: {
        print("complete")
      })

    interactionStream.disposed(by: disposeBag)
    labelSubscription.disposed(by: disposeBag)

  }
}
