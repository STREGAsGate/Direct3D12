/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Defines constants that specify logical operations to configure for a render target.
public enum LogicOperation {
    ///	Clears the render target (0).	
    case clear
    ///	Sets the render target ( 1).	
    case set
    ///	Copys the render target (s source from Pixel Shader output).	
    case copy
    ///	Performs an inverted-copy of the render target (~s).	
    case invertedCopy
    ///	No operation is performed on the render target (d destination in the Render Target View).	
    case none
    ///	Inverts the render target (~d).	
    case invert
    ///	Performs a logical AND operation on the render target (s & d).	
    case logicalAnd
    ///	Performs a logical NAND operation on the render target (~(s & d)).	
    case logicalNand
    ///	Performs a logical OR operation on the render target (s	d).
    case logicalOr
    ///	Performs a logical NOR operation on the render target (~(s	d)).
    case logicalNor
    ///	Performs a logical XOR operation on the render target (s ^ d).	
    case logicalXor
    ///	Performs a logical equal operation on the render target (~(s ^ d)).	
    case logicalEqual
    ///	Performs a logical AND and reverse operation on the render target (s & ~d).	
    case logicalAndReverse
    ///	Performs a logical AND and invert operation on the render target (~s & d).	
    case logicalAndInverse
    ///	Performs a logical OR and reverse operation on the render target (s	~d).
    case logicalOrReverse
    ///	Performs a logical OR and invert operation on the render target (~s	d).
    case logicalOrInverse

    internal var rawValue: WinSDK.D3D12_LOGIC_OP {
        switch self {
        case .clear:
            return WinSDK.D3D12_LOGIC_OP_CLEAR
        case .set:
            return WinSDK.D3D12_LOGIC_OP_SET
        case .copy:
            return WinSDK.D3D12_LOGIC_OP_COPY
        case .invertedCopy:
            return WinSDK.D3D12_LOGIC_OP_COPY_INVERTED
        case .none:
            return WinSDK.D3D12_LOGIC_OP_NOOP
        case .invert:
            return WinSDK.D3D12_LOGIC_OP_INVERT
        case .logicalAnd:
            return WinSDK.D3D12_LOGIC_OP_AND
        case .logicalNand:
            return WinSDK.D3D12_LOGIC_OP_NAND
        case .logicalOr:
            return WinSDK.D3D12_LOGIC_OP_OR
        case .logicalNor:
            return WinSDK.D3D12_LOGIC_OP_NOR
        case .logicalXor:
            return WinSDK.D3D12_LOGIC_OP_XOR
        case .logicalEqual:
            return WinSDK.D3D12_LOGIC_OP_EQUIV
        case .logicalAndReverse:
            return WinSDK.D3D12_LOGIC_OP_AND_REVERSE
        case .logicalAndInverse:
            return WinSDK.D3D12_LOGIC_OP_AND_INVERTED
        case .logicalOrReverse:
            return WinSDK.D3D12_LOGIC_OP_OR_REVERSE
        case .logicalOrInverse:
            return WinSDK.D3D12_LOGIC_OP_OR_INVERTED
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "LogicOperation")
public typealias D3D12_LOGIC_OP = LogicOperation

public extension LogicOperation  {
    @available(*, deprecated, renamed: "clear")
    static let D3D12_LOGIC_OP_CLEAR = Self.clear

    @available(*, deprecated, renamed: "set")
    static let D3D12_LOGIC_OP_SET = Self.set

    @available(*, deprecated, renamed: "copy")
    static let D3D12_LOGIC_OP_COPY = Self.copy

    @available(*, deprecated, renamed: "invertedCopy")
    static let D3D12_LOGIC_OP_COPY_INVERTED = Self.invertedCopy

    @available(*, deprecated, renamed: "none")
    static let D3D12_LOGIC_OP_NOOP = Self.none

    @available(*, deprecated, renamed: "invert")
    static let D3D12_LOGIC_OP_INVERT = Self.invert
    
    @available(*, deprecated, renamed: "logicalAnd")
    static let D3D12_LOGIC_OP_AND = Self.logicalAnd
    
    @available(*, deprecated, renamed: "logicalNand")
    static let D3D12_LOGIC_OP_NAND = Self.logicalNand
    
    @available(*, deprecated, renamed: "logicalNor")
    static let D3D12_LOGIC_OP_NOR = Self.logicalNor
    
    @available(*, deprecated, renamed: "logicalXor")
    static let D3D12_LOGIC_OP_XOR = Self.logicalXor
    
    @available(*, deprecated, renamed: "logicalEqual")
    static let D3D12_LOGIC_OP_EQUIV = Self.logicalEqual
    
    @available(*, deprecated, renamed: "logicalAndReverse")
    static let D3D12_LOGIC_OP_AND_REVERSE = Self.logicalAndReverse
    
    @available(*, deprecated, renamed: "logicalAndInverse")
    static let D3D12_LOGIC_OP_AND_INVERTED = Self.logicalAndInverse
    
    @available(*, deprecated, renamed: "logicalOrReverse")
    static let D3D12_LOGIC_OP_OR_REVERSE = Self.logicalOrReverse
    
    @available(*, deprecated, renamed: "logicalOrInverse")
    static let D3D12_LOGIC_OP_OR_INVERTED = Self.logicalOrInverse
}

#endif
