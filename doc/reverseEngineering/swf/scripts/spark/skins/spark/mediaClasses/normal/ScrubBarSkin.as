package spark.skins.spark.mediaClasses.normal
{
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.mediaClasses.ScrubBar;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class ScrubBarSkin extends SparkSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["track","thumb"];
       
      
      private var _1443184785dataTip:ClassFactory;
      
      private var _1370702619loadedRangeArea:Group;
      
      private var _2082356736playedArea:Group;
      
      private var _110342614thumb:Button;
      
      private var _110621003track:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:ScrubBar;
      
      public function ScrubBarSkin()
      {
         super();
         mx_internal::_document = this;
         this.minHeight = 14;
         this.minWidth = 60;
         this.mxmlContent = [this._ScrubBarSkin_Button1_i(),this._ScrubBarSkin_Group1_i(),this._ScrubBarSkin_Group3_i(),this._ScrubBarSkin_Button2_i()];
         this.currentState = "normal";
         this._ScrubBarSkin_ClassFactory1_i();
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      private function _ScrubBarSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ScrubBarSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.dataTip = _loc1_;
         BindingManager.executeBindings(this,"dataTip",this.dataTip);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.height = 11;
         _loc1_.setStyle("skinClass",ScrubBarTrackSkin);
         _loc1_.id = "track";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.track = _loc1_;
         BindingManager.executeBindings(this,"track",this.track);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.height = 11;
         _loc1_.includeInLayout = false;
         _loc1_.mxmlContent = [this._ScrubBarSkin_Group2_c()];
         _loc1_.id = "loadedRangeArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadedRangeArea = _loc1_;
         BindingManager.executeBindings(this,"loadedRangeArea",this.loadedRangeArea);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 7;
         _loc1_.right = 6;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.minWidth = 0;
         _loc1_.mxmlContent = [this._ScrubBarSkin_Rect1_c(),this._ScrubBarSkin_Rect2_c(),this._ScrubBarSkin_Rect3_c(),this._ScrubBarSkin_Rect4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._ScrubBarSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14145495;
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.percentWidth = 100;
         _loc1_.maxWidth = 1;
         _loc1_.minWidth = 0;
         _loc1_.fill = this._ScrubBarSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.12;
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.percentHeight = 100;
         _loc1_.maxHeight = 1;
         _loc1_.minHeight = 0;
         _loc1_.fill = this._ScrubBarSkin_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.12;
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.percentWidth = 100;
         _loc1_.maxWidth = 1;
         _loc1_.minWidth = 0;
         _loc1_.fill = this._ScrubBarSkin_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.height = 11;
         _loc1_.includeInLayout = false;
         _loc1_.mxmlContent = [this._ScrubBarSkin_Group4_c()];
         _loc1_.id = "playedArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playedArea = _loc1_;
         BindingManager.executeBindings(this,"playedArea",this.playedArea);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 7;
         _loc1_.right = 6;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.minWidth = 0;
         _loc1_.mxmlContent = [this._ScrubBarSkin_Rect5_c(),this._ScrubBarSkin_Rect6_c(),this._ScrubBarSkin_Rect7_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._ScrubBarSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ScrubBarSkin_GradientEntry1_c(),this._ScrubBarSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _ScrubBarSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16711422;
         return _loc1_;
      }
      
      private function _ScrubBarSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15527148;
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Rect6_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.right = 2;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.fill = this._ScrubBarSkin_LinearGradient2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ScrubBarSkin_GradientEntry3_c(),this._ScrubBarSkin_GradientEntry4_c()];
         return _loc1_;
      }
      
      private function _ScrubBarSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.85;
         return _loc1_;
      }
      
      private function _ScrubBarSkin_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14803425;
         _loc1_.alpha = 0.85;
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Rect7_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.percentWidth = 100;
         _loc1_.maxWidth = 1;
         _loc1_.minWidth = 0;
         _loc1_.fill = this._ScrubBarSkin_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrubBarSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 1250067;
         return _loc1_;
      }
      
      private function _ScrubBarSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 14;
         _loc1_.height = 19;
         _loc1_.includeInLayout = false;
         _loc1_.setStyle("skinClass",ScrubBarThumbSkin);
         _loc1_.id = "thumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get dataTip() : ClassFactory
      {
         return this._1443184785dataTip;
      }
      
      public function set dataTip(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1443184785dataTip;
         if(_loc2_ !== param1)
         {
            this._1443184785dataTip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataTip",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loadedRangeArea() : Group
      {
         return this._1370702619loadedRangeArea;
      }
      
      public function set loadedRangeArea(param1:Group) : void
      {
         var _loc2_:Object = this._1370702619loadedRangeArea;
         if(_loc2_ !== param1)
         {
            this._1370702619loadedRangeArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadedRangeArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playedArea() : Group
      {
         return this._2082356736playedArea;
      }
      
      public function set playedArea(param1:Group) : void
      {
         var _loc2_:Object = this._2082356736playedArea;
         if(_loc2_ !== param1)
         {
            this._2082356736playedArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playedArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumb() : Button
      {
         return this._110342614thumb;
      }
      
      public function set thumb(param1:Button) : void
      {
         var _loc2_:Object = this._110342614thumb;
         if(_loc2_ !== param1)
         {
            this._110342614thumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get track() : Button
      {
         return this._110621003track;
      }
      
      public function set track(param1:Button) : void
      {
         var _loc2_:Object = this._110621003track;
         if(_loc2_ !== param1)
         {
            this._110621003track = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"track",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ScrubBar
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ScrubBar) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
