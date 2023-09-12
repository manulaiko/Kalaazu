package package_282 {

import flash.geom.Point;
import flash.geom.Rectangle;

import net.bigpoint.darkorbit.mvc.display.class_1718;

import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.Sprite;
import starling.filters.FragmentFilter;
import starling.textures.Texture;

public class class_1722 extends Sprite implements class_1718 {


    private var _content: Image;

    private var _texture: Object;

    public function class_1722() {
        super();
    }

    public function get texture(): Object {
        return this._texture;
    }

    public function set texture(param1: Object): void {
        if (this._content) {
            removeChild(this._content);
            this._content.dispose();
            this._content = null;
        }
        this._texture = param1;
        if (param1) {
            this._content = new Image(TexturesCache.getTexture(this._texture));
            addChild(this._content);
            flatten();
        }
    }

    public function setSubtexture(param1: Object, param2: Rectangle): void {
        this.texture = null;
        this._content = new Image(Texture.fromTexture(TexturesCache.getTexture(param1), param2));
        addChild(this._content);
    }

    public function get method_1052(): Object {
        return parent;
    }

    public function method_990(param1: Point): Point {
        return localToGlobal(param1);
    }

    public function method_4347(param1: Point): Point {
        return globalToLocal(param1);
    }

    public function get method_2826(): Object {
        return root;
    }

    public function get method_5539(): Object {
        return stage;
    }

    public function method_2392(param1: Object, param2: Rectangle = null): Rectangle {
        return getBounds(param1 as DisplayObject);
    }

    public function set method_3211(param1: Object): void {
        this.filter = param1 as FragmentFilter;
    }

    public function get method_3211(): Object {
        return this.filter;
    }
}
}
