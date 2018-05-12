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
    public static final PebbleEngine pebble = new PebbleEngine.Builder().build();

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
        var template = View.pebble.getTemplate(View.viewsPath + "/" + name + ".tpl");
        var writer   = new StringWriter();

        try {
            template.evaluate(writer, this.variables);
        } catch (IOException e) {
            View.logger.debug("Couldn't render template!", e);
        }

        return writer.toString();
    }
}
