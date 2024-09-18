//
//  ContentView.swift
//  jobFinder
//
//  Created by Adrian on 9/14/24.
//

import SwiftUI

struct JobListView: View {
    @StateObject var theme = Theme()
    var body: some View {
        ScrollView {
            ForEach(0..<5) { _ in
                JobListingView()
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

struct JobListingView: View {
    @EnvironmentObject var theme: Theme
    var body: some View {
        Button {
            print("to details")
        } label: {
            HStack {
                Image(systemName: "doc.text.fill").frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Job Title")
                        .textStyle(theme.listJobTitle)
                    Text("Company name")
                        .textStyle(theme.listCompanyName)
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 10, height: 2)
                            .padding(0)
                            .foregroundStyle(.black)
                            
                        Text("Location")
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
    }
}
