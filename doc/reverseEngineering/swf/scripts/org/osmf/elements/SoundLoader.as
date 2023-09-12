package org.osmf.elements {

import flash.errors.IOError;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.media.SoundLoaderContext;
import flash.net.URLRequest;

import org.osmf.elements.audioClasses.SoundLoadTrait;
import org.osmf.events.MediaError;
import org.osmf.events.MediaErrorCodes;
import org.osmf.events.MediaErrorEvent;
import org.osmf.media.MediaResourceBase;
import org.osmf.media.MediaType;
import org.osmf.media.MediaTypeUtil;
import org.osmf.media.URLResource;
import org.osmf.traits.LoadState;
import org.osmf.traits.LoadTrait;
import org.osmf.traits.LoaderBase;
import org.osmf.utils.*;

public class SoundLoader extends LoaderBase {

    private static const MIME_TYPES_SUPPORTED: Vector.<String> = Vector.<String>(["audio/mpeg"]);

    private static const MEDIA_TYPES_SUPPORTED: Vector.<String> = Vector.<String>([MediaType.AUDIO]);

    private static const MIN_BYTES_TO_RECEIVE: int = 16;


    private var checkPolicyFile: Boolean;

    public function SoundLoader(param1: Boolean = false) {
        super();
        this.checkPolicyFile = param1;
    }

    override public function canHandleResource(param1: MediaResourceBase): Boolean {
        var _loc2_: int = MediaTypeUtil.checkMetadataMatchWithResource(param1, MEDIA_TYPES_SUPPORTED, MIME_TYPES_SUPPORTED);
        if (_loc2_ != MediaTypeUtil.METADATA_MATCH_UNKNOWN) {
            return _loc2_ == MediaTypeUtil.METADATA_MATCH_FOUND;
        }
        var _loc3_: URLResource = param1 as URLResource;
        if (_loc3_ == null || _loc3_.url == null || _loc3_.url.length <= 0) {
            return false;
        }
        var _loc4_: URL;
        if ((_loc4_ = new URL(_loc3_.url)).protocol == "") {
            return _loc4_.path.search(/\.mp3$/i) != -1;
        }
        if (_loc4_.protocol.search(/file$|http$|https$/i) != -1) {
            return _loc4_.path == null || _loc4_.path.length <= 0 || _loc4_.path.indexOf(".") == -1 || _loc4_.path.search(/\.mp3$/i) != -1;
        }
        return false;
    }

    override protected function executeLoad(param1: LoadTrait): void {
        var urlRequest: URLRequest;
        var context: SoundLoaderContext;
        var soundLoadTrait: SoundLoadTrait = null;
        var sound: Sound = null;
        var onProgress: Function = null;
        var onIOError: Function = null;
        var loadTrait: LoadTrait = param1;
        var toggleSoundListeners: Function = function (param1: Sound, param2: Boolean): void {
            if (param2) {
                param1.addEventListener(ProgressEvent.PROGRESS, onProgress);
                param1.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
            } else {
                param1.removeEventListener(ProgressEvent.PROGRESS, onProgress);
                param1.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
            }
        };
        onProgress = function (param1: ProgressEvent): void {
            if (param1.bytesTotal >= MIN_BYTES_TO_RECEIVE) {
                toggleSoundListeners(sound, false);
                soundLoadTrait.sound = sound;
                updateLoadTrait(soundLoadTrait, LoadState.READY);
            }
        };
        onIOError = function (param1: IOErrorEvent, param2: String = null): void {
            toggleSoundListeners(sound, false);
            updateLoadTrait(loadTrait, LoadState.LOAD_ERROR);
            loadTrait.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR, false, false, new MediaError(MediaErrorCodes.IO_ERROR, !!param1 ? param1.text : param2)));
        };
        var handleSecurityError: Function = function (param1: String): void {
            toggleSoundListeners(sound, false);
            updateLoadTrait(loadTrait, LoadState.LOAD_ERROR);
            loadTrait.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR, false, false, new MediaError(MediaErrorCodes.SECURITY_ERROR, param1)));
        };
        soundLoadTrait = loadTrait as SoundLoadTrait;
        updateLoadTrait(soundLoadTrait, LoadState.LOADING);
        sound = new Sound();
        toggleSoundListeners(sound, true);
        urlRequest = new URLRequest((soundLoadTrait.resource as URLResource).url.toString());
        context = new SoundLoaderContext(1000, this.checkPolicyFile);
        try {
            sound.load(urlRequest, context);
        } catch (ioError: IOError) {
            onIOError(null, ioError.message);
        } catch (securityError: SecurityError) {
            handleSecurityError(securityError.message);
        }
    }

    override protected function executeUnload(param1: LoadTrait): void {
        var loadTrait: LoadTrait = param1;
        var soundLoadTrait: SoundLoadTrait = loadTrait as SoundLoadTrait;
        updateLoadTrait(soundLoadTrait, LoadState.UNLOADING);
        try {
            soundLoadTrait.sound.close();
        } catch (error: IOError) {
        }
        updateLoadTrait(soundLoadTrait, LoadState.UNINITIALIZED);
    }
}
}
