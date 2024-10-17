//
//  RootView.swift
//  DailyMoments
//
//  Created by 이건우 on 10/17/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                ArchiveView()
                    .tabItem {
                        Image(systemName: "archivebox")
                        Text("Archive")
                    }
            }
            .tint(.black)
        }
    }
}

#Preview {
    RootView()
}
