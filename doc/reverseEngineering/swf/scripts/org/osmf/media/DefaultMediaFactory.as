package org.osmf.media {

import org.osmf.elements.AudioElement;
import org.osmf.elements.F4MElement;
import org.osmf.elements.F4MLoader;
import org.osmf.elements.ImageElement;
import org.osmf.elements.ImageLoader;
import org.osmf.elements.SWFElement;
import org.osmf.elements.SWFLoader;
import org.osmf.elements.SoundLoader;
import org.osmf.elements.VideoElement;
import org.osmf.net.NetLoader;
import org.osmf.net.dvr.DVRCastNetLoader;
import org.osmf.net.httpstreaming.HTTPStreamingNetLoader;
import org.osmf.net.rtmpstreaming.RTMPDynamicStreamingNetLoader;

public class DefaultMediaFactory extends MediaFactory {


    private var rtmpStreamingNetLoader: RTMPDynamicStreamingNetLoader;

    private var f4mLoader: F4MLoader;

    private var dvrCastLoader: DVRCastNetLoader;

    private var netLoader: NetLoader;

    private var imageLoader: ImageLoader;

    private var swfLoader: SWFLoader;

    private var soundLoader: SoundLoader;

    private var httpStreamingNetLoader: HTTPStreamingNetLoader;

    public function DefaultMediaFactory() {
        super();
        this.init();
    }

    private function init(): void {
        this.f4mLoader = new F4MLoader(this);
        addItem(new MediaFactoryItem("org.osmf.elements.f4m", this.f4mLoader.canHandleResource, function (): MediaElement {
            return new F4MElement(null, f4mLoader);
        }));
        this.dvrCastLoader = new DVRCastNetLoader();
        addItem(new MediaFactoryItem("org.osmf.elements.video.dvr.dvrcast", this.dvrCastLoader.canHandleResource, function (): MediaElement {
            return new VideoElement(null, dvrCastLoader);
        }));
        this.httpStreamingNetLoader = new HTTPStreamingNetLoader();
        addItem(new MediaFactoryItem("org.osmf.elements.video.httpstreaming", this.httpStreamingNetLoader.canHandleResource, function (): MediaElement {
            return new VideoElement(null, httpStreamingNetLoader);
        }));
        this.rtmpStreamingNetLoader = new RTMPDynamicStreamingNetLoader();
        addItem(new MediaFactoryItem("org.osmf.elements.video.rtmpdynamicStreaming", this.rtmpStreamingNetLoader.canHandleResource, function (): MediaElement {
            return new VideoElement(null, rtmpStreamingNetLoader);
        }));
        this.netLoader = new NetLoader();
        addItem(new MediaFactoryItem("org.osmf.elements.video", this.netLoader.canHandleResource, function (): MediaElement {
            return new VideoElement(null, netLoader);
        }));
        this.soundLoader = new SoundLoader();
        addItem(new MediaFactoryItem("org.osmf.elements.audio", this.soundLoader.canHandleResource, function (): MediaElement {
            return new AudioElement(null, soundLoader);
        }));
        addItem(new MediaFactoryItem("org.osmf.elements.audio.streaming", this.netLoader.canHandleResource, function (): MediaElement {
            return new AudioElement(null, netLoader);
        }));
        this.imageLoader = new ImageLoader();
        addItem(new MediaFactoryItem("org.osmf.elements.image", this.imageLoader.canHandleResource, function (): MediaElement {
            return new ImageElement(null, imageLoader);
        }));
        this.swfLoader = new SWFLoader();
        addItem(new MediaFactoryItem("org.osmf.elements.swf", this.swfLoader.canHandleResource, function (): MediaElement {
            return new SWFElement(null, swfLoader);
        }));
    }
}
}
