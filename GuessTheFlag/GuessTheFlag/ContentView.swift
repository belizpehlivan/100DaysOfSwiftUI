//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beliz on 1.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreAlert = ""
    @State private var score = 0
    @State private var numOfQuestions = 0
    @State private var isGameOver = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US" ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var maxNumOfQuestions = 3
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.15, green: 0.3, blue: 0.65), location: 0.4),
                .init(color: Color(red: 0.7, green: 0.2, blue: 0.3), location: 0.6)],
                center: .top, startRadius: 5, endRadius: 900)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    
                VStack (spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.bold))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .alert(scoreAlert, isPresented: $showingScore) {
            Button("Continue", action: newQuestion)
        } message: {
            Text("Your score: \(score)")
        }
        
        .alert("Game Over!\nFinal score is \(score)", isPresented: $isGameOver) {
            Button("Restart Game", action: restartGame)
        }
    }
 
    func restartGame() {
        score = 0
        numOfQuestions = 0
        newQuestion()
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreAlert = "Correct"
            score += 1
        } else {
            scoreAlert = "Wrong!\nThat’s the flag of \(countries[number])."
        }

        showingScore = true
        numOfQuestions += 1
        
        if numOfQuestions == maxNumOfQuestions {
            isGameOver = true
        }
    }

    func newQuestion() {
        if numOfQuestions != maxNumOfQuestions {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
