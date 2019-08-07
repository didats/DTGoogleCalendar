//
//  DTGoogleCalendar.swift
//  Tester
//
//  Created by Didats Triadi on 06/08/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import Foundation
import GoogleSignIn
import GoogleAPIClientForREST

public class DTGoogleCalendar {
    private var googleUser: GIDGoogleUser!
    private let service = GTLRCalendarService()
    
    public static func setup(user: GIDGoogleUser) -> DTGoogleCalendar {
        let googleCalendar = DTGoogleCalendar()
        googleCalendar.googleUser = user
        return googleCalendar
    }
    
    public func events(callback: @escaping(_ events: [DTGoogleEventItem], _ error: Error?) -> Void) {
        service.authorizer = googleUser.authentication.fetcherAuthorizer()
        
        let query = GTLRCalendarQuery_EventsList.query(withCalendarId: "primary")
        query.maxResults = 100
        query.timeMin = GTLRDateTime(date: Date())
        query.singleEvents = false
        self.service.executeQuery(query, completionHandler: { (ticket, response, error) in
            var events: [DTGoogleEventItem] = []
            
            if let responses = response as? GTLRCalendar_Events {
                if let items = responses.items {
                    items.forEach({ (event) in
                        let eventItem = DTGoogleEventItem(item: event)
                        events.append(eventItem)
                    })
                }
            }
            
            callback(events, error)
        })
    }
}


