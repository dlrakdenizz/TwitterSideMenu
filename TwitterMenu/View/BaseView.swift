//
//  BaseView.swift
//  TwitterMenu
//
//  Created by Dilara Akdeniz on 31.10.2023.
//

import SwiftUI

struct BaseView: View {
    
    @State var showMenu: Bool = false
    
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @GestureState var gestureOffset: CGFloat = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab = "Home"
    
    var body: some View {
        
        let sideBarWith = getRect().width - 90
        
        NavigationView {
            
            HStack(spacing: 0) {
                
                SideMenu(showMenu: $showMenu)
                
                VStack(spacing: 0) {
                    
                    TabView(selection: $currentTab) {
                        
                        Home(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("house")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("magnifyingglass")
                        
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("bell")
                        
                        Text("Messages")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("message")
                    }
                    
                    VStack(spacing: 0) {
                        
                        Divider()
                        
                        HStack(spacing: 0) {
                            
                            TabButton(image: "house")
                            
                            TabButton(image: "magnifyingglass")
                            
                            TabButton(image: "bell")
                            
                            TabButton(image: "message")
                            
                        }
                        .padding([.top], 15)
                    }
                }
                .frame(width: getRect().width)
                .overlay(
                
                    Rectangle()
                        .fill(
                            
                            Color.primary
                                .opacity(Double((offset / sideBarWith) / 5))
                    )
                    .ignoresSafeArea(.container, edges: .vertical)
                    .onTapGesture {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }
                )
            }
            .frame(width: getRect().width + sideBarWith)
            .offset(x: -sideBarWith / 2)
            .offset(x: offset > 0 ? offset : 0)
            .gesture(
                
                DragGesture()
                    .updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
            
            )
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            
            if showMenu && offset == 0 {
                offset = sideBarWith
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sideBarWith {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
    }
    
    func onChange() {
        let sideBarWidth = getRect().width - 90
        
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    func onEnd(value: DragGesture.Value) {
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation{
            
            if translation > 0 {
                
                if translation > (sideBarWidth / 2) {
                    offset = sideBarWidth
                    showMenu = true
                } else {
                    
                    if offset == sideBarWidth {
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
            } else {
                
                if -translation > (sideBarWidth / 2) {
                    offset = 0
                    showMenu = false
                } else {
                    
                    if offset == 0 || !showMenu {
                        return
                    }
                    offset = sideBarWidth
                    showMenu = true
                }
                
                
            }
        }
        
        lastStoredOffset = offset
    }

    @ViewBuilder
    func TabButton(image: String) -> some View {
        
        Button {
            withAnimation{currentTab = image}
        } label: {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 23, height: 22)
                .foregroundColor(currentTab == image ? .primary : .gray)
                .frame(maxWidth: .infinity)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
