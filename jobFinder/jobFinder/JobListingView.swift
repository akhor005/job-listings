//
//  JobListingView.swift
//  jobFinder
//
//  Created by Adrian on 9/19/24.
//

import SwiftUI

struct JobListingView: View {
    @EnvironmentObject var theme: Theme
    let model = JobsDataModel()
    let vm: JobListingViewModel
    var body: some View {
        Button {
            print("to details")
        } label: {
            HStack {
                Image(systemName: "doc.text.fill").frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 4) {
                    Text(vm.jobData.jobTitle)
                        .textStyle(theme.listJobTitle)
                    Text(vm.jobData.companyName)
                        .textStyle(theme.listCompanyName)
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 10, height: 2)
                            .padding(0)
                            .foregroundStyle(.black)
                            
                        Text(vm.jobData.location)
                            .textStyle(theme.listLocation)
                    }
                }
                Spacer()
                Image(systemName: "chevron.forward").foregroundStyle(.black)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal, 10)
        }
        .onAppear() {
            print(model.jobs)
        }
    }
}

