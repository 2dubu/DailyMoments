//
//  WriteView.swift
//  DailyMoments
//
//  Created by 이건우 on 10/17/24.
//

import SwiftUI

struct WriteView: View {
    @FocusState private var isFocused: Bool
    @State private var content: String = ""
    private let imageUrl: URL?
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                LoadableImageView(imageUrl: imageUrl)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .myShadow2()
                
                TextField("Write your today's story", text: $content)
                    .focused($isFocused)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                
                Spacer(minLength: 200)
            }
            .scrollIndicators(.never)
            
            Button {
                DiaryManager.shared.saveEntry(imageUrl: imageUrl, content: content, date: Date())
                
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 60)
                    .foregroundStyle(.black)
                    .overlay {
                        Text("기록하기")
                            .foregroundStyle(.white)
                    }
            }
            .padding(.bottom, 12)
        }
    }
}
