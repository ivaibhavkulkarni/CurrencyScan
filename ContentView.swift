import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Scan the Currency")
                .font(.title)
                .fontWeight(.bold)
            
            Image(systemName: "scanner")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.black)
        }
        
        Spacer()
        
        Text("Scanner Container") // [Scanner]
        
        Spacer()
        
        HStack {
            Image(systemName: "scanner")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.black)
                .contentShape(Rectangle()) // Ensures the tap gesture is recognized
                .onTapGesture {
                    print("Scanner button tapped!")
                }
            
            Image(systemName: "arrow.right.and.line.vertical.and.arrow.left")
                .mask(Rectangle().frame(width: 5, height:50))
            
            
            Image(systemName: "repeat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .contentShape(Rectangle()) // Ensures the tap gesture is recognized
                    .onTapGesture {
                        print("Repeat button tapped!")
                }
        }
        
        Button("Scan") {
            // Action for the Scan button
            print("Scan Button Clicked")
        }
        .font(.title2)
        .frame(width: 120, height: 20)
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()
    }
}


