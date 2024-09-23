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
    init(fromFile fileName: String) {
        jobData = JobsDataModel(fileName: fileName)
    }
    func filterDidTap() {
        showingFilter.toggle()
        titleFilter = ""
        companyFilter = ""
    }
}
