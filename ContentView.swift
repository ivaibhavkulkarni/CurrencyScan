import SwiftUI

struct ContentView: View {
    @State private var isConvertMode = false
    @State var showAppInfo = false

    
    var body: some View {
        VStack {
            Text(isConvertMode ? "Convert the Currency" : "Scan the Currency")
                .font(.title)
                .fontWeight(.bold)
            
            Image(systemName: isConvertMode ? "repeat" : "scanner")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.black)
            
            Spacer()
            
            // Main Container
            
            Text(isConvertMode ? "Converter Container" : "Scanner Container")
            
            Spacer()
            
            // Container for Horizontal images (Buttons)
            
            HStack {
                Image(systemName: "scanner")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isConvertMode = false
                    }
                
                Image(systemName: "arrow.right.and.line.vertical.and.arrow.left")
                    .mask(Rectangle().frame(width: 5, height: 50))
                
                Image(systemName: "repeat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isConvertMode.toggle()
                    }
            }
            
            Button(isConvertMode ? "Convert" : "Scan") {
                print(isConvertMode ? "Convert Button Clicked" : "Scan Button Clicked")
            }
            .font(.title3)
            .frame(width: 120, height: 18)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(40)
            .padding()
        }
        
        Spacer()
        
        HStack{
            Spacer()
            Button{
                showAppInfo.toggle()
                print(showAppInfo)
            } label:{
                Image(systemName: "info.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
            }
            .padding(.trailing)
        }
        .sheet(isPresented: $showAppInfo){
            AppInfo()
        }
    }
}

