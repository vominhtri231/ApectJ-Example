package tri.test.hello;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public aspect HelloAspect {
    private static final Logger logger = LoggerFactory.getLogger(HelloAspect.class);

    pointcut callSayHello(): call(void tri.test.hello.HelloDemo.sayHello());

    before(): callSayHello(){
        logger.info("Before say hello");
    }
}
