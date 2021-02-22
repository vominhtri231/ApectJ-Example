package tri.test.changetrack;

@ChangeTrackable
public class Cat extends Dog {
    private int age;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
