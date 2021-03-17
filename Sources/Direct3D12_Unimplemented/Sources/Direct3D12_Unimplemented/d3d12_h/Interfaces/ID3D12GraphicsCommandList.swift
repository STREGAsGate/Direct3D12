/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

public class GraphicsCommandList: CommandList {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension  GraphicsCommandList {
    typealias RawValue = WinSDK.ID3D12GraphicsCommandList
    private var rawValue: RawValue {self.performFatally(as: RawValue.self, {$0.this})}
    convenience init(_ rawValue: RawValue) {
        var rawValue = rawValue
        self.init(win32Pointer: withUnsafeMutablePointer(to: &rawValue) {UnsafeMutableRawPointer($0)})
    }
}
extension GraphicsCommandList.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12GraphicsCommandList}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "GraphicsCommandList")
public typealias ID3D12GraphicsCommandList = GraphicsCommandList 

#endif
