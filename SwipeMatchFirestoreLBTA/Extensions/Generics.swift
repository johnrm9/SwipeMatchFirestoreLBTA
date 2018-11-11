//
//  Generics.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/5/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import Foundation

func make<T>(_ setup: ((T) -> Void)) -> T where T: NSObject {
    let obj = T()
    setup(obj)
    return obj
}

extension Collection {
    subscript(safe index: Index) -> Iterator.Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}

extension Array {
    public init(count: Int, elementCreator: @autoclosure () -> Element) {
        self = (0 ..< count).map { _ in elementCreator() }
    }
}
