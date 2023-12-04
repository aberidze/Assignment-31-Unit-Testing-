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
    
    func testAddRandomProduct() {
        cartViewModel.fetchProducts()
        cartViewModel.addRandomProduct()
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
    
    func testRemoveProduct() {
        let removeProductID = 1
        cartViewModel.fetchProducts()
        cartViewModel.addProduct(withID: removeProductID)
        cartViewModel.addProduct(withID: 2)
        cartViewModel.addProduct(withID: 3)
        cartViewModel.removeProduct(withID: removeProductID)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 2)
    }
    
    func testClearCart() {
        cartViewModel.fetchProducts()
        cartViewModel.addRandomProduct()
        cartViewModel.addProduct(withID: 1)
        cartViewModel.addProduct(withID: 2)
        cartViewModel.clearCart()
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
    
    func testSelectedItemsQuantity() {
        cartViewModel.fetchProducts()
        cartViewModel.allproducts![0].selectedQuantity = 5
        cartViewModel.addProduct(withID: 1)
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 5)
    }
    
    func testTotalPrice() {
        cartViewModel.fetchProducts()
        cartViewModel.allproducts![0].selectedQuantity = 1
        cartViewModel.addProduct(withID: 1)
        cartViewModel.allproducts![1].selectedQuantity = 2
        cartViewModel.addProduct(withID: 2)
        XCTAssertEqual(cartViewModel.totalPrice, 2347)
    }
}
