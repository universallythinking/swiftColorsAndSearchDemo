//
//  Contacts.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/23/22.
//

import Foundation
import ContactsUI

class PhoneContacts {
    var arr: [String] = []
    var counter = 0
    var colors = [UIColor.green, UIColor.red, UIColor.gray, UIColor.orange, UIColor.blue, UIColor.black]
    
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
    
    func editArray(_ number : String) {
        if (arr.contains(number)) {
            arr.remove(object: number)
        } else {
            arr.append(number)
        }
    }
    
    func getArray(_ number : String) -> Bool {
        if (arr.contains(number)) {
            return true
        } else {
            return false
        }
    }
    
}

extension Array where Element: Equatable {

    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }

}
