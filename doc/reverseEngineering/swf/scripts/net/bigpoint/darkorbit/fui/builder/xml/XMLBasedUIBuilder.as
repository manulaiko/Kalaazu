package net.bigpoint.darkorbit.fui.builder.xml {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.builder.IUIBuilder;
import net.bigpoint.darkorbit.fui.builder.IUIBuilderType;
import net.bigpoint.darkorbit.fui.builder.MappingInstanceNames;
import net.bigpoint.darkorbit.fui.builder.repository.IUITemplateRepository;
import net.bigpoint.darkorbit.fui.builder.repository.XMLUITemplateRepository;
import net.bigpoint.darkorbit.fui.builder.xml.mapping.XMLMappingVO;
import net.bigpoint.darkorbit.fui.builder.xml.utils.XMLUIHelper;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;

public class XMLBasedUIBuilder implements IUIBuilder, IUIBuilderType {

    public static const TYPE: String = "xml";


    private var _uiDescription: XML;

    private var _nodeMapper: XMLNodeNameToInstanceInternalMap;

    private var _buildFinishedCallback: Function;

    private var _useThreadToBuild: Boolean = true;

    private var _elementsCount: uint;

    private var _traverser: Traverser;

    private var _builder: Builder;

    private var _traverserThread: Thread;

    private var _buildThread: Thread;

    public function XMLBasedUIBuilder() {
        super();
        this._nodeMapper = new XMLNodeNameToInstanceInternalMap();
    }

    public function get type(): String {
        return XMLBasedUIBuilder.TYPE;
    }

    public function getTemplateRepository(param1: String = null): IUITemplateRepository {
        return XMLUITemplateRepository.getInstance();
    }

    public function register(param1: String, param2: Function, param3: Boolean = false, param4: Boolean = true): void {
        this._nodeMapper.register(param1, param2, param3, param4);
    }

    public function registerFromDictionary(param1: Dictionary): void {
        this._nodeMapper.registerFromDictionary(param1);
    }

    protected function execCallback(): void {
        if (this._buildFinishedCallback != null) {
            this._buildFinishedCallback();
        }
    }

    public function build(param1: Object, param2: DisplayObjectContainer = null, param3: Boolean = false, param4: Boolean = false, param5: Function = null): void {
        var _loc6_: * = null;
        this._uiDescription = param1 as XML;
        this._buildFinishedCallback = param5;
        this._useThreadToBuild = param4;
        if (param3) {
            (_loc6_ = this._nodeMapper.getMappingVO(MappingInstanceNames.ROOT)).creationMethod(this._uiDescription, param2);
        }
        if (!this._useThreadToBuild) {
            this._buildRecursive(this._uiDescription, param2);
            this.execCallback();
        } else {
            this._buildViaThreads(this._uiDescription, param2);
        }
    }

    protected function _buildRecursive(param1: XML, param2: DisplayObjectContainer): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc3_: XMLList = param1.children();
        for each(_loc4_ in _loc3_) {
            _loc4_ = XMLUIHelper.__template__(_loc4_);
            _loc5_ = String(_loc4_.name()).toLowerCase();
            if (_loc6_ = this._nodeMapper.getMappingVO(_loc5_)) {
                if (_loc6_.creationMethod != null) {
                    if ((Boolean(_loc7_ = _loc6_.creationMethod(_loc4_) as DisplayObject)) && _loc6_.addToDisplayList) {
                        param2.addChild(_loc7_);
                    }
                }
                if (_loc6_.hasChildren) {
                    this._buildRecursive(_loc4_, _loc7_ as DisplayObjectContainer);
                    this.assignChildren(_loc7_ as DisplayObjectContainer);
                }
            } else {
                this.logMappingError(_loc5_);
            }
        }
    }

    protected function _buildViaThreads(param1: XML, param2: DisplayObjectContainer): void {
        this._uiDescription = param1;
        this._elementsCount = param1.descendants().length();
        this._traverser = new Traverser(param1);
        this._builder = new Builder(this._nodeMapper, param2);
        this._traverserThread = new Thread(this._traverseThread_);
        this._traverserThread.addEventListener(Event.COMPLETE, this.finishedTraversing);
        this._traverserThread.start(0.25);
    }

    protected function finishedTraversing(param1: Event = null): void {
        UISystem.log(" ---> finishedTraversing() ");
        UISystem.log(this._traverserThread.statistcs.print());
        this._traverserThread.removeEventListener(Event.COMPLETE, this.finishedTraversing);
        this._builder.processList = this._traverser.getXMLasFlatList();
        this._buildThread = new Thread(this._buildThread_);
        this._buildThread.addEventListener(Event.COMPLETE, this.finishedBuildProcess);
        this._buildThread.start(0.25);
    }

    protected function finishedBuildProcess(param1: Event = null): void {
        UISystem.log(" ---> finishedBuilding() ");
        UISystem.log(this._buildThread.statistcs.print());
        this._buildThread.removeEventListener(Event.COMPLETE, this.finishedBuildProcess);
        this.execCallback();
    }

    protected function _traverseThread_(): Boolean {
        var _loc1_: * = null;
        if (0 < this._elementsCount) {
            _loc1_ = this._traverser.traverse();
            if (_loc1_) {
                return true;
            }
            return false;
        }
        return false;
    }

    protected function _buildThread_(): Boolean {
        if (0 < this._elementsCount) {
            return this._builder.build();
        }
        return false;
    }

    protected function assignChildren(param1: DisplayObjectContainer): void {
        var _loc2_: ICoreponent = param1 as ICoreponent;
        if (_loc2_ != null) {
            _loc2_.assignChildren();
        }
    }

    protected function logMappingError(param1: String): void {
        UISystem.log("Mapping ERROR! An creator for a node with the name ->" + param1 + "<- doesn´t exist.", UISystem.LOG_LEVEL_WARN);
    }
}
}

