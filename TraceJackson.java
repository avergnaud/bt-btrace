import org.openjdk.btrace.core.annotations.*;
import static org.openjdk.btrace.core.BTraceUtils.*;

/**
 * Print each time any method in the com.fasterxml.jackson.databind package is entered.
 * Use the clazz and method regex form (note the /.../ delimiters).
 */
@BTrace
public class TraceJackson {
  // matches any class under com.fasterxml.jackson.databind (subpackages included)
  @OnMethod(
    clazz="/com\\.fasterxml\\.jackson\\.databind\\..*/",
    method="/.*/"
  )
  public static void onEnter(@ProbeClassName String className, @ProbeMethodName String methodName) {
    println("JACKSON-METHOD-ENTER: " + str(className) + "." + str(methodName));
    // optionally: print the caller stack
    jstack();
  }
}
