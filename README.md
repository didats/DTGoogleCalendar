*This is still on heavy development. Once its ready, I will remove this line*

# DTGoogleCalendar

![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/DTSocialMediaLogin.svg?style=flat)](http://cocoapods.org/pods/DTSocialMediaLogin)
[![License](https://img.shields.io/cocoapods/l/DTSocialMediaLogin.svg?style=flat)](http://cocoapods.org/pods/DTSocialMediaLogin)
[![Platform](https://img.shields.io/cocoapods/p/DTSocialMediaLogin?style=flat)](http://cocoapods.org/pods/DTSocialMediaLogin)

Read Google Calendar Events on iOS with ease. This library will handle the login as well for you.  

## Requirements
* Base SDK: iOS 12
* Deployment Target: iOS 10.0 or greater

## Installation with Cocoapods
Add following in your Podfile

```
pod ‘DTGoogleCalendar’
```

## Dependencies
This library is using [FBSDKCoreKit](https://cocoapods.org/pods/FBSDKCoreKit), [FBSDKLoginKit](https://cocoapods.org/pods/FBSDKLoginKit), [GoogleSignIn](https://cocoapods.org/pods/GoogleSignIn), [OAuthSwift](https://cocoapods.org/pods/OAuthSwift), [DTSocialMediaLogin](https://cocoapods.org/pods/DTSocialMediaLogin), [GoogleAPIClientForREST](https://cocoapods.org/pods/GoogleAPIClientForREST)

## Setting Up
Please follow along the instruction on: [DTSocialMediaLogin Github page](https://github.com/didats/DTSocialMediaLogin). Please also remember, to be able to use the Google Calendar API for public, you will need to [verify on Google Developer Console that you are a verified Developer](https://support.google.com/cloud/answer/7454865?hl=en). 

## URL Schemes
Please follow along the instruction on: [DTSocialMediaLogin Github page](https://github.com/didats/DTSocialMediaLogin)

## Usage

The few steps will be the same as `DTSocialMediaLogin` as it need to login to Google Platform prior asking Calendar API. Anyway, I will rewrite it here.

Open your `AppDelegate.swift`

```swift
// Add import at the header
import DTSocialMediaLogin

// Add to your openURL method
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    return DTSocialMediaLogin.openURL(app, url: url, options: options)
}
```

At your implementation file
```swift

// Add import at the header of the file
import DTSocialMediaLogin
import GoogleAPIClientForREST

// add the variable attribute
var socialMedia: DTSocialMediaLogin!
var googleCalendar: DTGoogleCalendar!

// on viewDidLoad()
override func viewDidLoad() {
	super.viewDidLoad()
  
  // Enter your Google Client ID, and set empty string on other parameter.
	let settings = DTSocialMediaKeys(
					googleClientID: "", 
					facebookID: "", 
					twitterAppKey: "", 
					twitterAppSecret: "")
	socialMedia = DTSocialMediaLogin.setup(settings: settings)
}

// on button action
@IBAction func googleClicked(_ sender: Any) {
  // Remove Readonly if you wanted to get read & write permission
  socialMedia.scopes = [kGTLRAuthScopeCalendarReadonly]
  socialMedia.login(with: .Google, from: self) { (error, user) in
      guard let user = user else {
          return
      }

      guard let google = user.origin as? DTGoogleUser else {
          return
      }

      self.googleCalendar = DTGoogleCalendar.setup(user: google.user)
      self.googleCalendar.events(callback: { (events, err) in
          if events.count > 0 {
              print("List: \(events)")
          }
      })
  }
}

```

## Author
**Didats Triadi**  
https://rimbunesia.com  
http://didats.net

## How to say thank you
As you probably guess, this library took  hours of my free time to work on. If you find this useful, please consider buying my Color Picker app,  [‎Kelir on the Mac App Store](https://apps.apple.com/us/app/kelir-pro/id1186597992?mt=12)

## License
Copyright (c) 2019 Didats Triadi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal  in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
