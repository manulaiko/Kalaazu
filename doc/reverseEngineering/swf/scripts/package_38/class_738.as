package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_738 implements ICommand
   {
      
      public static const ID:int = 18383;
       
      
      public var var_2772:int = 0;
      
      public var var_2934:Boolean = false;
      
      public function class_738(param1:Boolean = false, param2:int = 0)
      {
         super();
         this.var_2934 = param1;
         this.var_2772 = param2;
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
         this.var_2772 = param1.readInt();
         this.var_2772 = Number(this.var_2772) >>> 5 | Number(this.var_2772) << 27;
         this.var_2934 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_2772) << 5 | Number(this.var_2772) >>> 27);
         param1.writeBoolean(this.var_2934);
      }
   }
}
