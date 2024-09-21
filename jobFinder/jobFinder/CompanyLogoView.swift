
///Arbitrary company logo to "complete" the design
///
///Written by ChatGPT following these instructions: "swift function that takes two letters (from the first letter of first two words of a string) and returns a 2-color gradient square from that. Hash the unicode representation of the letters to colors for consistency, so two given letters will always map to the same gradient."
///
///Square was modified to "doc.text.fill" system image


import SwiftUI

struct CompanyLogoView: View {
    // Function to generate a gradient from the first two letters of the input string
    func gradientFromFirstTwoLetters(input: String) -> LinearGradient {
        // Split the input string into words
        let words = input.split(separator: " ")
        
        // Ensure there are at least two words
        guard words.count >= 2,
              let firstLetter = words.first?.first,
              let secondLetter = words.dropFirst().first?.first else {
            return LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]),
                                  startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        
        // Generate colors from the first two letters
        let color1 = colorFromLetter(letter: firstLetter)
        let color2 = colorFromLetter(letter: secondLetter)

        // Create a gradient
        return LinearGradient(gradient: Gradient(colors: [color1, color2]),
                              startPoint: .topLeading, endPoint: .bottomTrailing)
    }

    // Helper function to map a letter to a SwiftUI Color based on its Unicode value
    func colorFromLetter(letter: Character) -> Color {
        let unicodeValue = Int(letter.unicodeScalars.first?.value ?? 0)
        
        // Use a consistent hashing mechanism for color generation
        srand48(unicodeValue)
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return Color(red: red, green: green, blue: blue)
    }

    // SwiftUI View using the gradient
    let inputString: String

    var body: some View {
        let gradient = gradientFromFirstTwoLetters(input: inputString)
        
        Image(systemName: "doc.text.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(gradient)
            .frame(width: 40, height: 40)
            .cornerRadius(5)
            //.shadow(radius: 8)
    }
}
