package com.kalaazu.cms.mvc;

import com.kalaazu.cms.server.*;
import io.vertx.core.Vertx;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;
import io.vertx.ext.web.RoutingContext;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * Triad class.
 * ============
 *
 * Main component of the HMV(VM)C pattern.
 * It links the MV(VM)C components and implements a hierarchical tree.
 *
 * Each triad is associated with an endpoint which will be used
 * to handle the incoming requests.
 *
 * The triad will check if the request can be handled by the
 * annotated methods, otherwise it will call `Controller.index`.
 *
 * TODO refactor annotation processing to their own class.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public abstract class Triad<M extends Model, P extends Presenter, C extends Controller> {
    /**
     * Console logger.
     */
    public static final Logger logger = LoggerFactory.getLogger(Triad.class);

    /**
     * Parent triad.
     */
    private Optional<Triad> parent;

    /**
     * Children triads.
     */
    private Map<String, Triad> children = new HashMap<>();

    /**
     * The model.
     */
    private M model;

    /**
     * The presenter.
     */
    private P presenter;

    /**
     * The controller.
     */
    private C controller;

    /**
     * Request handlers.
     */
    private Map<Class<? extends Annotation>, Map<String, Method>> handlers = new HashMap<>();

    /**
     * Constructor.
     */
    public Triad() {
        this(null, null, null, null);
    }

    /**
     * Constructor.
     *
     * @param parent Parent triad.
     */
    public Triad(Triad parent) {
        this(parent, null, null, null);
    }

    /**
     * Constructor.
     *
     * @param model      Model instance.
     * @param presenter  Presenter instance.
     * @param controller Controller instance.
     */
    public Triad(M model, P presenter, C controller) {
        this(null, model, presenter, controller);
    }

    /**
     * Constructor.
     *
     * @param parent     Parent triad.
     * @param model      Model instance.
     * @param presenter  Presenter instance.
     * @param controller Controller instance.
     */
    public Triad(Triad parent, M model, P presenter, C controller) {
        this.setParent(parent);
        this.initialize(model, presenter, controller);
    }

    /**
     * Initializes the triad.
     *
     * @param model      The model instance.
     * @param presenter  The presenter instance.
     * @param controller The controller instance.
     */
    public void initialize(M model, P presenter, C controller) {
        if (model == null || presenter == null || controller == null) {
            return;
        }

        this.setModel(model);
        this.setPresenter(presenter);
        this.setController(controller);
    }

    /**
     * Returns the endpoint associated to this triad.
     *
     * @return URL endpoint.
     */
    public abstract String getEndpoint();

    /**
     * Handles an incoming HTTP request.
     *
     * @param context The HTTP request context.
     */
    public void handle(RoutingContext context) {
        Vertx.currentContext()
             .executeBlocking(h -> {
                 this.route(context);
             }, h -> {
                 if (context.response()
                            .ended()) {
                     return;
                 }

                 context.response()
                        .end("");
             });
    }

    /**
     * Routes the request through the registered handlers.
     *
     * @param context The HTTP request context.
     */
    private void route(RoutingContext context) {
        var uri = context.request()
                         .uri()
                         .split("/");
        var action = "index";

        Class<? extends Annotation> method = Request.class;

        try {
            action = uri[2];
        } catch (Exception ignored) {
        }

        switch (context.request()
                       .method()) {
            case GET:
                method = Get.class;
                break;

            case POST:
                method = Post.class;
                break;

            case PUT:
                method = Put.class;
                break;

            case DELETE:
                method = Delete.class;
        }

        var handler = this.findHandler(method, action);

        if (handler == null) {
            handler = this.findHandler(Request.class, "index");
        }

        var response = "";
        try {
            response = (String) handler.invoke(this.getController(), context);
        } catch (Exception e) {
            Triad.logger.warn("Couldn't invoke method!", e.getCause());
        }

        Triad.logger.info("Finish handler");

        if (response == null) {
            return;
        }

        context.response()
               .putHeader("Content-Type", "text/html")
               .end(response);
    }

    /**
     * Scans the controller for the annotations.
     */
    private void scanAnnotations() {
        if (this.controller == null) {
            return;
        }

        Class<? extends Controller> clazz = this.controller.getClass();

        for (Method m : clazz.getDeclaredMethods()) {
            if (m.isAnnotationPresent(Request.class)) {
                this.addAnnotation(Request.class, m);
            }
            if (m.isAnnotationPresent(Get.class)) {
                this.addAnnotation(Get.class, m);
            }
            if (m.isAnnotationPresent(Post.class)) {
                this.addAnnotation(Post.class, m);
            }
            if (m.isAnnotationPresent(Put.class)) {
                this.addAnnotation(Put.class, m);
            }
            if (m.isAnnotationPresent(Delete.class)) {
                this.addAnnotation(Delete.class, m);
            }
        }
    }

    /**
     * Adds an annotated method to the list.
     *
     * @param type   Annotation type.
     * @param method Annotated method.
     */
    private void addAnnotation(Class<? extends Annotation> type, Method method) {
        if (!this.isValidHandler(method)) {
            return;
        }

        method.setAccessible(true);
        var handlers = this.getHandlers(type);
        handlers.put(method.getName(), method);

        this.handlers.put(type, handlers);
    }

    /**
     * Checks that a method is a valid request handler.
     *
     * A request handler must accept a HttpServerRequest parameter
     * and return a string.
     *
     * @param method Method to check.
     *
     * @return Whether the method is a valid handler or not.
     */
    private boolean isValidHandler(Method method) {
        var correct = false;

        try {
            correct = (
                    method.getParameterTypes()[0] == RoutingContext.class &&
                    method.getReturnType() == String.class
            );
        } catch (Exception ignored) {
        }

        return correct;
    }

    /**
     * Returns the registered handlers of the given type.
     *
     * @param type annotation type.
     */
    private Map<String, Method> getHandlers(Class<? extends Annotation> type) {
        return this.handlers.getOrDefault(type, new HashMap<>());
    }


    /**
     * Adds a child triad.
     *
     * @param name  Child name.
     * @param triad The triad.
     */
    public void addChildren(String name, Triad triad) {
        triad.setParent(this);

        this.children.put(name, triad);
    }

    /**
     * Sets the parent triad.
     *
     * @param parent Parent triad.
     */
    private void setParent(Triad parent) {
        if (parent == null) {
            this.parent = Optional.empty();

            return;
        }

        this.parent = Optional.of(parent);
    }

    /**
     * Finds and returns a handler.
     *
     * @param type   Request type.
     * @param action Handler action.
     *
     * @return The specified handler.
     */
    private Method findHandler(Class<? extends Annotation> type, String action) {
        var handlers = this.handlers.getOrDefault(type, Collections.emptyMap());

        if (handlers.isEmpty()) {
            handlers = this.handlers.getOrDefault(Request.class, Collections.emptyMap());
        }

        return handlers.getOrDefault(action, null);
    }

    //<editor-fold desc="Getters and Setters">
    public M getModel() {
        return model;
    }

    public void setModel(M model) {
        this.model = model;
    }

    public P getPresenter() {
        return presenter;
    }

    public void setPresenter(P presenter) {
        this.presenter = presenter;

        this.presenter.setView(new View(this));
    }

    public C getController() {
        return controller;
    }

    public void setController(C controller) {
        this.controller = controller;

        this.scanAnnotations();
    }

    public Triad getChild(String name) {
        return this.children.getOrDefault(name, null);
    }

    public Optional<Triad> getParent() {
        return parent;
    }

    public Map<String, Triad> getChildren() {
        return children;
    }
    //</editor-fold>
}
