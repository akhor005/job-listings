//
//  JobListingView.swift
//  jobFinder
//
//  Created by Adrian on 9/19/24.
//

import SwiftUI

struct JobListingView: View {
    @EnvironmentObject var theme: Theme
    @ObservedObject var vm: JobListingViewModel
    var body: some View {
        NavigationLink {
            JobDetailsView(job: vm.jobData)
        } label: {
            HStack() {
                CompanyLogoView(inputString: vm.jobData.companyName).padding(10)
                    .frame(maxHeight: .infinity, alignment: .top)
                VStack(alignment: .leading, spacing: 2) {
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
                    }.padding(.top, 6)
                }
                Spacer()
                Image(systemName: "chevron.forward").foregroundStyle(.black)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal, 10)
                .opacity(vm.isShown ? 1 : 0)
        }
    }
}

