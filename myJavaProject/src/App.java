import controllers.HappyActor;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");

        HappyActor happy = new HappyActor();
        happy.act();
    }
}
