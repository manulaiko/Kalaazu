package com.greensock.plugins
{
   import com.greensock.TweenLite;
   
   public class AutoAlphaPlugin extends TweenPlugin
   {
      
      public static const API:Number = 1;
       
      
      protected var _target:Object;
      
      protected var _ignoreVisible:Boolean;
      
      public function AutoAlphaPlugin()
      {
         super();
         this.propName = "autoAlpha";
         this.overwriteProps = ["alpha","visible"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         this._target = param1;
         addTween(param1,"alpha",param1.alpha,param2,"alpha");
         return true;
      }
      
      override public function killProps(param1:Object) : void
      {
         super.killProps(param1);
         this._ignoreVisible = Boolean("visible" in param1);
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         updateTweens(param1);
         if(!this._ignoreVisible)
         {
            this._target.visible = Boolean(this._target.alpha != 0);
         }
      }
   }
}
