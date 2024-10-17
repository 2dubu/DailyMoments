//
//  UnsplashImagePicker.swift
//  DailyMoments
//
//  Created by 이건우 on 10/17/24.
//

import SwiftUI
import UnsplashPhotoPicker

struct UnsplashImagePicker: UIViewControllerRepresentable {
    @Binding private var selectedImageUrl: URL?

    init(selectedImageUrl: Binding<URL?>) {
        self._selectedImageUrl = selectedImageUrl
    }

    private var configuration: UnsplashPhotoPickerConfiguration {
        UnsplashPhotoPickerConfiguration(
            accessKey: accessKey,
            secretKey: secretKey,
            allowsMultipleSelection: false
        )
    }

    private var accessKey: String {
        Bundle.main.infoDictionary?["ACCESS_KEY"] as? String ?? ""
    }

    private var secretKey: String {
        Bundle.main.infoDictionary?["SECRET_KEY"] as? String ?? ""
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<UnsplashImagePicker>) -> UnsplashPhotoPicker {
        let unsplashPhotoPicker = UnsplashPhotoPicker(configuration: configuration)
        unsplashPhotoPicker.photoPickerDelegate = context.coordinator
        return unsplashPhotoPicker
    }
    
    func makeCoordinator() -> UnsplashImagePicker.Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: UnsplashPhotoPickerDelegate {
        
        var parent: UnsplashImagePicker
        
        init(_ parent: UnsplashImagePicker) {
            self.parent = parent
        }
        
        func unsplashPhotoPicker(
            _ photoPicker: UnsplashPhotoPicker,
            didSelectPhotos photos: [UnsplashPhoto]
        ) {
            guard let photoURL = photos.first?.links[.download] else { return }
            parent.selectedImageUrl = photoURL
            print(photoURL)
        }
        
        func unsplashPhotoPickerDidCancel(_ photoPicker: UnsplashPhotoPicker) {
            print("Unsplash photo picker did cancel")
        }
    }
    
    func updateUIViewController(
        _ uiViewController: UnsplashPhotoPicker,
        context: UIViewControllerRepresentableContext<UnsplashImagePicker>
    ) { }
}