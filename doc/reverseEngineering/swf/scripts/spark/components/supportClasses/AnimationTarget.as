package spark.components.supportClasses
{
   import spark.effects.animation.Animation;
   import spark.effects.animation.IAnimationTarget;
   
   class AnimationTarget implements IAnimationTarget
   {
       
      
      public var updateFunction:Function;
      
      public var startFunction:Function;
      
      public var stopFunction:Function;
      
      public var endFunction:Function;
      
      public var repeatFunction:Function;
      
      function AnimationTarget(param1:Function = null)
      {
         super();
         this.updateFunction = param1;
      }
      
      public function animationStart(param1:Animation) : void
      {
         if(this.startFunction != null)
         {
            this.startFunction(param1);
         }
      }
      
      public function animationEnd(param1:Animation) : void
      {
         if(this.endFunction != null)
         {
            this.endFunction(param1);
         }
      }
      
      public function animationStop(param1:Animation) : void
      {
         if(this.stopFunction != null)
         {
            this.stopFunction(param1);
         }
      }
      
      public function animationRepeat(param1:Animation) : void
      {
         if(this.repeatFunction != null)
         {
            this.repeatFunction(param1);
         }
      }
      
      public function animationUpdate(param1:Animation) : void
      {
         if(this.updateFunction != null)
         {
            this.updateFunction(param1);
         }
      }
   }
}
