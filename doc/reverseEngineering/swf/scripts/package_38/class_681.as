package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_681 implements ICommand
   {
      
      public static const ACTIVE:uint = 2;
      
      public static const READY:uint = 1;
      
      public static const INACTIVE:uint = 4;
      
      public static const const_1787:uint = 0;
      
      public static const const_2553:uint = 3;
      
      public static const ID:int = 24735;
       
      
      public function class_681()
      {
         super();
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
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
      }
   }
}
