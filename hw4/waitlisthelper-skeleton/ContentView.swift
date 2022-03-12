//
//  ContentView.swift
//  waitlisthelper-skeleton
//
//  Created by Jordan Yee on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var friends: Double = 0
    @State var text = ""
    
    var body: some View {
            //YOUR CODE HERE (NavView)//
        NavigationView{
                //YOUR CODE HERE (TabView)//
            TabView {
                    ZStack {
                        //YOUR CODE HERE (background)//
                        Image("calculate_background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)

                        VStack {
                            Spacer()
                            //YOUR CODE HERE (title)//
                            Text("WILL YOU GET OFF THE WAITLIST")
                                .padding()
                                .foregroundColor(Color.black)
                                .font(.system(size: 40, weight: .bold))
                                .font(.largeTitle)
                                
                                
                            

                            Spacer()
                            HStack {
                                //YOUR CODE HERE (description)//
                                Text("Place on Waitlist:  \(waitlistPlace , specifier: "%.f")")
                                Spacer()
                            }
                            //YOUR CODE HERE (slider)//
                            Slider(
                                        value: $waitlistPlace,
                                        in: 0...100
                                    )
                                    
                           
                            HStack {
                                //YOUR CODE HERE (description)//
                                Text("Class size:  \(classSize , specifier: "%.f")")
                                Spacer()
                            }
                            //YOUR CODE HERE (slider)//
                            Slider(
                                        value: $classSize,
                                        in: 0...100
                                    )
                            NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() } .padding()
                            
                            Button("CALCULATE") {
                                //YOUR CODE HERE (calculate)//
                                calculateProbability(waitlistPlace: Int(waitlistPlace), classSize: Int(classSize))
                                text = getFeedbackText()
                                calculate = true
                                
                            
                            }   .buttonStyle(CustomButton())
                                
                            
                            Spacer()
                            
                        } .padding()
                        
                    }
            

                    .navigationBarTitle("")
                    .navigationBarHidden(false)
                    .tabItem{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
            
        
                    
                    //DIY VIEW GOES HERE//
        ZStack {
            Image("calculate_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                
                    Text("FRIEND \n COUNT:  \(friends , specifier: "%.f")")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(Color.black)
                        .padding()
                    
                
                    Button("ADD FRIEND") {
                    friends = friends + 1

                    }.buttonStyle(CustomButton())

                
                }

        }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Friends")
            }

                    
            }
        }
                
        }
    func calculateProbability(waitlistPlace: Int, classSize: Int) {
        //YOUR CODE HERE//
        let tenth = classSize / 10
               if  (waitlistPlace <= tenth) {
                   probability = 100
               } else if (waitlistPlace > tenth * 2) {
                   probability = 0
               } else {
                   probability = 100 - Int(((Float(waitlistPlace - tenth) / Float(tenth))*100))
               }
    }
    
    func getFeedbackText() -> String {
        for tuple in feedbackModel {
            if probability >= tuple.0 {
                return tuple.1
            }
        }
        return "Error"
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    
    var body: some View {

        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    //YOUR CODE HERE (button back)//
                    Button(action: {
                                    self.presentation.wrappedValue.dismiss()
                                  }) {
                                  Image(systemName: "arrow.left")
                                      .foregroundColor(.white)
                                  }
                                  .navigationBarHidden(true)
                    Spacer()
                } .padding()
                Spacer()
                Text("PROBABILITY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(prob)%")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(Color.white)
                Text("\(feedback)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
            } .padding()
        }
        
    }
}

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //YOUR CODE HERE (button style)//
            .padding()
            .background(Color.cyan)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .scaleEffect(configuration.isPressed ? 1.2 : 1)
                        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
