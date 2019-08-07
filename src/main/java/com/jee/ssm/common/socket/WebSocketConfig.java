package com.jee.ssm.common.socket;

import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * 暂用配置文件管理
 * @author GaoXiang
 * @version 1.0
 * @since 2016/11/7.
 */
/*@Configuration
@EnableWebSocket*/
public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        //setAllowedOrigins方法用来设置来自那些域名的请求可访问，默认为localhost
        registry.addHandler(myhandler(), "/webSocket").addInterceptors(myInterceptors()).setAllowedOrigins("*");

        //允许SockJS访问的地址
        registry.addHandler(myhandler(), "/sockjs/webSocket").addInterceptors(myInterceptors()).withSockJS();
    }

    @Bean
    public WebSocketHandler myhandler() {
        return new MessageWebSocketHandler();
    }

    @Bean
    public HandshakeInterceptor myInterceptors() {
        return new HandshakeInterceptor();
    }
}
