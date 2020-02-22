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

class GameViewModel: NSObject {
  enum GameViewStateEnum: String {
    case start
    case present
    case explain

    func advanceState() -> GameViewStateEnum {
      switch self {
      case .start:
        return GameViewStateEnum.present
      case .present:
        return GameViewStateEnum.explain
      case .explain:
        return GameViewStateEnum.present
      }
    }
  }

  typealias StateButtonTuple = (GameViewStateEnum, Int16, FrenchWord)

  private let buttons: [Observable<Int>]
  private let frenchWordModel = FrenchWordModel()
  private var frenchWord: FrenchWord

  let buttonStream: Observable<Int>
  let stateStream: BehaviorSubject<StateButtonTuple>
  var wordStream: BehaviorSubject<FrenchWord>

  private let disposeBag = DisposeBag()

  init(leftButton: UIButton, rightButton: UIButton) {
    buttons = [leftButton, rightButton]
    .map {($0.rx.tap, $0.tag)}
    .map { obs, tag in obs.map {tag}}

    // TODO: Should try/catch
    frenchWord = frenchWordModel.newWord()!

    buttonStream = Observable.merge(buttons)
    wordStream = BehaviorSubject(value: frenchWordModel.newWord()!)
    stateStream = BehaviorSubject(value: (GameViewStateEnum.start, 0 as Int16, frenchWord))

    super.init()
    initObservables()
  }
}

// MARK: - Streams
private extension GameViewModel {
  func buttonAdvance(buttonTag: Int) {
    do {
      var (currentState, _, frenchWord) = try stateStream.value()
      let button16 = Int16(buttonTag)
      let newState = currentState.advanceState()
      if newState == .present {
        frenchWord = frenchWordModel.newWord()!
      }

      stateStream.on(.next((newState, button16, frenchWord)))
    } catch {
      print(error)
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

    buttonStreamSubscription.disposed(by: disposeBag)

  }
}
