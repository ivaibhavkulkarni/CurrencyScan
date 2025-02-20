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
                    .foregroundStyle(.black)
            }
            .padding(.trailing)
        }
        .sheet(isPresented: $showAppInfo){
            AppInfo()
        }
    }
}

