package mx.styles
{
   import mx.core.mx_internal;
   
   public class StyleProxy implements IAdvancedStyleClient
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var _filterMap:Object;
      
      private var _source:IStyleClient;
      
      private var _advancedSource:IAdvancedStyleClient;
      
      public function StyleProxy(param1:IStyleClient, param2:Object)
      {
         super();
         this.filterMap = param2;
         this.source = param1;
      }
      
      public function get filterMap() : Object
      {
         return this._filterMap;
      }
      
      public function set filterMap(param1:Object) : void
      {
         this._filterMap = param1;
      }
      
      public function get source() : IStyleClient
      {
         return this._source;
      }
      
      public function set source(param1:IStyleClient) : void
      {
         this._source = param1;
         this._advancedSource = param1 as IAdvancedStyleClient;
      }
      
      public function get className() : String
      {
         return this._source.className;
      }
      
      public function get inheritingStyles() : Object
      {
         return this._source.inheritingStyles;
      }
      
      public function set inheritingStyles(param1:Object) : void
      {
      }
      
      public function get nonInheritingStyles() : Object
      {
         return null;
      }
      
      public function set nonInheritingStyles(param1:Object) : void
      {
      }
      
      public function get styleDeclaration() : CSSStyleDeclaration
      {
         return this._source.styleDeclaration;
      }
      
      public function set styleDeclaration(param1:CSSStyleDeclaration) : void
      {
         this._source.styleDeclaration = this.styleDeclaration;
      }
      
      public function get styleName() : Object
      {
         if(this._source.styleName is IStyleClient)
         {
            return new StyleProxy(IStyleClient(this._source.styleName),this.filterMap);
         }
         return this._source.styleName;
      }
      
      public function set styleName(param1:Object) : void
      {
         this._source.styleName = param1;
      }
      
      public function get id() : String
      {
         return !!this._advancedSource ? this._advancedSource.id : null;
      }
      
      public function get styleParent() : IAdvancedStyleClient
      {
         return !!this._advancedSource ? this._advancedSource.styleParent : null;
      }
      
      public function set styleParent(param1:IAdvancedStyleClient) : void
      {
      }
      
      public function styleChanged(param1:String) : void
      {
         return this._source.styleChanged(param1);
      }
      
      public function getStyle(param1:String) : *
      {
         return this._source.getStyle(param1);
      }
      
      public function setStyle(param1:String, param2:*) : void
      {
         this._source.setStyle(param1,param2);
      }
      
      public function clearStyle(param1:String) : void
      {
         this._source.clearStyle(param1);
      }
      
      public function getClassStyleDeclarations() : Array
      {
         return this._source.getClassStyleDeclarations();
      }
      
      public function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
         return this._source.notifyStyleChangeInChildren(param1,param2);
      }
      
      public function regenerateStyleCache(param1:Boolean) : void
      {
         this._source.regenerateStyleCache(param1);
      }
      
      public function registerEffects(param1:Array) : void
      {
         return this._source.registerEffects(param1);
      }
      
      public function stylesInitialized() : void
      {
         if(this._advancedSource)
         {
            this._advancedSource.stylesInitialized();
         }
      }
      
      public function matchesCSSState(param1:String) : Boolean
      {
         return !!this._advancedSource ? this._advancedSource.matchesCSSState(param1) : false;
      }
      
      public function matchesCSSType(param1:String) : Boolean
      {
         return !!this._advancedSource ? this._advancedSource.matchesCSSType(param1) : false;
      }
      
      public function hasCSSState() : Boolean
      {
         return !!this._advancedSource ? this._advancedSource.hasCSSState() : false;
      }
   }
}
