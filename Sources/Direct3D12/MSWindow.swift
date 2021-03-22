/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import Foundation
import WinSDK

public protocol MSWindowDelegate: AnyObject {
    func window(_ window: MSWindow, didChangeSize size: MSSize)
    func windowWillClose(_ window: MSWindow)
}

open class MSWindow {
    internal static let windowClass: MSWindowClass = MSWindowClass()
    internal let hWnd: WinSDK.HWND
    public let style: MSWindowStyle
    public final weak var delegate: MSWindowDelegate? = nil

    public required init(frame: MSRect, style: MSWindowStyle = .standard) {
        Self.windowClass.register()
        self.hWnd = Self.makeHWND(withFrame: frame, style: style)
        self.style = style
        SetWindowLongPtrW(self.hWnd, GWLP_USERDATA, unsafeBitCast(self as AnyObject, to: LONG_PTR.self))

        MSApplication.shared.incrementWindowCount()
    }

    private final func update() {

    }

    open func draw() {

    }

    public enum State {
        ///The window exists but isn't on screen
        case hidden
        ///The window is on screen
        case shown
        ///The window isn't visible and can never be shown again.
        case destroyed
    }

    public private(set) var state: State = .hidden
    
    /// If possible, shows the window on screen.
    public final func show() {
        guard state == .hidden else {return}
        _ = ShowWindow(self.hWnd, SW_SHOWDEFAULT)
        self.performShowOperations()
    }

    /// Makes the window hidden. To destroy the window via code allow the MSWindow to deallocate.
    public final func close() {
        guard state == .shown else {return}
        self.performCloseOperations()
        WinSDK.CloseWindow(self.hWnd)
    }

    //TODO: Move this into MSApplication to reduce queue block creation noise
    private func run() {
        guard state != .destroyed else {return}
        DispatchQueue.main.async {
            var msg: MSG = MSG()
            if PeekMessageW(&msg, self.hWnd, 0, 0, UINT(PM_REMOVE)) {
                TranslateMessage(&msg)
                DispatchMessageW(&msg)
            }

            if msg.message != WM_QUIT {
                self.update()
                self.run()
            }else{
                self.delegate?.windowWillClose(self)
            }
        }
    }

    deinit {
        Self.windowClass.unregister()
        WinSDK.DestroyWindow(hWnd)
    }
}

public extension MSWindow {
    var title: String? {
        get {
            let length = GetWindowTextLengthW(self.hWnd)
            var lpString = Array<WCHAR>(unsafeUninitializedCapacity: Int(length) + 1) {
                $1 = Int(GetWindowTextW(self.hWnd, $0.baseAddress, CInt($0.count)))
            }
            lpString.withUnsafeMutableBufferPointer() {p in
                _ = GetWindowTextW(self.hWnd, p.baseAddress!, Int32(p.count))
            }
            return String(lpcwstr: lpString)
        }
        set {
            _ = WinSDK.SetWindowTextW(self.hWnd, newValue?.lpcwSTR)
        }
    }
    var frame: MSRect {
        get {
            var RECT: RECT = RECT()
            WinSDK.GetClientRect(self.hWnd, &RECT)
            return MSRect(RECT)
        }
        set {
            var RECT = newValue.RECT()
            WinSDK.AdjustWindowRect(&RECT, DWORD(style.rawValue), style.contains(.menuInTitleBar))
            WinSDK.SetWindowPos(self.hWnd, nil, RECT.x, RECT.y, RECT.width, RECT.height, UInt32(SWP_NOACTIVATE))
        }
    }
}

fileprivate extension MSWindow {
    class func makeHWND(withFrame frame: MSRect, style: MSWindowStyle) -> HWND {
        let dwExStyle: DWORD = 0
        let lpClassName = "\(type(of: MSWindow.self))".lpcwSTR
        let lpWindowName = ProcessInfo.processInfo.processName.lpcwSTR
        let dwStyle: DWORD = DWORD(style.rawValue)
        let X: INT = Int32(frame.origin.x)
        let Y: INT = Int32(frame.origin.y)
        let nWidth: INT = Int32(frame.size.width)
        let nHeight: INT = Int32(frame.size.height)
        let hWndParent: HWND? = nil
        let hMenu: HMENU? = nil
        let hInstance: HINSTANCE = WinSDK.GetModuleHandleW(nil)
        let lpParam: LPVOID? = nil
        guard let hWnd = WinSDK.CreateWindowExW(dwExStyle, lpClassName, lpWindowName, dwStyle, X, Y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam) else {
            print(GetLastError().errorMessage)
            fatalError()
        }   
        return hWnd
    }
}

public struct MSWindowStyle: OptionSet {
    public typealias RawValue = Int32
    public let rawValue: RawValue

    /// The window type. This is always required.
    public static let overlapped = MSWindowStyle(rawValue: WinSDK.WS_OVERLAPPED)

    /// Shows the maximize button in the titlebar
    public static let maximizable = MSWindowStyle(rawValue: WinSDK.WS_MAXIMIZEBOX)
    /// Shows the minimize button in the titlebar
    public static let minimizable = MSWindowStyle(rawValue: WinSDK.WS_MINIMIZEBOX)
    /// Allows user live resizing via draggin the window border
    public static let resizable = MSWindowStyle(rawValue: WinSDK.WS_THICKFRAME)

