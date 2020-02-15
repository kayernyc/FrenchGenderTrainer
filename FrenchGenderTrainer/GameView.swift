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
  private enum SpeechEnum: String {
    case male
    case female

    func voiceProfile() -> String {
      switch self {
      case .male: return "fr"
      case .female: return "fr-ca"
      }
    }
  }

  @IBOutlet var leftButton: UIButton!
  @IBOutlet var rightButton: UIButton!
  @IBOutlet var wordLabel: UILabel!

  private let dataFacade = DataFacade()
  private let disposeBag = DisposeBag()

  // TODO: Move this to external model
  private var frenchWord: FrenchWord?
  private var labelObservable = BehaviorRelay<String>(value: "Start")

  private let speechSynthesizer: AVSpeechSynthesizer! = AVSpeechSynthesizer()

  override func viewDidLoad() {
    super.viewDidLoad()

    initObservation()
  }
}

// MARK: - Speech
extension GameView {
  private func speak(word: String) {
    let speechUtterance = AVSpeechUtterance(string: word)
    speechUtterance.voice = AVSpeechSynthesisVoice(language: "fr")

    speechSynthesizer.speak(speechUtterance)
  }
}

// MARK: - Verify Step
extension GameView {
  private func createWordPhrase(word: FrenchWord) -> String {
    let string = word.french

    return string ?? ""
  }
}

// MARK: - Data Stream
extension GameView {
  private func newWord() -> FrenchWord? {
    // TODO: dataFacade.getRecords should be able to throw
    // TODO: if dataFacade fails, retry
    self.frenchWord = dataFacade.getRecords(fetchLimit: 1, predicate: nil)[0]

    guard let frenchWord = self.frenchWord else {
      // TODO: Create meaningful error
      return nil
    }
    self.labelObservable.accept(frenchWord.french!)   //  = frenchWord.french!

    print(frenchWord)
    return frenchWord
  }

  private func initObservation() {
    let gameViewModel = GameViewModel.init(leftButton: leftButton, rightButton: rightButton)

//    let interactionObservable = Observable
//      .combineLatest(gameViewModel.stateStream,
//      gameViewModel.buttonStream)

    let interactionStream = gameViewModel.stateStream
      .subscribe(onNext: { (state, button16) in
//
        switch state {
        case .present:
          // TODO: if newWord returns nil, try again
          self.frenchWord = self.newWord()
        case .explain:
          print("is it correct? show correct, else show explanation")
        case .verify:
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
