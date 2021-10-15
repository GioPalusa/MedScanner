//
//  MainView.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-15.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewRoute = ViewRouter()
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            switch viewRoute.currentPage {
            case .home:
                VStack {
                    Text("Home")
                    EmptyView()
                }
            case .search:
                VStack {
                    Text("search")
                    EmptyView()
                }
                
            case .favourites:
                VStack {
                    Text("favorites")
                    EmptyView()
                }
            }
            Spacer()
            
            HStack(spacing: 100) {
                TabButton(page: .home)
                TabButton(page: .favourites)
                TabButton(page: .search)
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
    func TabButton(page: Page) -> some View {
        
        Button {
            withAnimation {
                viewRoute.currentPage = page
            }
        } label: {
            Image(systemName: page.imageName)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(
                    viewRoute.currentPage == page ? Color.black
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


class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}


enum Page {
    case home
    case search
    case favourites
    
    var imageName: String {
        switch self {
        case .home: return "house"
        case .favourites: return "plus.rectangle.on.folder"
        case .search: return "person.crop.circle.fill.badge.plus"
        }
    }
}
