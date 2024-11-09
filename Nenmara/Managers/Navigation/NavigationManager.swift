//
//  NavigationManager.swift
//  Nenmara
//
//  Created by abbas m h on 09/11/24.
//

import Foundation

class NavigationManager: ObservableObject {
    
    @Published var routes : [Route] = []
    
    func push(to route: Route) {
        routes.append(route)
    }
    
    func pushMultipleRoutes(routes: [Route]) {
        self.routes.append(contentsOf: routes)
    }
    
    func popToRoot() {
        routes.removeAll()
    }
    func popLast(){
       let popedRoute = routes.popLast()
        debugPrint("******** routes *******")
        debugPrint(popedRoute as Any)
        debugPrint("******** ------- *******")
    }
    func pop(to route: Route) {
        routes.removeAll(where: { $0.id != route.id })
    }
    
    func popTo(index: Int) {
        //routes.removeAll(where: { $0.id.index(before: $0.id.endIndex) != index })
    }
    
    
}


