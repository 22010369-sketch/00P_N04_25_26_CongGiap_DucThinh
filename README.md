# 00P_N04_25_26_CongGiap_DucThinh
Repo working group


Yeu cau 4:
Project/ - Quản lý Mua Hàng
│── src/
│   ├── User.java
│   ├── Product.java
│   ├── Order.java
│   └── Main.java
│── README.md


import java.util.ArrayList;
import java.util.Date;


import java.util.*;

class User {
    private int id;
    private String name;
    private String email;
    private String password;

    public User(int id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    // CREATE
    public static User createUser(int id, String name, String email, String password) {
        return new User(id, name, email, password);
    }

    // READ
    public void display() {
        System.out.println(this);
    }

    // UPDATE
    public void updateInfo(String name, String email) {
        this.name = name;
        this.email = email;
    }

    // DELETE: ở mức quản lý danh sách thì sẽ remove khỏi ArrayList

    @Override
    public String toString() {
        return "User {id=" + id + ", name=" + name + ", email=" + email + "}";
    }
}


class Product {
    private int id;
    private String title;
    private double price;

    public Product(int id, String title, double price) {
        this.id = id;
        this.title = title;
        this.price = price;
    }

    // CREATE
    public static Product createProduct(int id, String title, double price) {
        return new Product(id, title, price);
    }

    // READ
    public void display() {
        System.out.println(this);
    }

    // UPDATE
    public void update(String title, double price) {
        this.title = title;
        this.price = price;
    }

    // DELETE: ở mức quản lý danh sách thì remove khỏi ArrayList

    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "Product {id=" + id + ", title=" + title + ", price=" + price + "}";
    }
}


class Order {
    private int orderId;
    private Date date;
    private ArrayList<Product> products;

    public Order(int orderId) {
        this.orderId = orderId;
        this.date = new Date();
        this.products = new ArrayList<>();
    }

    // CREATE
    public static Order createOrder(int orderId) {
        return new Order(orderId);
    }

    // READ
    public void display() {
        System.out.println(this);
    }

    // UPDATE: thêm / xóa sản phẩm
    public void addProduct(Product p) {
        products.add(p);
    }

    public void removeProduct(Product p) {
        products.remove(p);
    }

    // DELETE: remove khỏi danh sách quản lý

    public double calculateTotal() {
        double total = 0;
        for (Product p : products) {
            total += p.getPrice();
        }
        return total;
    }

    @Override
    public String toString() {
        return "Order {id=" + orderId + ", date=" + date + ", total=" + calculateTotal() + "}";
    }
}


public class Main {
    public static void main(String[] args) {
        // CRUD demo cho User
        User u1 = User.createUser(1, "Nguyen Van A", "a@gmail.com", "123");
        u1.display(); // Read
        u1.updateInfo("Nguyen Van B", "b@gmail.com"); // Update
        u1.display();

        // CRUD demo cho Product
        Product p1 = Product.createProduct(101, "Laptop", 1500);
        p1.display(); // Read
        p1.update("Gaming Laptop", 2000); // Update
        p1.display();

        // CRUD demo cho Order
        Order o1 = Order.createOrder(1001);
        o1.addProduct(p1); // Create/Add
        o1.display(); // Read
        o1.removeProduct(p1); // Delete
        o1.display();
    }
}
