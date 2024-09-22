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
    private var jobs: [Job] = []
    private var errorMessage: String? = nil
    init() {
        do {
            try jobs = read2(filePath: "/Users/adriankhor/Library/GitHub/job-listings/jobFinder/jobFinder/jobs.csv")
        } catch ReadCSVError.fileNotFound {
            errorMessage = "CSV file not found"
        } catch ReadCSVError.badHeader {
            errorMessage = "Incorrect column names or number of columns"
        } catch ReadCSVError.openQuotation(let i) {
            errorMessage = "Quotations left open in row \(i)"
        } catch ReadCSVError.fewColumns(let i) {
            errorMessage = "Insufficient columns in row \(i)"
        } catch {
            
        }
    }
    func getJobs() -> [Job] { //to prevent modification
        return jobs
    }
    func getErrorMsg() -> String? {
        return errorMessage
    }
    func read2(filePath: String) throws -> [Job] {
        guard let content = try? String(contentsOfFile: filePath) else {
            print("Failed to read CSV file")
            throw ReadCSVError.fileNotFound
            
        }
        
        var jobs: [Job] = []
        let rows = content.components(separatedBy: "\n")
        
        guard rows[0] == "Job Title,Company Name,Location,Job Description,Requirements" else {
            print("Incorrect headers")
            throw ReadCSVError.badHeader
            
        }
        var index = 0
        for row in rows[1...] {
            index += 1
            let columns: [String]
            do {
                columns = try separateRow(row: row)
            } catch {
                throw ReadCSVError.openQuotation(index)
            }
            if columns.count == 5 {
                jobs.append(Job(
                    id: index,
                    jobTitle: columns[0],
                    companyName: columns[1],
                    location: columns[2].trimmingCharacters(in: CharacterSet(charactersIn: "\"")),
                    jobDescription: columns[3].trimmingCharacters(in: CharacterSet(charactersIn: "\"")),
                    requirements: columns[4].trimmingCharacters(in: CharacterSet(charactersIn: "\""))
                ))
            } else if columns.count > 1 { //for blank lines
                throw ReadCSVError.fewColumns(index)
            }
        }
        
        return jobs
    }
    func separateRow(row: String) throws -> [String] {
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
                if separations.count < i+2 {
                    throw ReadCSVError.openQuotation(0)
                }
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

enum ReadCSVError: Error {
    case fileNotFound
    case badHeader
    case openQuotation(Int)
    case fewColumns(Int)
}
