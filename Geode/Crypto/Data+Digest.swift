//
//  Data+Digest.swift
//  GradingTest
//
//  Created by envy.chen on 30/09/2016.
//  Copyright © 2016 DoSoMi. All rights reserved.
//

import Foundation
import CommonCrypto

extension Data {
    // MARK: - Digest
    
    public var md2: Data {
        return digest(Digest.md2)
    }
    
    public var md4: Data {
        return digest(Digest.md4)
    }
    
    public var md5: Data {
        return digest(Digest.md5)
    }
    
    public var sha1: Data {
        return digest(Digest.sha1)
    }
    
    public var sha224: Data {
        return digest(Digest.sha224)
    }
    
    public var sha256: Data {
        return digest(Digest.sha256)
    }
    
    public var sha384: Data {
        return digest(Digest.sha384)
    }
    
    public var sha512: Data {
        return digest(Digest.sha512)
    }
    
    private func digest(_ function: ((UnsafeRawPointer, UInt32) -> [UInt8])) -> Data {
        var hash: [UInt8] = []
        withUnsafeBytes { hash = function($0, UInt32(count)) }
        return Data(bytes: hash, count: hash.count)
    }
    
    // MARK: - Internal
    
    var hex: String {
        var string = ""
        enumerateBytes { pointer, count, _ in
            for i in 0..<count {
                string += String(format: "%02x", pointer[i])
            }
        }
        return string
    }
}
