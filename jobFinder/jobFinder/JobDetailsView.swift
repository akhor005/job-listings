//
//  JobDetailsView.swift
//  jobFinder
//
//  Created by Adrian on 9/19/24.
//

import SwiftUI

struct JobDetailsView: View {
    @EnvironmentObject var theme: Theme
    let job: Job
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(job.jobTitle)
                        .textStyle(theme.detailsJobTitle)
                    Text(job.companyName + " • " + job.location)
                        .textStyle(theme.detailsCompanyName)
                    bgDivider
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Responsibilities")
                            .textStyle(theme.detailsSubtitle)
                        Text(job.jobDescription)
                            .textStyle(theme.detailsParagraph)
                    }
                    bgDivider
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Requirements")
                            .textStyle(theme.detailsSubtitle)
                        Text(job.requirements)
                            .textStyle(theme.detailsParagraph)
                    }
                    
                    Spacer()
                    
                }
                .padding(10)
                .navigationTitle("Details")
            }
            Button {
                print("Applied!")
            } label: {
                Text("Apply")
                    .textStyle(theme.applyButton)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                    .background(theme.backgroundColor)
                    .cornerRadius(25)
                    .padding(35)
            }
        }
        
    }
    
    var bgDivider: some View {
        theme.backgroundColor
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .frame(height: 2)
            .padding(.vertical, 15)
    }
}

