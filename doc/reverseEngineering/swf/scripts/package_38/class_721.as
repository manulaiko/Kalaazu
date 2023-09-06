package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_721 implements ICommand
   {
      
      public static const const_2038:uint = 1;
      
      public static const const_1002:uint = 0;
      
      public static const ID:int = 12879;
       
      
      public var var_158:class_647;
      
      public var reason:uint = 0;
      
      public function class_721(param1:class_647 = null, param2:uint = 0)
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
         this.reason = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 0;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_158 = class_127.getInstance().createInstance(param1.readShort()) as class_647;
         this.var_158.read(param1);
         this.reason = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.var_158.write(param1);
         param1.writeShort(this.reason);
      }
   }
}
