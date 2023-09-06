package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_453 implements ICommand
   {
      
      public static const const_1321:uint = 1;
      
      public static const const_1603:uint = 0;
      
      public static const ID:int = 25310;
       
      
      public var var_2700:Number = 0;
      
      public var var_4736:uint = 0;
      
      public var var_158:class_647;
      
      public function class_453(param1:class_647 = null, param2:uint = 0, param3:Number = 0)
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
         this.var_4736 = param2;
         this.var_2700 = param3;
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
         this.var_2700 = param1.readDouble();
         this.var_4736 = param1.readShort();
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
         param1.writeDouble(this.var_2700);
         param1.writeShort(this.var_4736);
         param1.writeShort(-10212);
         this.var_158.write(param1);
      }
   }
}
