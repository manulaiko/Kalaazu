package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_479 implements ICommand
   {
      
      public static const ID:int = 18603;
       
      
      public var faction:class_439;
      
      public var var_2004:int = 0;
      
      public var var_3339:int = 0;
      
      public function class_479(param1:class_439 = null, param2:int = 0, param3:int = 0)
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
         this.var_2004 = param2;
         this.var_3339 = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 8;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.faction = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.faction.read(param1);
         param1.readShort();
         this.var_2004 = param1.readInt();
         this.var_2004 = Number(this.var_2004) >>> 16 | Number(this.var_2004) << 16;
         this.var_3339 = param1.readInt();
         this.var_3339 = Number(this.var_3339) >>> 16 | Number(this.var_3339) << 16;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.faction.write(param1);
         param1.writeShort(5830);
         param1.writeInt(Number(this.var_2004) << 16 | Number(this.var_2004) >>> 16);
         param1.writeInt(Number(this.var_3339) << 16 | Number(this.var_3339) >>> 16);
      }
   }
}
