# 00P_N04_25_26_CongGiap_DucThinh
Repo working group


Yeu cau 3:
Project/ - Quản lý Mua Hàng
│── src/
│   ├── User.java
│   ├── Product.java
│   ├── Order.java
│   └── Main.java
│── README.md


import java.util.ArrayList;
import java.util.Date;


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

    public boolean login(String email, String password) {
        return this.email.equals(email) && this.password.equals(password);
    }

    public void updateInfo(String name, String email) {
        this.name = name;
        this.email = email;
    }

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

    public void addProduct(Product p) {
        products.add(p);
    }

    public void removeProduct(Product p) {
        products.remove(p);
    }

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
        
        User user = new User(1, "Nguyen Van A", "a@gmail.com", "123456");

        
        if (user.login("a@gmail.com", "123456")) {
            System.out.println("Login thành công: " + user);
        } else {
            System.out.println("Sai thông tin đăng nhập!");
        }

        
        Product p1 = new Product(101, "Laptop", 1500);
        Product p2 = new Product(102, "Smartphone", 800);
        Product p3 = new Product(103, "Tablet", 500);

        
        Order order = new Order(1001);
        order.addProduct(p1);
        order.addProduct(p2);
        order.addProduct(p3);

        
        System.out.println(order);
    }
}
