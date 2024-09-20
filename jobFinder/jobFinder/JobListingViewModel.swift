//
//  JobListingViewModel.swift
//  jobFinder
//
//  Created by Adrian on 9/19/24.
//

import Foundation

class JobListingViewModel: ObservableObject {
    let jobData: Job
    @Published var isShown: Bool = true
    init(jobData: Job, isShown: Bool) {
        self.jobData = jobData
        self.isShown = isShown
    }
}
