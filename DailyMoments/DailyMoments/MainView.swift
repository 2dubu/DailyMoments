//
//  MainView.swift
//  DailyMoments
//
//  Created by 이건우 on 10/17/24.
//

import SwiftUI
import UIKit
import UnsplashPhotoPicker

struct MainView: View {
    @State private var isPickerPresented = false
    @State private var selectedImageUrl: URL?
    @State private var showWriteView = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("DailyMoments")
                .font(.system(size: 30, weight: .regular))
            
            Text("오늘도 당신의 하루를 기록해주세요.")
                .fontWeight(.ultraLight)
                .padding(.bottom, 40)
            
            Button("기록하러 가기 →") {
                isPickerPresented.toggle()
            }
            .foregroundStyle(.black.opacity(0.6))
        }
        .sheet(isPresented: $isPickerPresented) {
            UnsplashImagePicker(selectedImageUrl: $selectedImageUrl) {
                showWriteView = true
            }
        }
        .navigationDestination(isPresented: $showWriteView) {
            WriteView(imageUrl: selectedImageUrl)
        }
    }
}
