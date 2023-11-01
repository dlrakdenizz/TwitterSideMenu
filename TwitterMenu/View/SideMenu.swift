//
//  SideMenu.swift
//  TwitterMenu
//
//  Created by Dilara Akdeniz on 31.10.2023.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 12) {
                
                Image("Select the Image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Text("Dilara Akdeniz")
                    .font(.title2.bold())
                
                Text("@dlrakdenizz")
                    .font(.callout)
                
                HStack(spacing: 12) {
                    
                    Button {
                        
                    } label: {
                        
                        Label {
                            Text("Followers")
                        } icon: {
                            Text("189")
                                .fontWeight(.bold)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        
                        Label {
                            Text("Following")
                        } icon: {
                            Text("1.2M")
                                .fontWeight(.bold)
                        }
                    }
                    
                }
                .foregroundColor(.primary)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: 45) {
                        
                        TabButton(title: "Profile", image: "person")
                        
                        TabButton(title: "Lists", image: "list.dash")
                        
                        TabButton(title: "Topics", image: "questionmark.diamond")
                        
                        TabButton(title: "Bookmarks", image: "bookmark")
                        
                        TabButton(title: "Moments", image: "arrowshape.turn.up.right.fill")
                        
                        TabButton(title: "Purchases", image: "purchased")
                        
                        TabButton(title: "Monetization", image: "checkmark.seal.fill")
                        
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 45)
                    
                    Divider()
                    
                    TabButton(title: "Twitter Ads", image: "newspaper")
                        .padding()
                        .padding(.leading)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 30) {
                        
                        Button("Settings And Privacy") {
                            
                        }
                        
                        Button("Help Center") {
                            
                        }
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                    
                }
            }
            
            VStack(spacing: 0) {
                
                Divider()
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "lightbulb.circle.fill")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "qrcode")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                    }
                }
                .padding([.horizontal, .top], 15)
                .foregroundColor(.primary)
            }
        }
        .padding(.top)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String)->some View{
        
        NavigationLink {
            
            Text("\(title) View")
                .navigationTitle(title)
            
        } label: {
            
            HStack(spacing: 14) {
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
