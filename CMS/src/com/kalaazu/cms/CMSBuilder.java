package com.kalaazu.cms;

import com.kalaazu.eventsystem.EventManager;
import com.kalaazu.persistence.Persistence;

/**
 * CMS Builder.
 * ============
 *
 * Builds and initializes `CMS` instances.
 *
 * Usage:
 *
 * ```java
 * var builder = new CMSBuilder();
 *
 * builder.setEventManager(eventManager)
 * .setPersistence(persistence)
 * .setPort(80)
 * .setViewsPath("www/views")
 * .setAssetsPath("www/public_html");
 *
 * var cms = builder.build()
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class CMSBuilder {
    private EventManager eventManager;
    private Persistence  persistence;
    private int          port       = 80;
    private String       viewsPath  = "www/views";
    private String       assetsPath = "www/public_html";

    /**
     * Builds and initializes the CMS.
     *
     * @return Initialized CMS.
     */
    public CMS build() {
        if (this.eventManager == null || this.persistence == null) {
            throw new ExceptionInInitializerError("Neither event manager nor persistence can't be null!");
        }

        var cms = new CMS(this.eventManager, this.persistence);

        cms.initialize(this.port, this.viewsPath, this.assetsPath);

        return cms;
    }

    //<editor-fold desc="Setters">
    public CMSBuilder setEventManager(EventManager eventManager) {
        this.eventManager = eventManager;

        return this;
    }

    public CMSBuilder setPersistence(Persistence persistence) {
        this.persistence = persistence;

        return this;
    }

    public CMSBuilder setPort(int port) {
        this.port = port;

        return this;
    }

    public CMSBuilder setViewsPath(String viewsPath) {
        this.viewsPath = viewsPath;

        return this;
    }

    public CMSBuilder setAssetsPath(String assetsPath) {
        this.assetsPath = assetsPath;

        return this;
    }
    //</editor-fold>
}
