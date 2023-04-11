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
        case passengerInfoCell = "PassengerInfoCell"
    }
    
    enum ImageNames: String {
        
        case pamukkale = "pamukkale"
        case varan = "varan"
        case uludag = "uludag"
        case istanbulKalesi = "istanbul_kalesi"
        case kamilKoc = "kamil_koc"
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
        case phone = "phone"
    }
    
    enum ColorNames: String {
        
        case primary = "Primary"
        case background = "Background"
    }
    
    enum VCIdentifiers: String {
        
        case onboardingVC = "OnboardingVC"
        case LoginVC = "LoginVC"
        case RegisterVC = "RegisterVC"
        case TicketSelectionVC = "TicketSelectionVC"
        case TicketsVC = "TicketsVC"
        case PaymentVC = "PaymentVC"
    }
    
    enum SegueIdentifiers: String {
        
        case registerToTicketSelectionSegue = "registerToTicketSelectionSegue"
        case loginToTicketSelectionSegue = "loginToTicketSelectionSegue"
        case selectionToTicketsSegue = "selectionToTicketsSegue"
        case ticketsToPaymentSegue = "ticketsToPaymentSegue"
    }
    
    enum UserDefaultsKeys: String {
        
        case userInfo = "userInfo"
    }

}
