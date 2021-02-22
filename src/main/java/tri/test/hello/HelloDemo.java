package tri.test.hello;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HelloDemo {
    private static final Logger logger = LoggerFactory.getLogger(HelloDemo.class);

    public static void sayHello() {
        logger.info("Hello");
    }
}
