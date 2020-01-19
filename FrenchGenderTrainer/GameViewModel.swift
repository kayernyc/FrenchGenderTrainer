//
//  GameViewModel.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 1/19/20.
//  Copyright © 2020 happierplaces. All rights reserved.
//
// Users/kathrinayer/FrenchGenderTrainer/FrenchGenderTrainer/GameViewModel.swift
import Foundation
import RxSwift
import RxCocoa
import AVKit

class GameViewModel: NSObject {
  private enum GameViewStateEnum: String {
    case present
    case verify
    case explain

    func advanceState() -> GameViewStateEnum {
      switch self {
      case .present:
        return GameViewStateEnum.verify
      case .verify:
        return GameViewStateEnum.explain
      case .explain:
        return GameViewStateEnum.present
      }
    }
  }

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

  private let recordsStream: BehaviorSubject<[FrenchWord]> = BehaviorSubject(value: [])
  private let buttons: [Observable<Int>]

  private let buttonStream: Observable<Int>
  private let stateStream = BehaviorSubject(value: GameViewStateEnum.present)

  private let disposeBag = DisposeBag()

  private let speechSynthesizer: AVSpeechSynthesizer! = AVSpeechSynthesizer()

  init(leftButton: UIButton, rightButton: UIButton) {
    buttons = [leftButton, rightButton]
    .map {($0.rx.tap, $0.tag)}
    .map { obs, tag in obs.map {tag}}

    buttonStream = Observable.merge(buttons)

    let dataFacade = DataFacade()
    //    let recordsStream.onNext(dataFacade.getRecords(fetchLimit: 10, predicate: nil))
    super.init()
    initObservables()
  }
}

// MARK: - Streams
private extension GameViewModel {
  func buttonAdvance(buttonTag: Int) {
    do {
      let currentState = try stateStream.value()
      let newState = currentState.advanceState()
      stateStream.on(.next(newState))
    } catch {
      print(error)
    }
  }

  private func stateHander(state: GameViewStateEnum) {
    switch state {
    case .present:
      print("begin")

    case .verify:
      print("verify")

    case .explain:
      print("explain")
    }
  }

  private func standardCompleted() {
    print("-- complete")
  }

  private func standardError(err: Error) {
    print("I had an error \(err)")
  }

  func initObservables() {
//    let recordsStream: BehaviorSubject<[FrenchWord]> = BehaviorSubject(value: [])
    let buttonStreamSubscription = buttonStream
      .subscribe(onNext: buttonAdvance,
        onError: standardError,
        onCompleted: standardCompleted)

    let stateStreamSubscription = stateStream
      .subscribe(onNext: stateHander,
         onError: standardError,
         onCompleted: standardCompleted)

    buttonStreamSubscription.disposed(by: disposeBag)
    stateStreamSubscription.disposed(by: disposeBag)
  }
}

// MARK: - Speech
extension GameViewModel {
  private func speak(word: String) {
    let speechUtterance = AVSpeechUtterance(string: word)
    speechUtterance.voice = AVSpeechSynthesisVoice(language: "fr")

    speechSynthesizer.speak(speechUtterance)
  }
}
