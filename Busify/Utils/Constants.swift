//
//  Constants.swift
//  Busify
//
//  Created by Kerem Ersu on 4.04.2023.
//

import Foundation

struct Constants {
    
    enum NibNames: String {
        
        case ticketCell = "TicketCell"
        case onboardingCell = "OnboardingCell"
    }
    
    enum ImageNames: String {
        
        case pamukkale = "pamukkale"
        case iconBusDockerFront = "iconBusDockerFront"
        case iconBusFront = "iconBusFront"
        case iconRemoveButton = "iconRemoveButton"
        case onboarding1 = "onboarding1"
        case onboarding2 = "onboarding2"
        case envelope = "envelope"
        case lock = "lock"
        case person = "person"
        case location = "location"
        case locationFill = "location.fill"
        case calendar = "calendar"
    }
    
    enum VCIdentifiers: String {
        
        case onboardingVC = "OnboardingVC"
        case LoginVC = "LoginVC"
        case RegisterVC = "RegisterVC"
        case TicketSelectionVC = "TicketSelectionVC"
        case TicketsVC = "TicketsVC"
    }
    
    enum SegueIdentifiers: String {
        
        case registerToTicketSelectionSegue = "registerToTicketSelectionSegue"
        case loginToTicketSelectionSegue = "loginToTicketSelectionSegue"
        case selectionToTicketsSegue = "selectionToTicketsSegue"
    }
    
    enum UserDefaultsKeys: String {
        
        case userInfo = "userInfo"
    }

}