    /// Shows the titlebar
    public static let titleBar = MSWindowStyle(rawValue: WinSDK.WS_CAPTION)
    /// Expects the window to have a menu in the titlebar
    public static let menuInTitleBar = MSWindowStyle(rawValue: WinSDK.WS_SYSMENU)
    /// Shows the titlebar and expects the window to have a menu
    public static let titleBarMenu: MSWindowStyle = [.titleBar, .menuInTitleBar]

    /// Starts the window maximized
    public static let initiallyMaximized = MSWindowStyle(rawValue: WinSDK.WS_MAXIMIZE)

    /// The default Windows 10 style. Users expect this.
    public static let standard: MSWindowStyle = [.overlapped, .titleBarMenu, .maximizable, .minimizable, .resizable]

    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

// Common tasks shared by manual calls and notifications
internal extension MSWindow {
    func performShowOperations() {
        _ = UpdateWindow(self.hWnd)
        run()
    }
    func performCloseOperations() {
        delegate?.windowWillClose(self)
        MSApplication.shared.decrementWindowCount()
    }
}

//These are the 
internal extension MSWindow {
    func _msgPaint() {
        self.draw()
    }

    func _msgResized() {
        delegate?.window(self, didChangeSize: self.frame.size)
    }

    func _msgShow() {
        print("show recieved")
        self.state = .shown
        self.performShowOperations()
    }

    func _msgHide() {
        print("hide recieved")
        self.state = .hidden
    }

    func _msgClose() {
        print("close recieved")
        self.performCloseOperations()
    }

    func _msgDestroy() {
        print("destroy recieved")
        self.state = .destroyed
    }

    //return true if input was used
    func _msgKeyDown(_ key: WPARAM) -> Bool {
        switch key {
        case WPARAM(VK_ESCAPE):
            PostMessageW(hWnd, UINT(WM_DESTROY), 0, 0)
            return true
        default:
            return false
        }
    }

    //return true if input was used
    func _msgKeyUp(_ key: WPARAM) -> Bool {
        switch key {
        case WPARAM(VK_ESCAPE):
            return true
        default:
            return false
        }
    }
}

internal class MSWindowClass {
    internal let name: [WCHAR]
    internal let hInstance: HINSTANCE
    internal var value: WNDCLASSEXW
    
    init(style: UInt32 = 0) {
        var IDC_ARROW: UnsafePointer<WCHAR> {
            UnsafePointer<WCHAR>(bitPattern: 32512)!
        }
        let name = "\(type(of: MSWindow.self))".lpcwSTR
        let hInstance = GetModuleHandleW(nil)!
        self.name = name
        self.hInstance = hInstance
        self.value = name.withUnsafeBufferPointer {
            return WNDCLASSEXW(cbSize: UINT(MemoryLayout<WNDCLASSEXW>.size),
                               style: DWORD(CS_HREDRAW | CS_VREDRAW),
                               lpfnWndProc: WindowProcedure,
                               cbClsExtra: 0,
                               cbWndExtra: 0,
                               hInstance: hInstance,
                               hIcon: nil,
                               hCursor: LoadCursorW(nil, IDC_ARROW),
                               hbrBackground: nil,
                               lpszMenuName: nil,
                               lpszClassName: $0.baseAddress!,
                               hIconSm: nil)
        }
        register()
    }

    var atom: ATOM? = nil
    func register() {
        guard atom == nil else {return}
        self.atom = RegisterClassExW(&value)
    }
    func unregister() {
        guard atom != nil else {return}
        if UnregisterClassW(self.name, self.hInstance) {
            self.atom = nil
        }
    }
}

internal typealias WindowProc = @convention(c) (HWND?, UINT, WPARAM, LPARAM) -> LRESULT

private func WindowProcedure(_ hWnd: HWND?, _ uMsg: UINT, _ wParam: WPARAM, _ lParam: LPARAM) -> LRESULT {
    let lpUserData = GetWindowLongPtrW(hWnd, GWLP_USERDATA)
    guard lpUserData != 0, let window = unsafeBitCast(lpUserData, to: AnyObject.self) as? MSWindow else {
        return DefWindowProcW(hWnd, uMsg, wParam, lParam)
    }
    
    switch uMsg {
    case UINT(WM_SIZE):
        window._msgResized()
        return 0
    case UINT(WM_PAINT):
        window._msgPaint()
        return 0
    case UINT(WM_KEYDOWN):
        if window._msgKeyDown(wParam) {
            return 0
        }
    case UINT(WM_KEYUP):
        if window._msgKeyUp(wParam) {
            return 0
        }
    case UINT(WM_SHOWWINDOW):
        switch wParam {
        case WPARAM(UINT(1)):
            window._msgShow()
        default:
            window._msgHide()
        }
    case UINT(WM_CLOSE):
        window._msgClose()
    case UINT(WM_DESTROY):
        window._msgDestroy()
    default:
        break
    }
    return DefWindowProcW(hWnd, uMsg, wParam, lParam)
} 