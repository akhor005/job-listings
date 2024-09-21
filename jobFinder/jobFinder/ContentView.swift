//
//  ContentView.swift
//  jobFinder
//
//  Created by Adrian on 9/14/24.
//

import SwiftUI

struct JobListView: View {
    @EnvironmentObject var theme: Theme
    @ObservedObject var vm = JobListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text("Available Jobs")
                    .textStyle(theme.listJobTitle)
                ScrollView {
                    ForEach(vm.jobData.jobs) { job in
                        Spacer().frame(height: 8)
                        JobListingView(vm: JobListingViewModel(jobData: job, isShown: true))
                    }
                }.background(
                    theme.backgroundColor
                )
            }//.background(theme.backgroundComplement.ignoresSafeArea())
        }.tint(theme.foregroundColor)
            
    }
}

