//
//  JobListViewModel.swift
//  jobFinder
//
//  Created by Adrian on 9/19/24.
//

import Foundation

class JobListViewModel: ObservableObject {
    let jobData: JobsDataModel
    @Published var showingFilter = false
    @Published var titleFilter = ""
    @Published var companyFilter = ""
    init() {
        jobData = JobsDataModel()
    }
    func filterDidTap() {
        showingFilter.toggle()
        titleFilter = ""
    }
}
