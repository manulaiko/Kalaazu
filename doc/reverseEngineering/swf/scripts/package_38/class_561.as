package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_561 implements ICommand
   {
      
      public static const ID:int = 632;
       
      
      public var toolTip:class_358;
      
      public var var_1807:int = 0;
      
      public var var_2772:int = 0;
      
      public function class_561(param1:int = 0, param2:int = 0, param3:class_358 = null)
      {
         super();
         this.var_1807 = param1;
         this.var_2772 = param2;
         if(param3 == null)
         {
            this.toolTip = new class_358();
         }
         else
         {
            this.toolTip = param3;
         }
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
         this.toolTip = class_127.getInstance().createInstance(param1.readShort()) as class_358;
         this.toolTip.read(param1);
         this.var_1807 = param1.readInt();
         this.var_1807 = Number(this.var_1807) << 16 | Number(this.var_1807) >>> 16;
         this.var_2772 = param1.readInt();
         this.var_2772 = Number(this.var_2772) >>> 14 | Number(this.var_2772) << 18;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.toolTip.write(param1);
         param1.writeInt(Number(this.var_1807) >>> 16 | Number(this.var_1807) << 16);
         param1.writeInt(Number(this.var_2772) << 14 | Number(this.var_2772) >>> 18);
         param1.writeShort(-19552);
      }
   }
}
