package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_678 implements ICommand
   {
      
      public static const ID:int = 11127;
       
      
      public var var_4363:class_439;
      
      public var var_2682:int = 0;
      
      public var var_840:int = 0;
      
      public var var_956:class_439;
      
      public var var_1843:int = 0;
      
      public var var_3681:int = 0;
      
      public function class_678(param1:class_439 = null, param2:class_439 = null, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_4363 = new class_439();
         }
         else
         {
            this.var_4363 = param1;
         }
         if(param2 == null)
         {
            this.var_956 = new class_439();
         }
         else
         {
            this.var_956 = param2;
         }
         this.var_2682 = param3;
         this.var_1843 = param4;
         this.var_840 = param5;
         this.var_3681 = param6;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 16;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_4363 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.var_4363.read(param1);
         this.var_2682 = param1.readInt();
         this.var_2682 = Number(this.var_2682) << 12 | Number(this.var_2682) >>> 20;
         this.var_840 = param1.readInt();
         this.var_840 = Number(this.var_840) << 5 | Number(this.var_840) >>> 27;
         this.var_956 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.var_956.read(param1);
         this.var_1843 = param1.readInt();
         this.var_1843 = Number(this.var_1843) << 15 | Number(this.var_1843) >>> 17;
         this.var_3681 = param1.readInt();
         this.var_3681 = Number(this.var_3681) << 14 | Number(this.var_3681) >>> 18;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.var_4363.write(param1);
         param1.writeInt(Number(this.var_2682) >>> 12 | Number(this.var_2682) << 20);
         param1.writeInt(Number(this.var_840) >>> 5 | Number(this.var_840) << 27);
         this.var_956.write(param1);
         param1.writeInt(Number(this.var_1843) >>> 15 | Number(this.var_1843) << 17);
         param1.writeInt(Number(this.var_3681) >>> 14 | Number(this.var_3681) << 18);
      }
   }
}
