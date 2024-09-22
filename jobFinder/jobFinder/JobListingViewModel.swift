//
//  JobListingViewModel.swift
//  jobFinder
//
//  Created by Adrian on 9/19/24.
//

import Foundation

class JobListingViewModel: ObservableObject {
    let jobData: Job
    @Published var isShown: Bool
    init(jobData: Job, titleFilter: String, companyFilter: String) {
        self.jobData = jobData
        
        let titleMatch = titleFilter == "" || jobData.jobTitle.lowercased().contains(titleFilter.lowercased())
        let companyMatch = companyFilter == "" || jobData.companyName.lowercased().contains(companyFilter.lowercased())
        
        self.isShown = titleMatch && companyMatch
    }
}
