//
//  jobFinderApp.swift
//  jobFinder
//
//  Created by Adrian on 9/14/24.
//

import SwiftUI

@main
struct JobFinderApp: App {
    @StateObject var theme = Theme()
    var body: some Scene {
        WindowGroup {
            JobListView()
                .environmentObject(theme)
        }
    }
}
