//
//  Home.swift
//  TwitterMenu
//
//  Created by Dilara Akdeniz on 31.10.2023.
//

import SwiftUI

struct Home: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack {
            
            VStack (spacing: 0) {
                
                HStack {
                    
                    Button {
                        withAnimation{showMenu.toggle()}
                    } label: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 25)
                            .padding()
                            .foregroundColor(.primary)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        
                        Text("Timeline View")
                            .navigationTitle("Timeline")
                        
                    } label: {
                        Image(systemName: "timer")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .padding()
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                Divider()

            }
            .overlay(
            
                Image(systemName: "applelogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            )
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
