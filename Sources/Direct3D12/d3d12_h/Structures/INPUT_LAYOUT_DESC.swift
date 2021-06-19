/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the input-buffer data for the input-assembler stage.
public struct D3DInputLayoutDesription {
    public typealias RawValue = WinSDK.D3D12_INPUT_LAYOUT_DESC

    /// An array of D3D12_INPUT_ELEMENT_DESC structures that describe the data types of the input-assembler stage.
    public var elementDescriptions: [D3DInputElementDescription]

    /** Describes the input-buffer data for the input-assembler stage.
    - parameter elementDescriptions: An array of D3D12_INPUT_ELEMENT_DESC structures that describe the data types of the input-assembler stage.
    */
    public init(elementDescriptions: [D3DInputElementDescription]) {
        self.elementDescriptions = elementDescriptions
    }

    internal func withUnsafeRawValue<ResultType>(_ body: (RawValue) throws -> ResultType) rethrows -> ResultType {
        func withUnsafeParameter(at index: Int, _ pInputElementDescs: inout [D3DInputElementDescription.RawValue], _ body: (RawValue) throws -> ResultType) rethrows -> ResultType {
            if elementDescriptions.indices.isEmpty || index == elementDescriptions.indices.last! + 1 {
                return try pInputElementDescs.withUnsafeBufferPointer {pInputElementDescs in
                    let pInputElementDescs = pInputElementDescs.baseAddress!
                    let NumElements = UInt32(elementDescriptions.count)
                    let rawValue = RawValue(pInputElementDescs: pInputElementDescs, NumElements: NumElements)
                    return try body(rawValue)
                }
            }

            return try elementDescriptions[index].withUnsafeRawValue {
                pInputElementDescs.insert($0, at: index)
                return try withUnsafeParameter(at: index + 1, &pInputElementDescs, body)
            }
        }

        var pInputElementDescs: [D3DInputElementDescription.RawValue] = []
        pInputElementDescs.reserveCapacity(elementDescriptions.count)
        return try withUnsafeParameter(at: 0, &pInputElementDescs, body)
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DInputLayoutDesription")
public typealias D3D12_INPUT_LAYOUT_DESC = D3DInputLayoutDesription

#endif