import net.bigpoint.darkorbit.fui.system.utils.threads.GreenThread;

class Thread extends GreenThread {


    private var _task_: Function;

    function Thread(param1: Function) {
        super();
        this._task_ = param1;
    }

    override protected function run(): Boolean {
        return this._task_();
    }
}

class Traverser {


    private var _node: XML;

    private var _stack: Stack;

    function Traverser(param1: XML) {
        super();
        this._node = param1;
        this._stack = new Stack();
    }

    public function hasChildren(): Boolean {
        return this._node.length() > 0 && !this._node.hasSimpleContent();
    }

    public function traverse(): XML {
        if (this._node) {
            if (this.hasChildren()) {
                this._stack.push(new StackEntry(this._node));
            }
            this._node = this._stack.getLastElementAndIncreasePointer();
        }
        return this._node;
    }

    public function getXMLasFlatList(): Vector.<XML> {
        return this._stack.getXMLasLinearList();
    }

    public function dispose(): void {
        this._stack.dispose();
    }
}

class Stack {


    private var stackEntries: Vector.<StackEntry>;

    private var linearList: Vector.<XML>;

    function Stack() {
        super();
        this.stackEntries = new Vector.<StackEntry>();
        this.linearList = new Vector.<XML>();
    }

    public function push(param1: StackEntry): void {
        this.stackEntries.push(param1);
    }

    public function pop(): StackEntry {
        return this.stackEntries.pop();
    }

    protected function getLastElement(): StackEntry {
        var _loc1_: int = this.stackEntries.length - 1;
        if (_loc1_ >= 0) {
            return this.stackEntries[_loc1_];
        }
        return null;
    }

    public function getLastElementAndIncreasePointer(): XML {
        var _loc2_: * = null;
        var _loc1_: StackEntry = this.getLastElement();
        if (_loc1_) {
            if (!_loc1_.reachedXMLListLimit()) {
                _loc2_ = _loc1_.getNextXMLNodeElementAndIncresePointer();
            } else {
                this.pop();
                _loc2_ = this.getLastElementAndIncreasePointer();
            }
        }
        this.linearList.push(_loc2_);
        return _loc2_;
    }

    public function getXMLasLinearList(): Vector.<XML> {
        return this.linearList;
    }

    public function dispose(): void {
        this.stackEntries.length = 1;
        this.linearList.length = 1;
    }
}

class StackEntry {


    private var _pointer: uint = 0;

    private var _name: String = "NOT.SET";

    private var _node: XML;

    private var _nodeChildren: XMLList;

    function StackEntry(param1: XML) {
        super();
        this._pointer = 0;
        this._node = param1;
        this._nodeChildren = this._node.children();
        this._name = param1.name();
    }

    public function dispose(): void {
        this._node = null;
        this._nodeChildren = null;
    }

    public function reachedXMLListLimit(): Boolean {
        var _loc1_: uint = uint(this._nodeChildren.length());
        return this._pointer < _loc1_ ? false : true;
    }

    public function getNextXMLNodeElementAndIncresePointer(): XML {
        var _loc1_: XML = this._nodeChildren[this._pointer];
        ++this._pointer;
        return _loc1_;
    }
}

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;

import net.bigpoint.darkorbit.fui.builder.xml.mapping.XMLMappingVO;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;

class Builder {


    private var _elements: Vector.<XML>;

    private var _nodeMapper: XMLNodeNameToInstanceInternalMap;

    private var _rootContainer: DisplayObjectContainer;

    function Builder(param1: XMLNodeNameToInstanceInternalMap, param2: DisplayObjectContainer) {
        super();
        this._nodeMapper = param1;
        this._rootContainer = param2;
    }

    public function build(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this._elements.length > 0) {
            _loc1_ = this._elements.shift();
            if (_loc1_ == null) {
                _loc2_ = [];
            } else {
                this.createElement(_loc1_);
            }
            return true;
        }
        return false;
    }

    protected function createElement(param1: XML): DisplayObject {
        var _loc4_: * = null;
        var _loc2_: String = String(param1.name()).toLowerCase();
        var _loc3_: XMLMappingVO = this._nodeMapper.getMappingVO(_loc2_);
        if (_loc3_) {
            if (_loc3_.creationMethod != null) {
                if ((Boolean(_loc4_ = _loc3_.creationMethod(param1) as DisplayObject)) && _loc3_.addToDisplayList) {
                    if (this._rootContainer) {
                        this._rootContainer.addChild(_loc4_);
                    }
                }
            }
        }
        return _loc4_;
    }

    protected function assignChildren(param1: DisplayObjectContainer): void {
        var _loc2_: ICoreponent = param1 as ICoreponent;
        if (_loc2_ != null) {
            _loc2_.assignChildren();
        }
    }

    public function set processList(param1: Vector.<XML>): void {
        this._elements = param1;
    }

    public function dispose(): void {
    }
}

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.builder.xml.mapping.XMLMappingVO;

dynamic class XMLNodeNameToInstanceInternalMap extends Dictionary {


    function XMLNodeNameToInstanceInternalMap() {
        super(false);
    }

    public function register(param1: String, param2: Function, param3: Boolean = false, param4: Boolean = true): void {
        if (this[param1] == null) {
            this[param1] = new XMLMappingVO(param2, param3, param4);
        }
    }

    public function registerFromDictionary(param1: Dictionary): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        for (_loc2_ in param1) {
            _loc3_ = param1[_loc2_];
            this[_loc2_] = _loc3_.clone();
        }
    }

    public function getMappingVO(param1: String): XMLMappingVO {
        return this[param1];
    }
}
