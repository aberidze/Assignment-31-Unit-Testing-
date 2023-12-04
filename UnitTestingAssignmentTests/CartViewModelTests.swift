//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Macbook Air 13 on 03.12.23.
//

import XCTest
@testable import UnitTestingAssignment

final class CartViewModelTests: XCTestCase {
    
    var cartViewModel: CartViewModel!

    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }
 
    override func tearDownWithError() throws {
        cartViewModel = nil
    }
    
    
    // MARK: - Unit Tests
    func testFetchProducts() {
        cartViewModel.fetchProducts()
        XCTAssertNotNil(cartViewModel.allproducts)
    }
    
    func testAddProductWithProductID() {
        let productID = 1
        cartViewModel.fetchProducts()
        cartViewModel.addProduct(withID: productID)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
    
    func testAddProductWithProduct() {
        
    }
    
    func testAddRandomProduct() {
        
    }
    
    func testRemoveProduct() {
        
    }
    
    func testClearCart() {
        
    }
    
    func testSelectedItemsQuantity() {
        
    }
    
    func testTotalPrice() {
        
    }
}
