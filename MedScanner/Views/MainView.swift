//
//  MainView.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-15.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewRoute = ViewRouter()

    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            ScannerView()
                .tabItem {
                    tabIcon(selection == 0 ? Page.home.activeImage : Page.home.inactiveImage)
                }
                .tag(0)
            MedicineList()
                .tabItem {
                    tabIcon(selection == 1 ? Page.favourites.activeImage : Page.favourites.inactiveImage)
                }
                .tag(1)
        }
    }

    func tabIcon(_ image: Image) -> some View {
        image
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
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
    case favourites
    
    var activeImage: Image {
        switch self {
        case .home: return Image("home_active_icon")
        case .favourites: return Image("user_list_active_icon")
        }
    }

    var inactiveImage: Image {
        switch self {
        case .home: return Image("home_inactive_icon")
        case .favourites: return Image("user_list_inactive_icon")
        }
    }
}
