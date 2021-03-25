/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Represents a rational number.
public struct DGIRational {
    public typealias RawValue = WinSDK.DXGI_RATIONAL 
    internal var rawValue: RawValue

    /// An unsigned integer value representing the top of the rational number.
    public var numerator: UInt32 {
        get {
            return rawValue.Numerator
        }
        set {
            rawValue.Numerator = newValue
        }
    }

    /// An unsigned integer value representing the bottom of the rational number.
    public var denominator: UInt32 {
        get {
            return rawValue.Denominator
        }
        set {
            rawValue.Denominator = newValue
        }
    }

    /** Represents a rational number.
    - parameter numerator: An unsigned integer value representing the top of the rational number.
    - parameter denominator: An unsigned integer value representing the bottom of the rational number.
    */
    public init(numerator: UInt32, denominator: UInt32) {
        self.rawValue = RawValue(Numerator: numerator, Denominator: denominator)
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DGIRational")
public typealias DXGI_RATIONAL = DGIRational

#endif
