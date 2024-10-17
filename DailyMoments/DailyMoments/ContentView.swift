//
//  ContentView.swift
//  DailyMoments
//
//  Created by 이건우 on 10/17/24.
//

import SwiftUI
import UIKit
import UnsplashPhotoPicker

struct ContentView: View {
    @State private var isPickerPresented = false
    @State private var selectedImageUrl: URL?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("DailyMoments")
                    .font(.system(size: 40, weight: .regular))
                
                Text("오늘 당신의 하루를 키워드로 표현해주세요.")
                    .fontWeight(.ultraLight)
                    .padding(.bottom, 40)
                
                Button("일기 쓰러가기 →") {
                    isPickerPresented.toggle()
                }
                .foregroundStyle(.black.opacity(0.6))
            }
            .sheet(isPresented: $isPickerPresented) {
                UnsplashImagePicker(selectedImageUrl: $selectedImageUrl)
            }
        }
    }
}

#Preview {
    ContentView()
}
