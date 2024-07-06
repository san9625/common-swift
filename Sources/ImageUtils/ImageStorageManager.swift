//
//  File.swift
//  
//
//  Created by 吉川創麻 on 2024/07/06.
//

import Foundation
import UIKit

public class ImageStorageManager {
    static let shared = ImageStorageManager()
    private let fileManager = FileManager.default
    private var documentsDirectory: URL {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    func saveImage(_ image: UIImage, name: String) -> Bool {
        let fileURL = documentsDirectory.appendingPathComponent(name)
        //guard let data = image.jpegData(compressionQuality: 1) else { return false }
        guard let data = image.pngData() else { return false }
        do {
            try data.write(to: fileURL)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }

    func loadImage(name: String) -> UIImage? {
        let fileURL = documentsDirectory.appendingPathComponent(name)
        guard let imageData = try? Data(contentsOf: fileURL) else { return nil }
        return UIImage(data: imageData)
    }
}

