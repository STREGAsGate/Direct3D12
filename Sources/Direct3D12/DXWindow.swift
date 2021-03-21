/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public protocol DXWindowDelegate: MSWindowDelegate {
    
}

open class DXWindow: MSWindow {

    public required init(frame: MSRect, style: MSWindowStyle = .standard) {
        super.init(frame: frame, style: style)
    }

    internal var dxWindowDelegate: DXWindowDelegate? {delegate as? DXWindowDelegate}
}
