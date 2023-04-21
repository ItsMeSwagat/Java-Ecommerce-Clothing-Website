package com.cart;

import java.util.ArrayList;
import java.util.List;

import com.productOperation.ProductDao;
import com.productOperation.product;

public class Cart {
    private List<CartItem> items;

    public Cart() {
        items = new ArrayList<CartItem>();
    }

    // add a product to the cart
    public void addItem(int productId, int quantity) {
        ProductDao productDao = new ProductDao();
        product product = productDao.getProductById(productId);
        if (product != null) {
            CartItem cartItem = new CartItem(product, quantity);
            items.add(cartItem);
        }
    }

    // remove a product from the cart
    public void removeItem(int productId) {
        CartItem cartItemToRemove = null;
        for (CartItem cartItem : items) {
            if (cartItem.getProduct().getP_id() == productId) {
                cartItemToRemove = cartItem;
                break;
            }
        }
        if (cartItemToRemove != null) {
            items.remove(cartItemToRemove);
        }
    }

    // update the quantity of a product in the cart
    public void updateItem(int productId, int quantity) {
        for (CartItem cartItem : items) {
            if (cartItem.getProduct().getP_id() == productId) {
                cartItem.setQuantity(quantity);
                break;
            }
        }
    }

    // get the total price of all items in the cart
    public int getTotalPrice() {
        int totalPrice = 0;
        for (CartItem cartItem : items) {
            totalPrice += cartItem.getProduct().getP_price() * cartItem.getQuantity();
        }
        return totalPrice;
    }

    // get the number of items in the cart
    public int getNumberOfItems() {
        int numberOfItems = 0;
        for (CartItem cartItem : items) {
            numberOfItems += cartItem.getQuantity();
        }
        return numberOfItems;
    }

    // get all items in the cart
    public List<CartItem> getItems() {
        return items;
    }

    // clear the cart
    public void clear() {
        items.clear();
    }
}


