package package_485
{
   import package_386.class_2580;
   import package_465.class_2594;
   
   public class OneDCurveSetter extends class_2594
   {
       
      
      protected var var_5043:Vector.<Anchor>;
      
      public function OneDCurveSetter(param1:String, param2:Array)
      {
         var _loc4_:int = 0;
         super(param1);
         var _loc3_:int = param2.length;
         this.var_5043 = new Vector.<Anchor>(_loc3_,true);
         while(_loc4_ < _loc3_)
         {
            this.var_5043[_loc4_] = new Anchor(param2[_loc4_].x,param2[_loc4_].y,param2[_loc4_].type);
            _loc4_++;
         }
      }
      
      override public function method_1777(param1:class_2580) : void
      {
         param1[var_78] = this.generateOneValue(param1.index,param1.total);
      }
      
      override public function generateOneValue(param1:int = 0, param2:int = 1) : *
      {
         var _loc4_:int = 0;
         var _loc3_:Number = param1 / param2;
         for(; _loc4_ < this.var_5043.length - 1; _loc4_++)
         {
            if(this.var_5043[_loc4_ + 1].x <= _loc3_)
            {
               continue;
            }
            switch(this.var_5043[_loc4_].type)
            {
               case Anchor.LINEAR:
                  return this.var_5043[_loc4_].y + (_loc3_ - Number(this.var_5043[_loc4_].x)) / (Number(this.var_5043[_loc4_ + 1].x) - Number(this.var_5043[_loc4_].x)) * (Number(this.var_5043[_loc4_ + 1].y) - Number(this.var_5043[_loc4_].y));
               case Anchor.CONST:
                  return this.var_5043[_loc4_].y;
            }
         }
         return this.var_5043[_loc4_].y;
      }
   }
}

class Anchor
{
   
   public static const LINEAR:int = 0;
   
   public static const CONST:int = 1;
   
   public static const BEZIER:int = 2;
    
   
   public var x:Number;
   
   public var y:Number;
   
   public var type:int;
   
   function Anchor(param1:Number, param2:Number, param3:int)
   {
      super();
      this.x = param1;
      this.y = param2;
      this.type = param3;
   }
}
