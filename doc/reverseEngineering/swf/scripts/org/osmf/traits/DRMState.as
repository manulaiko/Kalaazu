package org.osmf.traits {

public final class DRMState {

    public static const UNINITIALIZED: String = "uninitialized";

    public static const AUTHENTICATION_NEEDED: String = "authenticationNeeded";

    public static const AUTHENTICATING: String = "authenticating";

    public static const AUTHENTICATION_COMPLETE: String = "authenticationComplete";

    public static const AUTHENTICATION_ERROR: String = "authenticationError";

    public static const DRM_SYSTEM_UPDATING: String = "drmSystemUpdating";


    public function DRMState() {
        super();
    }
}
}
