package net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo
{
   import com.bigpoint.utils.class_73;
   import flash.geom.Point;
   import package_38.class_358;
   
   public class FeatureWindowVO
   {
       
      
      private var _id:String;
      
      private var _titleTextKey:String;
      
      private var _position:class_73;
      
      private var _size:class_73;
      
      private var _definition:FeatureWindowDefinitionVO;
      
      private var _helpText:class_358;
      
      private var _toolTip:class_358;
      
      private var _maximized:Boolean;
      
      private var _toggleMaximize:Boolean = false;
      
      private var _maximizedChanged:Boolean = false;
      
      private var _saveSettingsOnServer:Boolean = false;
      
      private var _minimizedPosition:Point;
      
      private var _showOnTop:Boolean;
      
      public function FeatureWindowVO(param1:String, param2:String, param3:class_73, param4:class_73, param5:Boolean, param6:FeatureWindowDefinitionVO, param7:class_358 = null, param8:class_358 = null, param9:Boolean = false)
      {
         super();
         this._id = param1;
         this._titleTextKey = param2;
         this._position = param3;
         this._size = param4;
         this._definition = param6;
         this._helpText = param7;
         this._toolTip = param8;
         this._maximized = param5;
         this._showOnTop = param9;
      }
      
      public function toString() : String
      {
         return this._id;
      }
      
      public function update(param1:class_73, param2:class_73, param3:Boolean, param4:String = null, param5:class_358 = null, param6:class_358 = null) : void
      {
         this._position = param1;
         this._size = param2;
         this._maximizedChanged = this._maximized != param3;
         this._maximized = param3;
         if(param4)
         {
            this._titleTextKey = param4;
         }
         if(param5)
         {
            this._helpText = param5;
         }
         if(param6)
         {
            this._toolTip = param6;
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get titleTextKey() : String
      {
         return this._titleTextKey;
      }
      
      public function get helpText() : class_358
      {
         return this._helpText;
      }
      
      public function get toolTip() : class_358
      {
         return this._toolTip;
      }
      
      public function get maximized() : Boolean
      {
         return this._maximized;
      }
      
      public function set maximized(param1:Boolean) : void
      {
         this._maximizedChanged = this._maximized != param1;
         this._maximized = param1;
      }
      
      public function get definition() : FeatureWindowDefinitionVO
      {
         return this._definition;
      }
      
      public function get saveSettingsOnServer() : Boolean
      {
         return this._saveSettingsOnServer;
      }
      
      public function set saveSettingsOnServer(param1:Boolean) : void
      {
         this._saveSettingsOnServer = param1;
      }
      
      public function get position() : class_73
      {
         return this._position;
      }
      
      public function get size() : class_73
      {
         return this._size;
      }
      
      public function set size(param1:class_73) : void
      {
         this._size = param1;
      }
      
      public function get minimizedPosition() : Point
      {
         return this._minimizedPosition;
      }
      
      public function set minimizedPosition(param1:Point) : void
      {
         this._minimizedPosition = param1;
      }
      
      public function get toggleMaximize() : Boolean
      {
         return this._toggleMaximize;
      }
      
      public function set toggleMaximize(param1:Boolean) : void
      {
         this._toggleMaximize = param1;
      }
      
      public function get maximixedChanged() : Boolean
      {
         return this._maximizedChanged;
      }
      
      public function get showOnTop() : Boolean
      {
         return this._showOnTop;
      }
      
      public function set showOnTop(param1:Boolean) : void
      {
         this._showOnTop = param1;
      }
   }
}
