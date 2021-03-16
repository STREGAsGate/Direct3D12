/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

1TypeDocumentationComment
public enum 1SwiftName {
    1CaseDocumentationComment
    case 1this

    internal var rawValue: WinSDK.1D3D12_ENUMS_NAME {
        switch self {
        case .1this:
            return WinSDK.1D3D12_ENUM_NAME
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "1SwiftName")
public typealias 1D3D12_ENUMS_NAME = 1SwiftName

public extension 1SwiftName  {
    @available(*, deprecated, renamed: "1this")
    static let 1D3D12_ENUM_NAME = Self.1this
}

#endif
