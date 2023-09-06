package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_711 implements ICommand
   {
      
      public static const ID:int = 20306;
       
      
      public var var_2957:int = 0;
      
      public var var_158:class_647;
      
      public var var_2965:int = 0;
      
      public var var_3124:int = 0;
      
      public function class_711(param1:class_647 = null, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_158 = new class_647();
         }
         else
         {
            this.var_158 = param1;
         }
         this.var_2965 = param2;
         this.var_2957 = param3;
         this.var_3124 = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 12;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_2957 = param1.readInt();
         this.var_2957 = Number(this.var_2957) >>> 3 | Number(this.var_2957) << 29;
         param1.readShort();
         this.var_158 = class_127.getInstance().createInstance(param1.readShort()) as class_647;
         this.var_158.read(param1);
         this.var_2965 = param1.readInt();
         this.var_2965 = Number(this.var_2965) << 16 | Number(this.var_2965) >>> 16;
         this.var_3124 = param1.readInt();
         this.var_3124 = Number(this.var_3124) >>> 2 | Number(this.var_3124) << 30;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_2957) << 3 | Number(this.var_2957) >>> 29);
         param1.writeShort(-2149);
         this.var_158.write(param1);
         param1.writeInt(Number(this.var_2965) >>> 16 | Number(this.var_2965) << 16);
         param1.writeInt(Number(this.var_3124) << 2 | Number(this.var_3124) >>> 30);
      }
   }
}
