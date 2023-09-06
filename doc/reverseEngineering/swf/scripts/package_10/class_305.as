package package_10
{
   import com.bigpoint.utils.class_73;
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_305 extends class_73
   {
      
      public static const ZERO:class_305 = new class_305(0,0,0);
       
      
      public const changed:class_68 = new class_70();
      
      public function class_305(param1:Number = 0, param2:Number = 0, param3:Number = 0)
      {
         super(param1,param2,param3);
      }
      
      override public function setTo(param1:Number, param2:Number, param3:Number) : void
      {
         if(_x != param1 || _y != param2 || _z != param3)
         {
            _x = param1;
            _y = param2;
            _z = param3;
            this.changed.dispatch();
         }
      }
      
      override public function set x(param1:Number) : void
      {
         if(_x != param1)
         {
            _x = param1;
            this.changed.dispatch();
         }
      }
      
      override public function set y(param1:Number) : void
      {
         if(_y != param1)
         {
            _y = param1;
            this.changed.dispatch();
         }
      }
      
      override public function clone() : class_73
      {
         return new class_305(_x,_y,_z);
      }
   }
}
