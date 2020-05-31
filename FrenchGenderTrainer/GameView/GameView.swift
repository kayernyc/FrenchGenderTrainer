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

class GameView: UIViewController, CAAnimationDelegate {
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

  @IBOutlet var leftButton: GenderButton!
  @IBOutlet var rightButton: GenderButton!
  @IBOutlet var wordLabel: UILabel!
  @IBOutlet var explanationLabel: UILabel!

  private let disposeBag = DisposeBag()
  private let frenchWordModel = FrenchWordModel()
  private var labelObservable = BehaviorRelay<String>(value: "Start")
  private let articlesModel = ArticlesModel()

  private let animationDuration = 0.3

  private let speechSynthesizer: AVSpeechSynthesizer! = AVSpeechSynthesizer()

  override func viewDidLoad() {
    super.viewDidLoad()

    leftButton.backgroundColor = AppBlue
    rightButton.backgroundColor = AppPink

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

// MARK: - View Utilities
private extension GameView {
  func updateButtonBackgrounds (color: UIColor, buttons: [UIButton]) {
    for button in buttons {
      button.backgroundColor = color
    }
  }

  func presentationLabel(for frenchWord: FrenchWord) -> String {
    let french = frenchWord.french!
    let english = frenchWord.english!

    return """
    \(french )
    \(english )
    """
  }

  func explanationLabel(for frenchWord: FrenchWord) -> String {
    let french = frenchWord.french!
    let english = frenchWord.english!

    let frenchArticle = articlesModel.findArticle(for: french, inFrench: true, gender: Int(frenchWord.gender))
    let englishArticle = articlesModel
      .findArticle(for: english, inFrench: false, gender: Int(frenchWord.gender))

    return """
    \(frenchArticle)\(french )
    \(englishArticle)\(english )
    """
  }
}

// MARK: - Data Stream
extension GameView {
  private func clearExplanationLabel() {
    explanationLabel.text = ""
  }

  private func updateViewForPresentation(state: GameViewStateEnum, button16: Int16, frenchWord: FrenchWord) {
    leftButton.fadeTo(fromColor: leftButton.backgroundColor ?? AppBlue, toColor: AppBlue)
    rightButton.fadeTo(fromColor: rightButton.backgroundColor ?? AppPink, toColor: AppPink)
    self.labelObservable.accept(self.presentationLabel(for: frenchWord))
  }

  private func updateViewForExplaination(state: GameViewStateEnum, button16: Int16, frenchWord: FrenchWord) {
    let buttons = [self.leftButton, self.rightButton]
    let targetButtonColor = frenchWord.gender == 0 ? AppBlue : AppPink

    self.labelObservable.accept(self.explanationLabel(for: frenchWord))

    for button in buttons {
      guard let button = button else {
        continue
      }
      let buttonStartColor = button.backgroundColor ?? targetButtonColor
      button.fadeTo(fromColor: buttonStartColor, toColor: targetButtonColor)

      if button16 != frenchWord.gender {
        button.flash()
      }
    }

    let labelText = self.frenchWordModel.rule(for: frenchWord).explainationMessage(word: frenchWord)
    explanationLabel.text = labelText
  }

  private func initObservation() {
    let gameViewModel = GameViewModel.init(leftButton: leftButton, rightButton: rightButton)

    let interactionStream = gameViewModel.stateStream
      .subscribe(onNext: { (state, button16, frenchWord) in
        switch state {
        case .present:
          self.clearExplanationLabel()
          self.updateViewForPresentation(state: state, button16: button16, frenchWord: frenchWord)
        case .explain:
          self.updateViewForExplaination(state: state, button16: button16, frenchWord: frenchWord)
        case .start:
          self.clearExplanationLabel()
          print("start!")
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
