//
//  ContentView.swift
//  jobFinder
//
//  Created by Adrian on 9/14/24.
//

import SwiftUI

struct JobListView: View {
    @StateObject var theme = Theme()
    @ObservedObject var vm = JobListViewModel()
    var body: some View {
        ScrollView {
            ForEach(vm.jobData.jobs) { job in
                JobListingView(vm: JobListingViewModel(jobData: job, isShown: true))
                    .environmentObject(theme)
                Spacer().frame(height: 8)
            }
        }.background(
            Color(red: 0.86, green: 0.92, blue: 0.92)
        )
    }
}

#Preview {
    JobListView(theme: Theme())
}

