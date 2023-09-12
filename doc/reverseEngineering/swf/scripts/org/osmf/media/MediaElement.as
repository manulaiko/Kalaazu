package org.osmf.media {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.utils.Dictionary;

import org.osmf.containers.IMediaContainer;
import org.osmf.events.ContainerChangeEvent;
import org.osmf.events.MediaElementEvent;
import org.osmf.events.MediaErrorEvent;
import org.osmf.events.MetadataEvent;
import org.osmf.metadata.Metadata;
import org.osmf.traits.MediaTraitBase;
import org.osmf.utils.OSMFStrings;

public class MediaElement extends EventDispatcher {


    private var traits: Dictionary;

    private var traitResolvers: Dictionary;

    private var unresolvedTraits: Dictionary;

    private var _traitTypes: Vector.<String>;

    private var _resource: MediaResourceBase;

    private var _metadata: Metadata;

    private var _container: IMediaContainer;

    public function MediaElement() {
        this.traits = new Dictionary();
        this.traitResolvers = new Dictionary();
        this.unresolvedTraits = new Dictionary();
        this._traitTypes = new Vector.<String>();
        super();
        this._metadata = this.createMetadata();
        this._metadata.addEventListener(MetadataEvent.VALUE_ADD, this.onMetadataValueAdd);
        this._metadata.addEventListener(MetadataEvent.VALUE_REMOVE, this.onMetadataValueRemove);
        this._metadata.addEventListener(MetadataEvent.VALUE_CHANGE, this.onMetadataValueChange);
        this.setupTraitResolvers();
        this.setupTraits();
        addEventListener(ContainerChangeEvent.CONTAINER_CHANGE, this.onContainerChange, false, Number.MAX_VALUE);
    }

    public function get traitTypes(): Vector.<String> {
        return this._traitTypes.concat();
    }

    public function hasTrait(param1: String): Boolean {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        return this.traits[param1] != null;
    }

    public function getTrait(param1: String): MediaTraitBase {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        return this.traits[param1];
    }

    public function get resource(): MediaResourceBase {
        return this._resource;
    }

    public function set resource(param1: MediaResourceBase): void {
        this._resource = param1;
    }

    public function get container(): IMediaContainer {
        return this._container;
    }

    public function addMetadata(param1: String, param2: Metadata): void {
        if (param1 == null || param2 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        this.metadata.addValue(param1, param2);
    }

    public function removeMetadata(param1: String): Metadata {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        return this.metadata.removeValue(param1) as Metadata;
    }

    public function getMetadata(param1: String): Metadata {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        return this.metadata.getValue(param1) as Metadata;
    }

    public function get metadataNamespaceURLs(): Vector.<String> {
        return this.metadata.keys;
    }

    protected function createMetadata(): Metadata {
        return new Metadata();
    }

    public function get metadata(): Metadata {
        return this._metadata;
    }

    protected function addTrait(param1: String, param2: MediaTraitBase): void {
        if (param1 == null || param2 == null || param1 != param2.traitType) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        var _loc3_: MediaTraitResolver = this.traitResolvers[param1];
        if (_loc3_ != null) {
            _loc3_.addTrait(param2);
        } else {
            this.setLocalTrait(param1, param2);
        }
    }

    protected function removeTrait(param1: String): MediaTraitBase {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        var _loc2_: MediaTraitBase = this.traits[param1];
        var _loc3_: MediaTraitResolver = this.traitResolvers[param1];
        if (_loc3_ != null) {
            return _loc3_.removeTrait(_loc2_);
        }
        return this.setLocalTrait(param1, null);
    }

    protected final function addTraitResolver(param1: String, param2: MediaTraitResolver): void {
        var _loc3_: * = null;
        if (param2 == null || param2.type != param1) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        if (this.traitResolvers[param1] == null) {
            this.unresolvedTraits[param1] = this.traits[param1];
            this.traitResolvers[param1] = param2;
            _loc3_ = this.traits[param1];
            if (_loc3_) {
                param2.addTrait(_loc3_);
            }
            this.processResolvedTraitChange(param1, param2.resolvedTrait);
            param2.addEventListener(Event.CHANGE, this.onTraitResolverChange);
            return;
        }
        throw new ArgumentError(OSMFStrings.getString(OSMFStrings.TRAIT_RESOLVER_ALREADY_ADDED));
    }

    protected final function removeTraitResolver(param1: String): MediaTraitResolver {
        if (param1 == null || this.traitResolvers[param1] == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        var _loc2_: MediaTraitResolver = this.traitResolvers[param1];
        _loc2_.removeEventListener(Event.CHANGE, this.onTraitResolverChange);
        delete this.traitResolvers[param1];
        var _loc3_: MediaTraitBase = this.unresolvedTraits[param1];
        if (_loc3_ != this.traits[param1]) {
            this.setLocalTrait(param1, _loc3_);
        }
        delete this.unresolvedTraits[param1];
        return _loc2_;
    }

    protected final function getTraitResolver(param1: String): MediaTraitResolver {
        return this.traitResolvers[param1];
    }

    protected function setupTraitResolvers(): void {
    }

    protected function setupTraits(): void {
    }

    private function onMediaError(param1: MediaErrorEvent): void {
        dispatchEvent(param1.clone());
    }

    private function setLocalTrait(param1: String, param2: MediaTraitBase): MediaTraitBase {
        var _loc3_: MediaTraitBase = this.traits[param1];
        if (param2 == null) {
            if (_loc3_ != null) {
                _loc3_.removeEventListener(MediaErrorEvent.MEDIA_ERROR, this.onMediaError);
                _loc3_.dispose();
                dispatchEvent(new MediaElementEvent(MediaElementEvent.TRAIT_REMOVE, false, false, param1));
                this._traitTypes.splice(this._traitTypes.indexOf(param1), 1);
                delete this.traits[param1];
            }
        } else if (_loc3_ == null) {
            this.traits[param1] = _loc3_ = param2;
            this._traitTypes.push(param1);
            _loc3_.addEventListener(MediaErrorEvent.MEDIA_ERROR, this.onMediaError);
            dispatchEvent(new MediaElementEvent(MediaElementEvent.TRAIT_ADD, false, false, param1));
        } else if (_loc3_ != param2) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.TRAIT_INSTANCE_ALREADY_ADDED));
        }
        return _loc3_;
    }

    private function onTraitResolverChange(param1: Event): void {
        var _loc2_: MediaTraitResolver = param1.target as MediaTraitResolver;
        this.processResolvedTraitChange(_loc2_.type, _loc2_.resolvedTrait);
    }

    private function processResolvedTraitChange(param1: String, param2: MediaTraitBase): void {
        if (param2 != this.traits[param1]) {
            this.setLocalTrait(param1, param2);
        }
    }

    private function onContainerChange(param1: ContainerChangeEvent): void {
        if (this._container == param1.oldContainer && this._container != param1.newContainer) {
            this._container = param1.newContainer;
        }
    }

    private function onMetadataValueAdd(param1: MetadataEvent): void {
        dispatchEvent(new MediaElementEvent(MediaElementEvent.METADATA_ADD, false, false, null, param1.key, param1.value as Metadata));
    }

    private function onMetadataValueChange(param1: MetadataEvent): void {
        dispatchEvent(new MediaElementEvent(MediaElementEvent.METADATA_REMOVE, false, false, null, param1.key, param1.oldValue as Metadata));
        dispatchEvent(new MediaElementEvent(MediaElementEvent.METADATA_ADD, false, false, null, param1.key, param1.value as Metadata));
    }

    private function onMetadataValueRemove(param1: MetadataEvent): void {
        dispatchEvent(new MediaElementEvent(MediaElementEvent.METADATA_REMOVE, false, false, null, param1.key, param1.value as Metadata));
    }
}
}
