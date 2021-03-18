/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the result of a call to [ID3D12Device5::CheckDriverMatchingIdentifier](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/nf-d3d12-id3d12device5-checkdrivermatchingidentifier) which queries whether serialized data is compatible with the current device and driver version.
public enum DriverMatchingIdentifierStatus {
    public typealias RawValue = WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_STATUS
    ///	Serialized data is compatible with the current device/driver.
    case compatibleWithDevice
    ///	The specified [D3D12_SERIALIZED_DATA_TYPE](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/ne-d3d12-d3d12_serialized_data_type) specified is unknown or unsupported.
    case unsupportedType
    ///	Format of the data in [D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/ns-d3d12-d3d12_serialized_data_driver_matching_identifier) is unrecognized. This could indicate either corrupt data or the identifier was produced by a different hardware vendor.
    case unrecognized
    ///	Serialized data is recognized, but its version is not compatible with the current driver. This result may indicate that the device is from the same hardware vendor but is an incompatible version.
    case incompatibleVersion
    ///	[D3D12_SERIALIZED_DATA_TYPE](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/ne-d3d12-d3d12_serialized_data_type) specifies a data type that is not compatible with the type of serialized data. As long as there is only a single defined serialized data type this error cannot not be produced.
    case incompatibleType
    /// Used when Swift has no case defined. This could happen if new values are added to the Windows SDK
    case unimplemented(RawValue)
    
    public var rawValue: RawValue {
        switch self {
        case .compatibleWithDevice:
            return WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_COMPATIBLE_WITH_DEVICE
        case .unsupportedType:
            return WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_UNSUPPORTED_TYPE
        case .unrecognized:
            return WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_UNRECOGNIZED
        case .incompatibleVersion:
            return WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_INCOMPATIBLE_VERSION
        case .incompatibleType:
            return WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_INCOMPATIBLE_TYPE
        case let .unimplemented(rawValue):
            return rawValue
        }
    }

    public init(_ rawValue: RawValue) {
        switch rawValue {
        case WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_COMPATIBLE_WITH_DEVICE:
            self = .compatibleWithDevice
        case WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_UNSUPPORTED_TYPE:
            self = .unsupportedType
        case WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_UNRECOGNIZED:
            self = .unrecognized
        case WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_INCOMPATIBLE_VERSION:
            self = .incompatibleVersion
        case WinSDK.D3D12_DRIVER_MATCHING_IDENTIFIER_INCOMPATIBLE_TYPE:
            self = .incompatibleType
        default:
            self = .unimplemented(rawValue)
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DriverMatchingIdentifierStatus")
public typealias D3D12_DRIVER_MATCHING_IDENTIFIER_STATUS = DriverMatchingIdentifierStatus

public extension DriverMatchingIdentifierStatus  {
    @available(*, deprecated, renamed: "compatibleWithDevice")
    static let D3D12_DRIVER_MATCHING_IDENTIFIER_COMPATIBLE_WITH_DEVICE = Self.compatibleWithDevice

    @available(*, deprecated, renamed: "unsupportedType")
    static let D3D12_DRIVER_MATCHING_IDENTIFIER_UNSUPPORTED_TYPE = Self.unsupportedType

    @available(*, deprecated, renamed: "unrecognized")
    static let D3D12_DRIVER_MATCHING_IDENTIFIER_UNRECOGNIZED = Self.unrecognized

    @available(*, deprecated, renamed: "incompatibleVersion")
    static let D3D12_DRIVER_MATCHING_IDENTIFIER_INCOMPATIBLE_VERSION = Self.incompatibleVersion

    @available(*, deprecated, renamed: "incompatibleType")
    static let D3D12_DRIVER_MATCHING_IDENTIFIER_INCOMPATIBLE_TYPE = Self.incompatibleType
}

#endif
