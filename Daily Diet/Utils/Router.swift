//
//  Router.swift
//  Daily Diet
//
//  Created by joao cardoso on 14/01/24.
//

import SwiftUI

enum ViewType {
    case stats
    case addMeal
    case success
    case fail
}

class NavigationRouter: ObservableObject {
    @Published var navigationPath = NavigationPath()

    func navigate(to: ViewType) {
        let view: DestinationID = switch to {
        case .addMeal:
            DestinationID.addMealView()
        case .stats:
            DestinationID.statsView()
        case .success:
            DestinationID.successView()
        case .fail:
            DestinationID.failView()
        }

        navigationPath.append(view)
    }

    func goToRoot() {
        navigationPath = NavigationPath()
    }
}

struct DestinationID: Identifiable, Hashable {
    let id: UUID
    let viewType: ViewType
}

extension DestinationID {
    static func statsView() -> DestinationID {
        DestinationID(id: UUID(), viewType: .stats)
    }

    static func addMealView() -> DestinationID {
        DestinationID(id: UUID(), viewType: .addMeal)
    }

    static func successView() -> DestinationID {
        DestinationID(id: UUID(), viewType: .success)
    }

    static func failView() -> DestinationID {
        DestinationID(id: UUID(), viewType: .fail)
    }

    // Add other factory methods for different destinations
}
