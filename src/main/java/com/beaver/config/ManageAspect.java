package com.beaver.config;


import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class ManageAspect {

    /**
     * 这里我们使用注解的形式
     * 当然，我们也可以通过切点表达式直接指定需要拦截的package,需要拦截的class 以及 method
     * 切点表达式:   execution(...)
     */
    @Pointcut("execution(public * com.beaver.service.impl.*.*(..))")
    public void logPointCut() {}


//    @Around("webLog()")
//    public Object arround(ProceedingJoinPoint pjp) {
//        System.out.println("HH 方法环绕start.....");
//        try {
//            Object ret = null;
//            // TODO: 此处为自定义验证逻辑，符合条件则继续执行，否则终止方法的执行
//            if (1 == 1) {
//                // 执行方法
//                ret =  pjp.proceed();
//                System.out.println("HH 方法环绕proceed，结果是 :" + ret);
//            } else {
//                System.out.println("HH 方法环绕proceed，不满足条件未执行");
//            }
//
//            return ret;
//        } catch (Throwable e) {
//            e.printStackTrace();
//            return null;
//        }
}
