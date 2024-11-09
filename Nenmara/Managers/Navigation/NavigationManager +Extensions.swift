//
//  NavigationManager.swift
//  Nenmara
//
//  Created by abbas m h on 09/11/24.
//

import SwiftUI

struct NavigationManagerKey: EnvironmentKey {
  static let defaultValue: NavigationManager? = nil // Replace with your default User object if needed
}

extension EnvironmentValues {
  var router: NavigationManager? {
    get { self[NavigationManagerKey.self] }
    set { self[NavigationManagerKey.self] = newValue }
  }
}
