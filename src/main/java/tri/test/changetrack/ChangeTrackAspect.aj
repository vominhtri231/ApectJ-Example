package tri.test.changetrack;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.aspectj.lang.Signature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

aspect ChangeTrackAspect {
    private static final Logger logger = LoggerFactory.getLogger(ChangeTrackAspect.class);

    private pointcut changeProperty(Object bean, Object newValue) :
            this(bean) && execution(void (@ChangeTrackable *).set*(..)) && args(newValue);

    before(Object bean, Object newValue): changeProperty(bean, newValue) {
        String fieldName = getFieldName(thisJoinPointStaticPart.getSignature());
        Object oldValue = getOldValue(bean, fieldName);
        logger.info("Update property `{}` of `{}`, from `{}` to `{}`", fieldName, bean, oldValue, newValue);
    }

    private String getFieldName(Signature setterSignature) {
        String name = setterSignature.getName();
        return name.substring(3, 4).toLowerCase() + name.substring(4);
    }

    private Object getOldValue(Object bean, String fieldName) {
        try {
            return BeanUtils.getProperty(bean, fieldName);
        } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
            logger.error("Unable to get old value", e);
            throw new RuntimeException("Unable to get old value", e);
        }
    }
}
