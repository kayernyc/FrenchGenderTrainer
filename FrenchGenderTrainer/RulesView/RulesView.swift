//
//  RulesView.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 5/31/20.
//  Copyright © 2020 happierplaces. All rights reserved.
//

import Foundation
import UIKit

class RulesView: UITableViewController, DataFacadeProtocol {
  private var _dataFacade: DataFacade?
  private var _rulesSet: [GenderRuleAndException]?

  var dataFacade: DataFacade {
    get {
      if _dataFacade == nil {
        _dataFacade = DataFacade()
      }
      return _dataFacade!
    }

    set(newValue) {
      _dataFacade = newValue
    }
  }

  var rulesSet: [GenderRuleAndException] {
    get {
      if _rulesSet == nil {
        _rulesSet = dataFacade.rules()
      }
        return _rulesSet!
    }

    set(newValue) {
      _rulesSet = newValue
    }
  }

  override func viewDidLoad() {
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RuleCell")
  }
}

// MARK: - DATA Handling
extension RulesView {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rulesSet.count
  }
}

// MARK: - Cell Rendering
extension RulesView {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RuleCell", for: indexPath)
    cell.textLabel?.text = rulesSet[indexPath.row].ruleString()
    return cell
  }
}
