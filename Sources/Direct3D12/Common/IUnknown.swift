/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

public class IUnknown {
    private var win32Pointer: UnsafeMutableRawPointer?

    func perform<Type, ResultType>(as type: Type.Type, body: (_ pThis: UnsafeMutablePointer<Type>) throws -> ResultType) throws -> ResultType {
        guard let p = win32Pointer else {throw Error(.E_INVALIDARG)}
        return try body(p.bindMemory(to: type, capacity: 1))
    }

    func performFatally<Type, ResultType>(as type: Type.Type, body: (_ pThis: UnsafeMutablePointer<Type>) throws -> ResultType) -> ResultType {
        do {
            guard let p = win32Pointer else {throw Error(.E_INVALIDARG)}
            return try body(p.bindMemory(to: type, capacity: 1))
        }catch let error as Direct3D12.Error {
            fatalError(error.description)
        }catch{
            fatalError("\(error)")
        }
    }
    
    func checkResult(isMemberOf passable: Set<HRESULT>, _ body: @autoclosure () -> HRESULT) throws {
        let hr: HRESULT = body()
        guard passable.contains(hr) else {throw Error(hr)}
    }
    func checkResult(is passable: HRESULT = .S_OK, _ body: @autoclosure () -> HRESULT) throws {
        let hr: HRESULT = body()
        guard hr == passable else {throw Error(hr)}
    }

    init(win32Pointer: UnsafeMutableRawPointer?) {
        self.win32Pointer = win32Pointer
    }
    
    class var interfaceID: WinSDK.IID {preconditionFailure("Must override!")}
}
