package net.bigpoint.darkorbit.fui.builder.xml.mapping
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.builder.MappingInstanceNames;
   import net.bigpoint.darkorbit.fui.builder.repository.XMLUITemplateRepository;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.ButtonCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.CheckboxCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.ComboboxCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.ContainerCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.CoreponentCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.DropDownBoxCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.FlashRelatedDisplayObjectCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.ImageSlideShowCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.InputCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.ItemlistCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.LabelCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.MouseCursorCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.ProgressBarCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.RadioButtonCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.RootCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.ScrollContainerCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.ScrollbarCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.SliderNStepsCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.TabBarCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.TextStyleCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.ToggleButtonCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.VideoPlayerCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.WindowCreator;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.skins.SkinCreator;
   
   public dynamic class XMLNodeNameToInstanceMap extends Dictionary
   {
       
      
      public function XMLNodeNameToInstanceMap()
      {
         super(false);
         this[MappingInstanceNames.ROOT] = new XMLMappingVO(new RootCreator().mapAttributes);
         var _loc1_:FlashRelatedDisplayObjectCreator = new FlashRelatedDisplayObjectCreator();
         this[MappingInstanceNames.DISPLAYOBJECTCONTAINER] = new XMLMappingVO(_loc1_.create,true);
         this[MappingInstanceNames.SPRITE] = new XMLMappingVO(_loc1_.create,true);
         this[MappingInstanceNames.MOVIECLIP] = new XMLMappingVO(_loc1_.create,true);
         this[MappingInstanceNames.TEXTFIELD] = new XMLMappingVO(_loc1_.create,false);
         this[MappingInstanceNames.COREPONENT] = new XMLMappingVO(new CoreponentCreator().create,true);
         this[MappingInstanceNames.CONTAINER] = new XMLMappingVO(new ContainerCreator().create,true);
         this[MappingInstanceNames.TOOLTIPS_HOLDER] = new XMLMappingVO(null,true);
         this[MappingInstanceNames.TOOLTIP] = new XMLMappingVO(XMLUITemplateRepository.getInstance().addTemplate,false);
         this[MappingInstanceNames.BUTTON] = new XMLMappingVO(new ButtonCreator().create);
         this[MappingInstanceNames.CHECHBOX] = new XMLMappingVO(new CheckboxCreator().create);
         this[MappingInstanceNames.RADIOBUTTON] = new XMLMappingVO(new RadioButtonCreator().create);
         this[MappingInstanceNames.TOOGLEBUTTON] = new XMLMappingVO(new ToggleButtonCreator().create);
         this[MappingInstanceNames.LABEL] = new XMLMappingVO(new LabelCreator().create);
         this[MappingInstanceNames.SCROLLBAR] = new XMLMappingVO(new ScrollbarCreator().create,true);
         this[MappingInstanceNames.INPUT] = new XMLMappingVO(new InputCreator().create);
         this[MappingInstanceNames.SLIDER_N_STEPS] = new XMLMappingVO(new SliderNStepsCreator().create);
         this[MappingInstanceNames.TABBAR] = new XMLMappingVO(new TabBarCreator().create);
         this[MappingInstanceNames.SCROLLCONTAINER] = new XMLMappingVO(new ScrollContainerCreator().create,true);
         this[MappingInstanceNames.WINDOW] = new XMLMappingVO(new WindowCreator().create,true);
         this[MappingInstanceNames.IMAGESLIDESHOW] = new XMLMappingVO(new ImageSlideShowCreator().create,false);
         this[MappingInstanceNames.VIDEOPLAYER] = new XMLMappingVO(new VideoPlayerCreator().create,false);
         this[MappingInstanceNames.PROGRESSBAR] = new XMLMappingVO(new ProgressBarCreator().create,true);
         this[MappingInstanceNames.ITEMLIST] = new XMLMappingVO(new ItemlistCreator().create,false);
         this[MappingInstanceNames.COMBOBOX] = new XMLMappingVO(new ComboboxCreator().create,false);
         this[MappingInstanceNames.DROPDOWNBOX] = new XMLMappingVO(new DropDownBoxCreator().create,false);
         this[MappingInstanceNames.SKINS_HOLDER] = new XMLMappingVO(null,true);
         this[MappingInstanceNames.SKIN] = new XMLMappingVO(new SkinCreator().create,false,false);
         this[MappingInstanceNames.MOUSECURSOR] = new XMLMappingVO(new MouseCursorCreator().create,false,false);
         this[MappingInstanceNames.STYLES_HOLDER] = new XMLMappingVO(null,true);
         this[MappingInstanceNames.TEXTSTYLE] = new XMLMappingVO(new TextStyleCreator().create,false,false);
         this[MappingInstanceNames.TEMPLATE] = new XMLMappingVO(XMLUITemplateRepository.getInstance().addTemplate,false);
         this[MappingInstanceNames.PLACEHOLDER] = new XMLMappingVO(XMLUITemplateRepository.getInstance().replaceWithTemplate,true,false);
         this[MappingInstanceNames.REFERENCE] = new XMLMappingVO(XMLUITemplateRepository.getInstance().replaceWithTemplate,false);
         this[MappingInstanceNames.NULL] = new XMLMappingVO(null,false,false);
      }
   }
}
