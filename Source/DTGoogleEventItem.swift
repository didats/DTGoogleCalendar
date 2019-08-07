//
//  DTGoogleEventItem.swift
//  Tester
//
//  Created by Didats Triadi on 07/08/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import GoogleAPIClientForREST

public struct DTGoogleEventItem {
    public var location: String
    public var status: String
    public var summary: String
    public var start: Date?
    public var end: Date?
    public var id: String
    
    init(item: GTLRCalendar_Event) {
        self.location = item.location ?? ""
        self.status = item.status ?? ""
        self.summary = item.summary ?? ""
        self.id = item.iCalUID ?? ""
        self.start = item.start?.dateTime?.date
        self.end = item.end?.dateTime?.date
    }
}
