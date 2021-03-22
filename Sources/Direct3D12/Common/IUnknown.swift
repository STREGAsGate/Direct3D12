/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class IUnknown {
    private var win32Pointer: UnsafeMutableRawPointer?

    func perform<Type, ResultType>(as type: Type.Type, body: (_ pThis: UnsafeMutablePointer<Type>) throws -> ResultType) throws -> ResultType {
        guard let p = win32Pointer else {throw Error(.invalidArgument)}
        return try body(p.bindMemory(to: type, capacity: 1))
    }

    func performFatally<Type, ResultType>(as type: Type.Type, body: (_ pThis: UnsafeMutablePointer<Type>) throws -> ResultType) -> ResultType {
        do {
            guard let p = win32Pointer else {throw Error(.invalidArgument)}
            return try body(p.bindMemory(to: type, capacity: 1))
        }catch let error as Direct3D12.Error {
            fatalError(error.description)
        }catch{
            fatalError("\(error)")
        }
    }

    init(win32Pointer: UnsafeMutableRawPointer?) {
        self.win32Pointer = win32Pointer
    }
    
    class var interfaceID: WinSDK.IID {preconditionFailure("Must override!")}
}

extension IUnknown {// Always use Factory1
    typealias RawValue = WinSDK.IUnknown
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension IUnknown.RawValue {// Always use Factory1
    static var interfaceID: WinSDK.IID {WinSDK.IID_IUnknown}
}