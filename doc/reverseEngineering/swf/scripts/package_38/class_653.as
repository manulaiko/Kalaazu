package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_653 implements ICommand
   {
      
      public static const const_2326:uint = 3;
      
      public static const const_546:uint = 1;
      
      public static const const_1137:uint = 2;
      
      public static const const_837:uint = 5;
      
      public static const const_410:uint = 0;
      
      public static const const_731:uint = 4;
      
      public static const ID:int = 11152;
       
      
      public var var_3463:uint = 0;
      
      public var var_3462:int = 0;
      
      public var var_1479:class_481;
      
      public var var_2049:Boolean = false;
      
      public function class_653(param1:uint = 0, param2:class_481 = null, param3:int = 0, param4:Boolean = false)
      {
         super();
         this.var_3463 = param1;
         if(param2 == null)
         {
            this.var_1479 = new class_481();
         }
         else
         {
            this.var_1479 = param2;
         }
         this.var_3462 = param3;
         this.var_2049 = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 5;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_3463 = param1.readShort();
         param1.readShort();
         this.var_3462 = param1.readInt();
         this.var_3462 = Number(this.var_3462) >>> 7 | Number(this.var_3462) << 25;
         this.var_1479 = class_127.getInstance().createInstance(param1.readShort()) as class_481;
         this.var_1479.read(param1);
         this.var_2049 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_3463);
         param1.writeShort(-1114);
         param1.writeInt(Number(this.var_3462) << 7 | Number(this.var_3462) >>> 25);
         this.var_1479.write(param1);
         param1.writeBoolean(this.var_2049);
      }
   }
}
