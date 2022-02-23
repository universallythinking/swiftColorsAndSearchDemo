//
//  Contacts.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/23/22.
//

import Foundation
import ContactsUI

class PhoneContacts {
    
    func getContacts() -> [[String]] {
        
            var contacts = [[String]]()
            let status = CNContactStore.authorizationStatus(for: CNEntityType.contacts) as CNAuthorizationStatus

            let contactStore = CNContactStore()
            let keysToFetch = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                CNContactEmailAddressesKey,
                CNContactPhoneNumbersKey,
                CNContactImageDataAvailableKey,
                CNContactThumbnailImageDataKey] as [Any]
            let request = CNContactFetchRequest(keysToFetch:keysToFetch as! [CNKeyDescriptor])
            do {
            try contactStore.enumerateContacts(with: request, usingBlock: { (contact:CNContact, stop:UnsafeMutablePointer<ObjCBool>) -> Void in
                print(contact)
                for phone in contact.phoneNumbers {
                    var name = ""
                    var phoneNumber = ""
                    name = contact.givenName + " " + contact.familyName
                    if (!phone.value.stringValue.isEmpty) {
                        phoneNumber = phone.value.stringValue
                    } else if (!phoneNumber.isEmpty) {
                        phoneNumber = "5134355226"
                    }
                    contacts.append([name, phoneNumber])
                }
            })
                return contacts
            } catch {
                return [["Error: ", "e"]]
            }
            
        }
    
    
}
