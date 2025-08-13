# bt-btrace

[https://github.com/btraceio/btrace/releases](https://github.com/btraceio/btrace/releases)

## Usage

```
./init.ps1
./monitor.ps1 <<pid>>
```

## Test case

The mvn dependency tree may show jackson-databind:
```
com.example:bt-some-webapp:jar:0.0.1-SNAPSHOT
\- com.example:bt-some-lib:jar:0.0.1-SNAPSHOT:compile
   \- com.fasterxml.jackson.core:jackson-databind:jar:2.19.2:compile
```

But it does not imply that this dependency is called at runtime.

![test_case.drawio](./docs/test_case.drawio.png?raw=true)

## Demo: detecting jackson-databind calls

For both positive and negative tests, we use the same library version:
 * [https://github.com/avergnaud/bt-some-lib](https://github.com/avergnaud/bt-some-lib)

### positive test

Webapp version:
 * [https://github.com/avergnaud/bt-some-webapp/tree/calling-jackson-databind](https://github.com/avergnaud/bt-some-webapp/tree/calling-jackson-databind)

![calling-jackson-databind gif](./docs/calling-jackson-databind.gif?raw=true)

![calling-jackson-databind.webm](./docs/calling-jackson-databind.webm?raw=true)

### negative test

Webapp version:
 * [https://github.com/avergnaud/bt-some-webapp/tree/not-calling-jackson-databind](https://github.com/avergnaud/bt-some-webapp/tree/not-calling-jackson-databind)

![not-calling-jackson-databind gif](./docs/not-calling-jackson-databind.gif?raw=true)

![not-calling-jackson-databind.webm](./docs/not-calling-jackson-databind.webm?raw=true)

## Appendix: jackson-databind call example

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