package org.osmf.elements {

import flash.events.NetStatusEvent;
import flash.net.NetStream;

import org.osmf.elements.audioClasses.AudioAudioTrait;
import org.osmf.elements.audioClasses.AudioPlayTrait;
import org.osmf.elements.audioClasses.AudioSeekTrait;
import org.osmf.elements.audioClasses.AudioTimeTrait;
import org.osmf.elements.audioClasses.SoundAdapter;
import org.osmf.elements.audioClasses.SoundLoadTrait;
import org.osmf.events.MediaError;
import org.osmf.events.MediaErrorCodes;
import org.osmf.events.MediaErrorEvent;
import org.osmf.media.DefaultTraitResolver;
import org.osmf.media.LoadableElementBase;
import org.osmf.media.MediaResourceBase;
import org.osmf.media.URLResource;
import org.osmf.net.*;
import org.osmf.traits.LoadTrait;
import org.osmf.traits.LoaderBase;
import org.osmf.traits.MediaTraitType;
import org.osmf.traits.TimeTrait;
import org.osmf.utils.OSMFStrings;

public class AudioElement extends LoadableElementBase {


    private var soundAdapter: SoundAdapter;

    private var stream: NetStream;

    private var defaultTimeTrait: ModifiableTimeTrait;

    private var _alternateLoaders: Vector.<LoaderBase>;

    public function AudioElement(param1: URLResource = null, param2: LoaderBase = null) {
        super(param1, param2);
        if (!(param2 == null || param2 is NetLoader || param2 is SoundLoader)) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
    }

    public function get defaultDuration(): Number {
        return !!this.defaultTimeTrait ? this.defaultTimeTrait.duration : NaN;
    }

    public function set defaultDuration(param1: Number): void {
        if (isNaN(param1) || param1 < 0) {
            if (this.defaultTimeTrait != null) {
                removeTraitResolver(MediaTraitType.TIME);
                this.defaultTimeTrait = null;
            }
        } else {
            if (this.defaultTimeTrait == null) {
                this.defaultTimeTrait = new ModifiableTimeTrait();
                addTraitResolver(MediaTraitType.TIME, new DefaultTraitResolver(MediaTraitType.TIME, this.defaultTimeTrait));
            }
            this.defaultTimeTrait.duration = param1;
        }
    }

    override public function set resource(param1: MediaResourceBase): void {
        loader = getLoaderForResource(param1, this.alternateLoaders);
        super.resource = param1;
    }

    override protected function createLoadTrait(param1: MediaResourceBase, param2: LoaderBase): LoadTrait {
        return param2 is NetLoader ? new NetStreamLoadTrait(param2, param1) : new SoundLoadTrait(param2, param1);
    }

    override protected function processReadyState(): void {
        var _loc2_: * = null;
        var _loc4_: * = null;
        var _loc1_: LoadTrait = getTrait(MediaTraitType.LOAD) as LoadTrait;
        this.soundAdapter = null;
        this.stream = null;
        var _loc3_: NetStreamLoadTrait = _loc1_ as NetStreamLoadTrait;
        if (_loc3_) {
            this.stream = _loc3_.netStream;
            this.stream.addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatusEvent);
            addTrait(MediaTraitType.PLAY, new NetStreamPlayTrait(this.stream, resource));
            _loc2_ = new NetStreamTimeTrait(this.stream, resource, this.defaultDuration);
            addTrait(MediaTraitType.TIME, _loc2_);
            addTrait(MediaTraitType.SEEK, new NetStreamSeekTrait(_loc2_, _loc1_, this.stream));
            addTrait(MediaTraitType.AUDIO, new NetStreamAudioTrait(this.stream));
            addTrait(MediaTraitType.BUFFER, new NetStreamBufferTrait(this.stream));
        } else {
            _loc4_ = _loc1_ as SoundLoadTrait;
            this.soundAdapter = new SoundAdapter(this, _loc4_.sound);
            addTrait(MediaTraitType.PLAY, new AudioPlayTrait(this.soundAdapter));
            _loc2_ = new AudioTimeTrait(this.soundAdapter);
            addTrait(MediaTraitType.TIME, _loc2_);
            addTrait(MediaTraitType.SEEK, new AudioSeekTrait(_loc2_, this.soundAdapter));
            addTrait(MediaTraitType.AUDIO, new AudioAudioTrait(this.soundAdapter));
        }
    }

    override protected function processUnloadingState(): void {
        if (this.stream != null) {
            this.stream.removeEventListener(NetStatusEvent.NET_STATUS, this.onNetStatusEvent);
        }
        removeTrait(MediaTraitType.PLAY);
        removeTrait(MediaTraitType.SEEK);
        removeTrait(MediaTraitType.TIME);
        removeTrait(MediaTraitType.AUDIO);
        removeTrait(MediaTraitType.BUFFER);
        if (this.soundAdapter != null) {
            this.soundAdapter.pause();
        }
        this.soundAdapter = null;
        this.stream = null;
    }

    private function onNetStatusEvent(param1: NetStatusEvent): void {
        var _loc2_: * = null;
        switch (param1.info.code) {
            case NetStreamCodes.NETSTREAM_PLAY_FAILED:
            case NetStreamCodes.NETSTREAM_FAILED:
                _loc2_ = new MediaError(MediaErrorCodes.NETSTREAM_PLAY_FAILED, param1.info.description);
                break;
            case NetStreamCodes.NETSTREAM_PLAY_STREAMNOTFOUND:
                _loc2_ = new MediaError(MediaErrorCodes.NETSTREAM_STREAM_NOT_FOUND, param1.info.description);
                break;
            case NetStreamCodes.NETSTREAM_PLAY_FILESTRUCTUREINVALID:
                _loc2_ = new MediaError(MediaErrorCodes.NETSTREAM_FILE_STRUCTURE_INVALID, param1.info.description);
                break;
            case NetStreamCodes.NETSTREAM_PLAY_NOSUPPORTEDTRACKFOUND:
                _loc2_ = new MediaError(MediaErrorCodes.NETSTREAM_NO_SUPPORTED_TRACK_FOUND, param1.info.description);
        }
        if (_loc2_ != null) {
            dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR, false, false, _loc2_));
        }
    }

    private function get alternateLoaders(): Vector.<LoaderBase> {
        if (this._alternateLoaders == null) {
            this._alternateLoaders = new Vector.<LoaderBase>();
            this._alternateLoaders.push(new SoundLoader());
            this._alternateLoaders.push(new NetLoader());
        }
        return this._alternateLoaders;
    }
}
}
