package mx.core
{
   import flash.events.EventDispatcher;
   import mx.events.PropertyChangeEvent;
   import mx.events.PropertyChangeEventKind;
   
   public class DesignLayer extends EventDispatcher implements IMXMLObject
   {
       
      
      private var _id:String;
      
      private var _parent:DesignLayer;
      
      private var layerChildren:Array;
      
      private var _visible:Boolean = true;
      
      private var _alpha:Number = 1;
      
      public function DesignLayer()
      {
         this.layerChildren = new Array();
         super();
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get parent() : DesignLayer
      {
         return this._parent;
      }
      
      protected function parentChanged(param1:DesignLayer) : void
      {
         if(Boolean(this._parent) && Boolean(param1))
         {
            this._parent.removeLayer(this);
         }
         this._parent = param1;
         this.effectiveVisibilityChanged(this._visible);
         this.effectiveAlphaChanged(this._alpha);
      }
      
      public function get visible() : Boolean
      {
         return this._visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this._visible != param1)
         {
            this._visible = param1;
            this.effectiveVisibilityChanged(this.effectiveVisibility);
         }
      }
      
      public function get effectiveVisibility() : Boolean
      {
         var _loc1_:Boolean = this._visible;
         var _loc2_:* = {};
         while(_loc1_ && Boolean(_loc2_.parent))
         {
            _loc2_ = _loc2_.parent;
            _loc1_ = _loc2_.visible;
         }
         return _loc1_;
      }
      
      protected function effectiveVisibilityChanged(param1:Boolean) : void
      {
         var _loc3_:* = null;
         dispatchEvent(new PropertyChangeEvent("layerPropertyChange",false,false,PropertyChangeEventKind.UPDATE,"effectiveVisibility",!this.effectiveVisibility,this.effectiveVisibility));
         var _loc2_:int = 0;
         while(_loc2_ < this.layerChildren.length)
         {
            _loc3_ = this.layerChildren[_loc2_];
            if(_loc3_.visible)
            {
               _loc3_.effectiveVisibilityChanged(param1);
            }
            _loc2_++;
         }
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(this._alpha != param1)
         {
            _loc2_ = this._alpha;
            this._alpha = param1;
            this.effectiveAlphaChanged(_loc2_);
         }
      }
      
      public function get effectiveAlpha() : Number
      {
         var _loc1_:Number = this._alpha;
         var _loc2_:* = {};
         while(_loc2_.parent)
         {
            _loc2_ = _loc2_.parent;
            _loc1_ *= _loc2_.alpha;
         }
         return _loc1_;
      }
      
      protected function effectiveAlphaChanged(param1:Number) : void
      {
         var _loc3_:* = null;
         dispatchEvent(new PropertyChangeEvent("layerPropertyChange",false,false,PropertyChangeEventKind.UPDATE,"effectiveAlpha",param1,this.effectiveAlpha));
         var _loc2_:int = 0;
         while(_loc2_ < this.layerChildren.length)
         {
            _loc3_ = this.layerChildren[_loc2_];
            _loc3_.effectiveAlphaChanged(_loc3_.alpha);
            _loc2_++;
         }
      }
      
      public function get numLayers() : int
      {
         return this.layerChildren.length;
      }
      
      public function addLayer(param1:DesignLayer) : void
      {
         param1.parentChanged(this);
         this.layerChildren.push(param1);
      }
      
      public function getLayerAt(param1:int) : DesignLayer
      {
         return param1 < this.layerChildren.length && param1 >= 0 ? this.layerChildren[param1] : null;
      }
      
      public function initialized(param1:Object, param2:String) : void
      {
         this.id = param2;
      }
      
      public function removeLayer(param1:DesignLayer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.layerChildren.length)
         {
            if(this.layerChildren[_loc2_] == param1)
            {
               param1.parentChanged(null);
               this.layerChildren.splice(_loc2_,1);
               return;
            }
            _loc2_++;
         }
      }
   }
}
