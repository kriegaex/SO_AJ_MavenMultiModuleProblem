package de.scrum_master.aspect;

import de.scrum_master.common.YourAnnotation;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class YourAspect {
  @Pointcut("@annotation(yourAnnotationVariableName)")
  public void annotationPointCutDefinition(YourAnnotation yourAnnotationVariableName) {
  }

  @Pointcut("execution(* *(..))")
  public void atExecution() {
  }

  @Around("annotationPointCutDefinition(yourAnnotationVariableName) && atExecution()")
  public Object aroundAdvice(ProceedingJoinPoint thisJoinPoint, YourAnnotation yourAnnotationVariableName) throws Throwable {
    if (yourAnnotationVariableName.isRun()) {
      Object result;
      try {
        System.out.println("Before " + thisJoinPoint);
        result = thisJoinPoint.proceed();
      } catch (Throwable t) {
        throw t;
      } finally {
        System.out.println("After " + thisJoinPoint);
      }
      return result;
    }
    return thisJoinPoint.proceed();
  }
}
