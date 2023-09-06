package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_807 implements ICommand
   {
      
      public static const ID:int = 11952;
       
      
      public var var_2957:int = 0;
      
      public var var_2965:int = 0;
      
      public var var_158:class_647;
      
      public function class_807(param1:class_647 = null, param2:int = 0, param3:int = 0)
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
         this.var_2957 = param1.readInt();
         this.var_2957 = Number(this.var_2957) >>> 8 | Number(this.var_2957) << 24;
         this.var_2965 = param1.readInt();
         this.var_2965 = Number(this.var_2965) << 5 | Number(this.var_2965) >>> 27;
         param1.readShort();
         this.var_158 = class_127.getInstance().createInstance(param1.readShort()) as class_647;
         this.var_158.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_2957) << 8 | Number(this.var_2957) >>> 24);
         param1.writeInt(Number(this.var_2965) >>> 5 | Number(this.var_2965) << 27);
         param1.writeShort(-21753);
         this.var_158.write(param1);
      }
   }
}
