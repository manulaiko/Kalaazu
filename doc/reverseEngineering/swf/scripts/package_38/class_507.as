package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_507 implements ICommand
   {
      
      public static const const_1978:uint = 2;
      
      public static const const_218:uint = 1;
      
      public static const const_1909:uint = 0;
      
      public static const ID:int = 27527;
       
      
      public var var_2160:uint = 0;
      
      public var active:Boolean = false;
      
      public function class_507(param1:uint = 0, param2:Boolean = false)
      {
         super();
         this.var_2160 = param1;
         this.active = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 1;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_2160 = param1.readShort();
         this.active = param1.readBoolean();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_2160);
         param1.writeBoolean(this.active);
         param1.writeShort(20623);
      }
   }
}
