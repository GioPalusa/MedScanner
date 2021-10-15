//
//  MainView.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-15.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab = "Home"
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("Home")
                    .modifier(BGModifier())
                    .tag("home")
                Text("Add")
                    .modifier(BGModifier())
                    .tag("add")
                Text("Add")
                    .modifier(BGModifier())
                    .tag("add")
            }
            
            HStack(spacing: 100) {
                TabButton(image: "house")
                TabButton(image: "plus.rectangle.on.folder")
                TabButton(image: "person.crop.circle.fill.badge.plus")
            }
            .padding(.top)
            .frame(maxWidth: .infinity)
            .background(
                Color.gray.opacity(0.15)
                    .ignoresSafeArea()
            )
        }
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(
                    currentTab == image ? Color.black
                    : Color.gray.opacity(0.8)
                )
        }
        
    }
}

struct BGModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
