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
                ZStack {
                    Text("Available Jobs")
                        .textStyle(theme.listHeading)
                    Button {
                        vm.filterDidTap()
                    } label: {
                        Text("Filter")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal, 15)
                    }
                }
                if vm.showingFilter {
                    HStack {
                        TextField(text: $vm.titleFilter) {
                            Text("Job Title")
                        }.padding(.horizontal, 10)
                        Divider().frame(height: 16)
                        TextField(text: $vm.companyFilter) {
                            Text("Company Name")
                        }.padding(.horizontal, 10)
                    }
                }
                ScrollView {
                    ForEach(vm.jobData.jobs) { job in
                        let currJobListingVM = JobListingViewModel(jobData: job, titleFilter: vm.titleFilter, companyFilter: vm.companyFilter)
                        if currJobListingVM.isShown {
                            Spacer().frame(height: 8)
                            JobListingView(vm: currJobListingVM)
                        }
                    }
                }.background(
                    theme.backgroundColor
                )
            }
        }.tint(theme.foregroundColor)
            
    }
}

