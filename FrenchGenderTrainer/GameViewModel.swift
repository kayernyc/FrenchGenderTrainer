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

  typealias StateButtonTuple = (GameViewStateEnum, Int16)

  private let buttons: [Observable<Int>]

  let buttonStream: Observable<Int>
  let stateStream = BehaviorSubject(value: (GameViewStateEnum.explain, 0 as Int16))

  private let disposeBag = DisposeBag()

  init(leftButton: UIButton, rightButton: UIButton) {
    buttons = [leftButton, rightButton]
    .map {($0.rx.tap, $0.tag)}
    .map { obs, tag in obs.map {tag}}

    buttonStream = Observable.merge(buttons)

    super.init()
    initObservables()
  }
}

// MARK: - Streams
private extension GameViewModel {
  func buttonAdvance(buttonTag: Int) {
    do {
      let (currentState, _) = try stateStream.value()
      let button16 = Int16(buttonTag)
      let newState = currentState.advanceState()
      stateStream.on(.next((newState, button16)))
    } catch {
      print(error)
    }
  }

  private func stateHander(stateTuple: StateButtonTuple) {
    let (state, _) = stateTuple
    switch state {
    case .present:
      print("begin from GameViewModel")

    case .verify:
      print("verify from GameViewModel")

    case .explain:
      print("explain from GameViewModel")
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
