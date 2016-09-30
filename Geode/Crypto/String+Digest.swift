//
//  String+Digest.swift
//  GradingTest
//
//  Created by envy.chen on 30/09/2016.
//  Copyright © 2016 DoSoMi. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    // MARK: - Digest
    
    public var md2: String? {
        return hashData?.md2.hex
    }
    
    public var md4: String? {
        return hashData?.md4.hex
    }
    
    public var md5: String? {
        return hashData?.md5.hex
    }
    
    public var sha1: String? {
        return hashData?.sha1.hex
    }
    
    public var sha224: String? {
        return hashData?.sha224.hex
    }
    
    public var sha256: String? {
        return hashData?.sha256.hex
    }
    
    public var sha384: String? {
        return hashData?.sha384.hex
    }
    
    public var sha512: String? {
        return hashData?.sha512.hex
    }
    
    // MARK: - Private
    
    private var hashData: Data? {
        return data(using: .utf8)
    }
}
