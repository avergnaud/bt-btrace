# bt-btrace

https://github.com/btraceio/btrace/releases


./init.ps1

./monitor.ps1

# jackson-databind call example

Using `jstack();` inside TraceJackson.java:

```
JACKSON-METHOD-ENTER: com.fasterxml.jackson.databind.ser.std.BeanSerializerBase.serializeFields

com.fasterxml.jackson.databind.ser.BeanSerializer.serialize(BeanSerializer.java:183)
com.fasterxml.jackson.databind.ser.DefaultSerializerProvider._serialize(DefaultSerializerProvider.java:503)
com.fasterxml.jackson.databind.ser.DefaultSerializerProvider.serializeValue(DefaultSerializerProvider.java:342)
com.fasterxml.jackson.databind.ObjectMapper._writeValueAndClose(ObjectMapper.java:4859)
com.fasterxml.jackson.databind.ObjectMapper.writeValueAsString(ObjectMapper.java:4079)
some.MyUtility1.test(MyUtility1.java:11)
com.example.bt_some_webapp.HelloController.index(HelloController.java:21)
java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
java.base/java.lang.reflect.Method.invoke(Method.java:580)
org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:258)
org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:191)
org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)
org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:991)
org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:896)
org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)
org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1089)
org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:979)
org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1014)
org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)
jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)
```