//
//  SmallServices.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-28.
//

import Foundation
import CommonCrypto


public class SmallServices {
    public static func sha256(_ str: String) -> String {
        if let data = str.data(using: .utf8) {
            var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            data.withUnsafeBytes {
                _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
            }
            return hash.map { String(format: "%02hhx", $0) }.joined()
        }
        return ""
    }
}
