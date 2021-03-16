/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

1TypeDocumentationComment
public struct 1SwiftName: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No flags.
    //static let none = 1SwiftName(rawValue: WinSDK.1D3D12_FLAG_NONE_NAME.rawValue)

    1MemberDocumentationComment
    static let 1name = 1SwiftName(rawValue: WinSDK.1D3D12_FLAG_NAME.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "1SwiftName")
public typealias 1D3D12_FLAGS_NAME = 1SwiftName

public extension 1SwiftName {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let 1D3D12_FLAG_NONE_NAME: 1SwiftName = []

    @available(*, deprecated, renamed: "1thisName")
    static let 1D3D12_FLAG_NAME = Self.1thisName
}

#endif
