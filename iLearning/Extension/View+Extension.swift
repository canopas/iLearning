//
//  View+Extension.swift
//  iLearning
//
//  Created by Amisha Italiya on 03/01/23.
//

import SwiftUI

public struct AlertPrompt {
    public let title: String
    public let message: String
    public var positiveBtnTitle: String?
    public var positiveBtnAction: (() -> Void)?
    public var negativeBtnTitle: String?
    public var negativeBtnAction: (() -> Void)?
    public var isPositiveBtnDestructive: Bool = false

    public init(title: String = "", message: String, positiveBtnTitle: String? = nil, positiveBtnAction: (() -> Void)? = nil, negativeBtnTitle: String? = nil, negativeBtnAction: (() -> Void)? = nil, isPositiveBtnDestructive: Bool = false) {
        self.title = title
        self.message = message
        self.positiveBtnTitle = positiveBtnTitle
        self.positiveBtnAction = positiveBtnAction
        self.negativeBtnTitle = negativeBtnTitle
        self.negativeBtnAction = negativeBtnAction
        self.isPositiveBtnDestructive = isPositiveBtnDestructive
    }
}

public struct Backport<Content> {
    public let content: Content

    public init(content: Content) {
        self.content = content
    }
}

public extension View {
    var backport: Backport<Self> { Backport(content: self) }
}

public extension Backport where Content: View {
    @ViewBuilder func alert(isPresented: Binding<Bool>, alertStruct: AlertPrompt) -> some View {
        if #available(iOS 15, *) {
            content
                .alert(alertStruct.title, isPresented: isPresented) {
                    if let positiveTitle = alertStruct.positiveBtnTitle {
                        Button(positiveTitle, role: alertStruct.isPositiveBtnDestructive ? .destructive : nil, action: {
                            alertStruct.positiveBtnAction?()
                        })
                    }
                    if let negativeTitle = alertStruct.negativeBtnTitle {
                        Button(negativeTitle, role: .cancel, action: {
                            alertStruct.negativeBtnAction?()
                        })
                    }
                    if alertStruct.positiveBtnTitle == nil && alertStruct.negativeBtnTitle == nil {
                        Button(R.string.commonStrings.ok_text.localized(), role: .cancel, action: {
                            isPresented.wrappedValue = false
                        })
                    }
                } message: {
                    Text(alertStruct.message)
                }
        } else {
            content
                .alert(isPresented: isPresented) {
                    if let positiveTitle = alertStruct.positiveBtnTitle, let negativeTitle = alertStruct.negativeBtnTitle {
                        return Alert(title: Text(alertStruct.title), message: Text(alertStruct.message), primaryButton: alertStruct.isPositiveBtnDestructive ? .destructive(Text(positiveTitle), action: {
                            alertStruct.positiveBtnAction?()
                        }) : .default(Text(positiveTitle), action: {
                            alertStruct.positiveBtnAction?()
                        }), secondaryButton: .cancel(Text(negativeTitle), action: {
                            alertStruct.negativeBtnAction?()
                        }))
                    } else if let positiveTitle = alertStruct.positiveBtnTitle {
                        if alertStruct.isPositiveBtnDestructive {
                            return Alert(title: Text(alertStruct.title), message: Text(alertStruct.message), primaryButton: .destructive(Text(positiveTitle), action: {
                                alertStruct.positiveBtnAction?()
                            }), secondaryButton: .cancel(Text(R.string.commonStrings.cancel_text.localized()), action: {
                                isPresented.wrappedValue = false
                            }))
                        } else {
                            return Alert(title: Text(alertStruct.title), message: Text(alertStruct.message), dismissButton: .default(Text(positiveTitle), action: {
                                alertStruct.positiveBtnAction?()
                            }))
                        }
                    } else {
                        return Alert(title: Text(alertStruct.title), message: Text(alertStruct.message), dismissButton: .cancel(Text(R.string.commonStrings.ok_text.localized()), action: {
                            isPresented.wrappedValue = false
                        }))
                    }
                }
        }
    }
}

public extension View {
    func navigationBarIsHidden(_ hidden: Bool) -> some View {
        if #available(iOS 16.0, *) {
            return self
                .toolbar(hidden ? .hidden : .visible, for: .navigationBar)
        } else {
            return self
                .navigationBarHidden(hidden)
        }
    }
}
