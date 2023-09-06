package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_932 implements ICommand
   {
      
      public static const ID:int = 1885;
       
      
      public var faction:class_439;
      
      public var var_4240:Number = 0;
      
      public var var_4258:class_429;
      
      public function class_932(param1:class_439 = null, param2:class_429 = null, param3:Number = 0)
      {
         super();
         if(param1 == null)
         {
            this.faction = new class_439();
         }
         else
         {
            this.faction = param1;
         }
         if(param2 == null)
         {
            this.var_4258 = new class_429();
         }
         else
         {
            this.var_4258 = param2;
         }
         this.var_4240 = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.faction = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.faction.read(param1);
         this.var_4240 = param1.readFloat();
         this.var_4258 = class_127.getInstance().createInstance(param1.readShort()) as class_429;
         this.var_4258.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.faction.write(param1);
         param1.writeFloat(this.var_4240);
         this.var_4258.write(param1);
      }
   }
}
