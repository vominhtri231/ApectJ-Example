package tri.test;

public aspect HelloAspect {
    pointcut callSayHello(): call(void HelloDemo.sayHello());

    before(): callSayHello(){
        System.out.println("Before say hello");
    }
}
