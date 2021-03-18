/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies comparison options.
public enum ComparisonFunction {
    ///	Never pass the comparison.
    case neverSucceed
    ///	If the source data is less than the destination data, the comparison passes.
    case lessThan
    ///	If the source data is equal to the destination data, the comparison passes.
    case equalTo
    ///	If the source data is less than or equal to the destination data, the comparison passes.
    case lessThanOrEqualTo
    ///	If the source data is greater than the destination data, the comparison passes.
    case greaterThan
    ///	If the source data is not equal to the destination data, the comparison passes.
    case notEqualTo
    ///	If the source data is greater than or equal to the destination data, the comparison passes.
    case greaterThanOrEqualTo
    ///	Always pass the comparison.
    case alwaysSuccees

    internal var rawValue: WinSDK.D3D12_COMPARISON_FUNC {
        switch self {
        case .neverSucceed:
            return WinSDK.D3D12_COMPARISON_FUNC_NEVER
        case .lessThan:
            return WinSDK.D3D12_COMPARISON_FUNC_LESS
        case .equalTo:
            return WinSDK.D3D12_COMPARISON_FUNC_EQUAL
        case .lessThanOrEqualTo:
            return WinSDK.D3D12_COMPARISON_FUNC_LESS_EQUAL
        case .greaterThan:
            return WinSDK.D3D12_COMPARISON_FUNC_GREATER
        case .notEqualTo:
            return WinSDK.D3D12_COMPARISON_FUNC_NOT_EQUAL
        case .greaterThanOrEqualTo:
            return WinSDK.D3D12_COMPARISON_FUNC_GREATER_EQUAL
        case .alwaysSuccees:
            return WinSDK.D3D12_COMPARISON_FUNC_ALWAYS
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ComparisonFunction")
public typealias D3D12_COMPARISON_FUNC = ComparisonFunction

public extension ComparisonFunction  {
    @available(*, deprecated, renamed: "neverSucceed")
    static let D3D12_COMPARISON_FUNC_NEVER = Self.neverSucceed

    @available(*, deprecated, renamed: "lessThan")
    static let D3D12_COMPARISON_FUNC_LESS = Self.lessThan

    @available(*, deprecated, renamed: "equalTo")
    static let D3D12_COMPARISON_FUNC_EQUAL = Self.equalTo

    @available(*, deprecated, renamed: "lessThanOrEqualTo")
    static let D3D12_COMPARISON_FUNC_LESS_EQUAL = Self.lessThanOrEqualTo

    @available(*, deprecated, renamed: "greaterThan")
    static let D3D12_COMPARISON_FUNC_GREATER = Self.greaterThan

    @available(*, deprecated, renamed: "notEqualTo")
    static let D3D12_COMPARISON_FUNC_NOT_EQUAL = Self.notEqualTo

    @available(*, deprecated, renamed: "greaterThanOrEqualTo")
    static let D3D12_COMPARISON_FUNC_GREATER_EQUAL = Self.greaterThanOrEqualTo

    @available(*, deprecated, renamed: "alwaysSuccees")
    static let D3D12_COMPARISON_FUNC_ALWAYS = Self.alwaysSuccees
}

#endif
