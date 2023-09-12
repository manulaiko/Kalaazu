package org.osmf.metadata {

public class NullMetadataSynthesizer extends MetadataSynthesizer {


    public function NullMetadataSynthesizer() {
        super();
    }

    override public function synthesize(param1: String, param2: Metadata, param3: Vector.<Metadata>, param4: String, param5: Metadata): Metadata {
        return null;
    }
}
}
