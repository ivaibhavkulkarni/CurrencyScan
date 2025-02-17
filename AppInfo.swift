//
//  AppInfo.swift
//  Currency Conversion and Detection
//
//  Created by Vaibhav kulkarni on 17/02/25.
//

import SwiftUI

struct AppInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            VStack(spacing:60){
                HStack{
                    Image(systemName:"scanner")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.black)
                    Text("Here, you can scan a currency note, and the system will provide the result through audio. This feature helps in easily identifying different currencies without any manual effort.")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                )
                
                HStack{
                    Image(systemName:"repeat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.black)
                    Text("You can also check real-time currency exchange details, such as the conversion rate of 1 Indian Rupee to US Dollar and other global currencies. Stay updated with the latest exchange rates at your convenience.")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                    )
            }.padding(20)
        }
        
        Button("Done"){
            dismiss()
        }
        .font(.title3)
        .frame(width: 120, height: 18)
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(40)
        .padding()
    }
}


#Preview {
    AppInfo()
}
