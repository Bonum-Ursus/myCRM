package com.BonumUrsus.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Aspect
@Component
@Order(1)
public class CRMLoggingAspect {
    private Logger log = LoggerFactory.getLogger(CRMLoggingAspect.class.getName());

    @Pointcut("execution(* com.BonumUrsus.controllers.*.*(..))")
    private void forControllerPackage(){}

    @Pointcut("execution(* com.BonumUrsus.dao.*.*(..))")
    private void forDaoPackage(){}

    @Pointcut("execution(* com.BonumUrsus.services.*.*(..))")
    private void forServicePackage(){}

    @Pointcut("forControllerPackage() || forDaoPackage() || forServicePackage()")
    private void forAppFlow(){}

    @Before("forAppFlow()")
    public void before(JoinPoint joinPoint){

        Object[] args = joinPoint.getArgs();
        for (Object obj : args) {
            log.info("| Method: " + joinPoint.getSignature().toShortString() +
                    "| Arguments: " + obj.toString());
        }
    }

    @AfterReturning(pointcut = "forAppFlow()", returning = "result")
    public void afterReturning(JoinPoint jp, Object result){
        Object[] args = jp.getArgs();
        for (Object obj : args) {
            log.info("| Method: " + jp.getSignature()
                    .toShortString() +
                    "| Arguments: " + obj.toString() +
                    "| Result: " + result);
        }
    }
}
