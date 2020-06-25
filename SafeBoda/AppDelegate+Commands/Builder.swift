//
//  StartupCommandsBuilder.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//
import Foundation
import UIKit

// MARK: - Builder
final class StartupCommandsBuilder {
    private var window: UIWindow!

    func setKeyWindow(_ window: UIWindow) -> StartupCommandsBuilder {
        self.window = window
        return self
    }

    func build() -> [Command] {
        return [
            InitializeThirdPartyCommands(),
            InitialViewControllerCommand(window: window),
            InitializeAppearanceCommand(),
            RegisterToRemoteNotificationsCommand(),
        ]
    }
}
