package com.kalaazu.cms.mvc;

import com.mitchellbosecke.pebble.PebbleEngine;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * View component.
 * ===============
 *
 * Represents the V in MV(VM)C.
 *
 * It contains the HTML.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class View extends Component {
    ///////////////////////////////////
    // Static methods and properties //
    ///////////////////////////////////

    /**
     * Console logger.
     */
    public static final Logger logger = LoggerFactory.getLogger(View.class);

    /**
     * Path to the views.
     */
    public static String viewsPath = "www/views";

    /**
     * Pebble instance.
     */
    private static PebbleEngine pebble;

    /**
     * Global variables.
     */
    public static final Map<String, Object> globalVariables = new HashMap<>();

    /**
     * Builds and returns the template engine.
     *
     * @return Pebble template engine.
     */
    public static PebbleEngine getPebble() {
        if (View.pebble != null) {
            return View.pebble;
        }

        var builder = new PebbleEngine.Builder();
        builder.cacheActive(false);

        View.pebble = builder.build();

        return View.pebble;
    }

    ///////////////////////////////////////
    // Non static methods and properties //
    ///////////////////////////////////////

    /**
     * View variables.
     */
    private Map<String, Object> variables = new HashMap<>();

    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public View(Triad triad) {
        super(triad);
    }

    /**
     * Adds a variable.
     *
     * @param key   Variable name.
     * @param value Variable value.
     */
    public void addVariable(String key, Object value) {
        this.variables.put(key, value);
    }

    /**
     * Renders the view.
     *
     * @param name Template to render.
     */
    public String render(String name) {
        var template = View.getPebble()
                           .getTemplate(View.viewsPath + "/" + name + ".tpl");
        var writer   = new StringWriter();

        var variables = new HashMap<String, Object>();
        variables.putAll(View.globalVariables);
        variables.putAll(this.variables);

        try {
            template.evaluate(writer, variables);
        } catch (IOException e) {
            View.logger.warn("Couldn't render template!", e);
        }

        return writer.toString();
    }
}
