//
//  ViewController.swift
//  InsiderDemo
//
//  Created by Insider on 17.08.2020.
//  Copyright © 2020 Insider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func triggerButtonOnClick(_ sender: UIButton) {
        
        // --- USER --- //
        
        // You can crete Insider User and add attributes later on it.
        let currentUser = Insider.getCurrentUser()
        
        // Setting User Attributes in chainable way.
        currentUser?.setName()("Insider")?
            .setSurname()("Demo")?
            .setAge()(23)?
            .setGender()(InsiderGender.other)?
            .setBirthday()(Date())?
            .setEmailOptin()(true)?
            .setSMSOptin()(false)?
            .setPushOptin()(true)?
            .setLocationOptin()(true)?
            .setFacebookID()("Facebook-ID")?
            .setTwitterID()("Twittter-ID")?
            .setLanguage()("TR")?
            .setLocale()("tr_TR")
        
        
        // Setting User Identifiers.
        let identifiers = InsiderIdentifiers()
            .addEmail()("mobile@useinsider.com")?
            .addPhoneNumber()("+901234567")?
            .addUserID()("CRM-ID")
        
        // If you do not pass the identifiers via login method, they will not work.
        // MARK: Make sure you call login method with Insider Identifiers.
        Insider.getCurrentUser()?.login(identifiers)
        
        // Login and Logout
        currentUser?.logout()
        currentUser?.login(identifiers)
        
        // Setting custom attributes.
        // MARK: Your attribute key should be all lowercased and should not include any special or non Latin characters or any space, otherwise this attribute will be ignored. You can use underscore _.
        
        currentUser?.setCustomAttributeWithString()("string_attribute", "This is Insider.")
        currentUser?.setCustomAttributeWithInt()("int_attribute", 10)
        currentUser?.setCustomAttributeWithDouble()("double_attribute", 10.5)
        currentUser?.setCustomAttributeWithBoolean()("bool_attribute", true)
        currentUser?.setCustomAttributeWithDate()("date_attribute", Date())
        
        let arr = ["value1", "value2", "value3"]
        
        // MARK: You can only call the method with array of string otherwise this attribute will be ignored.
        currentUser?.setCustomAttributeWithArray()("array_attribute", arr );
        
        // --- EVENT --- //
        
        // You can create an event without parameters and call the build method
        Insider.tagEvent("first_event").build()
        
        // You can create an event then add parameters and call the build method
        Insider.tagEvent("second_event").addParameterWithInt()("int_parameter", 10)?.build()
        
        
        // You can create an object and add the parameters later
        let insiderExampleEvent =  Insider.tagEvent("third_event")
        
        insiderExampleEvent?
            .addParameterWithString()("string_parameter", "This is Insider.")?
            .addParameterWithInt()("int_parameter", 10)?
            .addParameterWithDouble()("double_parameter", 20.5)?
            .addParameterWithBoolean()("bool_parameter", true)?
            .addParameterWithDate()("date_parameter", Date())
        
        // MARK: You can only call the method with array of string otherwise this event will be ignored.
        insiderExampleEvent?.addParameterWithArray()("array_parameter", arr)
        
        // Do not forget to call build method once you are done with parameters.
        // Otherwise your event will be ignored.
        insiderExampleEvent?.build()
        
        // --- PRODUCT --- //
        
        // MARK: If any parameter which is passed to this method is nil / null or an empty string, it will return an empty and invalid Insider Product Object. Note that an invalid Insider Product object will be ignored for any product related operations.
        // You can crete Insider Product and add attributes later on it.
        let taxonomy = ["taxonomy1", "taxonomy2", "taxonomy3"]
        let insiderExampleProduct = Insider.createNewProduct(withID: "productID", name: "productName", taxonomy: taxonomy, imageURL: "imageUrl", price: 1000.5, currency: "currency")
        
        
        // Setting Product Attributes in chainable way.
        insiderExampleProduct?
            .setColor()("color")?
            .setVoucherName()("voucherName")?
            .setVoucherDiscount()(10.5)?
            .setPromotionName()("promotionName")?
            .setPromotionDiscount()(10.5)?
            .setSize()("size")?
            .setSalePrice()(10.5)?
            .setShippingCost()(10.5)?
            .setQuantity()(10)?
            .setStock()(10)
        
        // Setting custom attributes.
        // MARK: Your attribute key should be all lowercased and should not include any special or non Latin characters or any space, otherwise this attribute will be ignored. You can use underscore _.
        insiderExampleProduct?
            .setCustomAttributeWithString()("string_parameter", "This is Insider.")?
            .setCustomAttributeWithInt()("int_parameter", 10)?
            .setCustomAttributeWithDouble()("double_parameter", 10.5)?
            .setCustomAttributeWithBoolean()("bool_parameter", true)?
            .setCustomAttributeWithDate()("date_parameter", Date())
        
        // MARK: You can only call the method with array of string otherwise this event will be ignored.
        insiderExampleProduct?.setCustomAttributeWithArray()("array_parameter", arr);
        
        // --- REVENUE TRACKING --- //
        
        Insider.itemPurchased(withSaleID: "uniqueSaleID", product: insiderExampleProduct)
        
        
        // --- CART REMINDER --- //
        
        // Adding item to cart.
        Insider.itemAddedToCart(with: insiderExampleProduct)
        
        // Removing item from the cart.
        Insider.itemRemovedFromCart(withProductID: "productID")
        
        // Removing all the items from the cart.
        // This method will automatically triggered when you call Revenue Tracking.
        Insider.cartCleared()
        
        // --- RECOMMENDATION ENGINE --- //
        
        // ID comes from your smart recommendation campaign.
        // Please follow the language code structure. For instance tr_TR.
        Insider.getSmartRecommendation(withID: 1, locale: "tr_TR", currency: "TRY", smartRecommendation: {
            (recommendation) in
            // Handle here
        })
        
        // You must need to have minumun 2 taxonomy in your product object. Otherwise any Smart Recommendation
        // operator will  not work.
        Insider.getSmartRecommendation(with: insiderExampleProduct, recommendationID: 1, locale: "tr_TR") {
            (recommendation) in
            // Handle here
        }
        
        
        // --- SOCIAL PROOF --- //
        
        Insider.visitProductDetailPage(with: insiderExampleProduct)
        
        // --- PAGE VISITING --- //
        
        Insider.visitHomepage()
        Insider.visitListingPage(withTaxonomy: taxonomy)
        
        let insiderExampleProducts = [insiderExampleProduct, insiderExampleProduct]
        Insider.visitCartPage(withProducts: insiderExampleProducts as [Any])
        
        // --- GDPR --- //
        
        // MARK: Please note that by default our SDK is collecting the data so you don't have to call this function if you are not asking users consents.
        //
        // MARK: If you set false, the user will not share any data or receive any push until you set back true.
        Insider.setGDPRConsent(true)
        
        // --- MESSAGE CENTER --- //
        
        
        let today = Date()
        var oneDayBefore = DateComponents()
        oneDayBefore.setValue(-1, for: .day)
        let yesterday = Calendar.current.date(byAdding: oneDayBefore, to: today)
        
        Insider.getMessageCenterData(withLimit: 20, start: yesterday, end: today) {
            (messageCenterData) in
            // Handle here
        }
        
        // --- CONTENT OPTIMIZER --- //
        
        // String
        let contentOptimizerString = Insider.getContentString(withName: "string_variable_name", defaultString: "defaultValue", dataType: ContentOptimizerDataType.element)
        print(contentOptimizerString!)
        
        
        // Bool
        let contentOptimizerBool = Insider.getContentBool(withName: "bool_variable_name", defaultBool: true, dataType: ContentOptimizerDataType.element)
        print(contentOptimizerBool)
        
        
        // Integer
        let contentOptimizerInt = Insider.getContentInt(withName: "int_variable_name", defaultInt: 10, dataType: ContentOptimizerDataType.element)
        print(contentOptimizerInt)
    }
}

