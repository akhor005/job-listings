//
//  JobsDataModel.swift
//  jobFinder
//
//  Created by Adrian on 9/18/24.
//

import Foundation

struct Job: Identifiable {
    let id: Int
    let jobTitle: String
    let companyName: String
    let location: String
    let jobDescription: String
    let requirements: String
}

class JobsDataModel {
    var jobs: [Job] = []
    init() {
        jobs = read2(filePath: "/Users/adriankhor/Library/GitHub/job-listings/jobFinder/jobFinder/jobs.csv")
        //print(jobs[0])
    }
    
    func read2(filePath: String) -> [Job] {
        guard let content = try? String(contentsOfFile: filePath) else {
            print("Failed to read CSV file")
            return []
        }
        
        var jobs: [Job] = []
        let rows = content.components(separatedBy: "\n")
        var id = 0
        for row in rows[1...] {
            id += 1
            print(row)
            let columns = separateRow(row: row)
//            print(columns)
            if columns.count == 5 {
                jobs.append(Job(
                    id: id,
                    jobTitle: columns[0],
                    companyName: columns[1],
                    location: columns[2].trimmingCharacters(in: CharacterSet(charactersIn: "\"")),
                    jobDescription: columns[3].trimmingCharacters(in: CharacterSet(charactersIn: "\"")),
                    requirements: columns[4].trimmingCharacters(in: CharacterSet(charactersIn: "\""))
                ))
            }
        }
        
        return jobs
    }
    func separateRow(row: String) -> [String] {
        var separations = row.components(separatedBy: ",")
        var insideQuotation = false
        var repeatedIndices = [Int]()
        for (i, substr) in separations.enumerated() {
            if substr.first == "\"" {
                insideQuotation = true
            } else if substr.last == "\"" {
                insideQuotation = false
            }
            if insideQuotation {
                repeatedIndices.append(i)
                separations[i+1] = separations[i] + "," + separations[i+1]
            }
        }
        for i in repeatedIndices.reversed() { //reversed so index stays consistent
            separations.remove(at: i)
        }
        return separations
    }
}

