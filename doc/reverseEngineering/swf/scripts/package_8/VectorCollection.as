package package_8
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.IExternalizable;
   import mx.collections.ListCollectionView;
   
   [Bindable("listChanged")]
   public class VectorCollection extends ListCollectionView implements IExternalizable
   {
       
      
      public function VectorCollection(param1:Object = null)
      {
         super();
         if(param1)
         {
            this.source = param1;
         }
         else
         {
            this.source = new Vector.<Object>();
         }
      }
      
      public function get source() : Object
      {
         if(Boolean(this.list) && this.list is VectorList)
         {
            return VectorList(this.list).source;
         }
         return null;
      }
      
      public function set source(param1:Object) : void
      {
         if(!VectorList.method_1449(param1))
         {
            throw new ArgumentError("Argument is not a Vector");
         }
         this.list = new VectorList(param1 as Vector.<*>);
      }
      
      public function method_387(param1:Object) : int
      {
         return VectorList(this.list).removeItem(param1);
      }
      
      public function readExternal(param1:IDataInput) : void
      {
         if(this.list is IExternalizable)
         {
            IExternalizable(this.list).readExternal(param1);
         }
         else
         {
            this.source = param1.readObject();
         }
      }
      
      public function writeExternal(param1:IDataOutput) : void
      {
         if(this.list is IExternalizable)
         {
            IExternalizable(this.list).writeExternal(param1);
         }
         else
         {
            param1.writeObject(this.source);
         }
      }
   }
}
