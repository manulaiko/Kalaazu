
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import java.io.Serializable;
import java.time.Instant;

import com.github.mcollovati.vertx.vaadin.VaadinVerticle;
import com.github.mcollovati.vertx.vaadin.VaadinVerticleConfiguration;
import com.github.mcollovati.vertx.vaadin.VertxVaadinRequest;
import com.vaadin.annotations.*;
import com.vaadin.server.VaadinRequest;
import com.vaadin.server.VaadinService;
import com.vaadin.ui.Label;
import com.vaadin.ui.Notification;
import com.vaadin.ui.UI;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.components.grid.Header;
import com.vaadin.ui.themes.ValoTheme;
import io.vertx.core.Context;
import io.vertx.core.Vertx;

@VaadinVerticleConfiguration(mountPoint = "/*", serviceName = "SimpleVerticle.Service")
@VaadinServletConfiguration(ui = VaadinUI.class, productionMode = false)
public class VaadinVerticleTest extends VaadinVerticle {
    public static void main(String[] args) {
        var vertx = Vertx.vertx();
        vertx.deployVerticle(new VaadinVerticleTest());
    }

    @Override
    public void init(Vertx vertx, Context context) {
        super.init(vertx, context);
        context.config().put("httpPort", 8080);
    }
}

@Theme(ValoTheme.THEME_NAME)
@Title("Vert.x vaadin sample")
//@Widgetset("com.github.mcollovati.vertx.vaadin.VaadinVertxWidgetset")
@Widgetset("com.vaadin.DefaultWidgetSet")
class VaadinUI extends UI {

    @Override
    protected void init(VaadinRequest request) {

        VertxVaadinRequest req    = (VertxVaadinRequest) request;
        Cookie             cookie = new Cookie("myCookie", "myValue");
        cookie.setMaxAge(120);
        cookie.setPath(req.getContextPath());
        VaadinService.getCurrentResponse().addCookie(cookie);

        Label sessionAttributeLabel = new Label("Session listener");


        String deploymentId = req.getService().getVertx().getOrCreateContext().deploymentID();

        setContent(new VerticalLayout(
                new Label(String.format("Verticle %s deployed on Vert.x", deploymentId)),
                new Label("Session created at " + Instant.ofEpochMilli(req.getWrappedSession().getCreationTime())),
                sessionAttributeLabel
        ));
    }

    @Override
    public void attach() {
        super.attach();
        //HttpSessionBindingListener sessionAttr = new SampleHttpSessionBindingListener();
        //getSession().getSession().setAttribute("myAttribute", sessionAttr);
    }


    private class SampleHttpSessionBindingListener implements HttpSessionBindingListener, Serializable {
        @Override
        public void valueBound(HttpSessionBindingEvent event) {
            System.out.println("================================================== bound " + event.getName());
            getUI().access(() -> Notification.show("Attribute Set"));

        }

        @Override
        public void valueUnbound(HttpSessionBindingEvent event) {
            System.out.println("================================================== unbound " + event.getName());
            getUI().access(() -> Notification.show("Attribute removed"));
        }
    }
}