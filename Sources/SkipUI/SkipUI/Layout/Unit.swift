// Copyright 2023–2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
#if !SKIP_BRIDGE
#if SKIP
import androidx.compose.animation.core.CubicBezierEasing
import androidx.compose.animation.core.Easing
#endif

public struct UnitPoint : Codable, Hashable {
    public var x = 0.0
    public var y = 0.0

    public static let zero = UnitPoint(x: 0.0, y: 0.0)
    public static let center = UnitPoint(x: 0.5, y: 0.5)
    public static let leading = UnitPoint(x: 0.0, y: 0.5)
    public static let trailing = UnitPoint(x: 1.0, y: 0.5)
    public static let top = UnitPoint(x: 0.5, y: 0.0)
    public static let bottom = UnitPoint(x: 0.5, y: 1.0)
    public static let topLeading = UnitPoint(x: 0.0, y: 0.0)
    public static let topTrailing = UnitPoint(x: 1.0, y: 0.0)
    public static let bottomLeading = UnitPoint(x: 0.0, y: 1.0)
    public static let bottomTrailing = UnitPoint(x: 1.0, y: 1.0)
}

public struct UnitCurve: Hashable {
    private let startControlPoint: UnitPoint
    private let endControlPoint: UnitPoint

    public init(startControlPoint: UnitPoint, endControlPoint: UnitPoint) {
        self.startControlPoint = startControlPoint
        self.endControlPoint = endControlPoint
    }

    public static func bezier(startControlPoint: UnitPoint, endControlPoint: UnitPoint) -> UnitCurve {
        return UnitCurve(startControlPoint: startControlPoint, endControlPoint: endControlPoint)
    }

    @available(*, unavailable)
    public func value(at progress: Double) -> Double {
        fatalError()
    }

    @available(*, unavailable)
    public func velocity(at progress: Double) -> Double {
        fatalError()
    }

    @available(*, unavailable)
    public var inverse: UnitCurve {
        fatalError()
    }

    public static let easeInOut = UnitCurve(startControlPoint: UnitPoint(x: 0.42, y: 0.0), endControlPoint: UnitPoint(x: 0.58, y: 1.0))

    public static let easeIn = UnitCurve(startControlPoint: UnitPoint(x: 0.42, y: 0.0), endControlPoint: UnitPoint(x: 1.0, y: 1.0))

    public static let easeOut = UnitCurve(startControlPoint: UnitPoint(x: 0.0, y: 0.0), endControlPoint: UnitPoint(x: 0.58, y: 1.0))

    @available(*, unavailable)
    public static var circularEaseIn: UnitCurve {
        fatalError()
    }

    @available(*, unavailable)
    public static var circularEaseOut: UnitCurve {
        fatalError()
    }

    @available(*, unavailable)
    public static var circularEaseInOut: UnitCurve {
        fatalError()
    }

    public static let linear = UnitCurve(startControlPoint: UnitPoint(x: 0.0, y: 0.0), endControlPoint: UnitPoint(x: 1.0, y: 1.0))

    #if SKIP
    public func asEasing() -> Easing {
        return CubicBezierEasing(Float(startControlPoint.x), Float(startControlPoint.y), Float(endControlPoint.x), Float(endControlPoint.y))
    }
    #endif
}

#endif
