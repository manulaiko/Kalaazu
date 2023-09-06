package org.osmf.traits
{
   public final class LoadState
   {
      
      public static const UNINITIALIZED:String = "uninitialized";
      
      public static const LOADING:String = "loading";
      
      public static const UNLOADING:String = "unloading";
      
      public static const READY:String = "ready";
      
      public static const LOAD_ERROR:String = "loadError";
       
      
      public function LoadState()
      {
         super();
      }
   }
}
