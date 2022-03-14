package  {	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import Role;
	
	public class FightBox extends MovieClip 
	{	
		
		public function FightBox() 
		{
		}
		
		
		public function SetPlayer(st:Boolean = true, gs:Boolean = true, hr:Boolean = true):void
        {
            if (st)
            {
                stImage.visible = true;
                stHP.visible = true;
                stMP.visible = true;
                stName.visible = true;
            }
            else
            {
                stImage.visible = false;
                stHP.visible = false;
                stMP.visible = false;
                stName.visible = false;
            }
            if (gs)
            {
                gsImage.visible = true;
                gsHP.visible = true;
                gsMP.visible = true;
                gsName.visible = true;
            }
            else
            {
                gsImage.visible = false;
                gsHP.visible = false;
                gsMP.visible = false;
                gsName.visible = false;
            }
            if (hr)
            {
                hrImage.visible = true;
                hrHP.visible = true;
                hrMP.visible = true;
                hrName.visible = true;
            }
            else
            {
                hrImage.visible = false;
                hrHP.visible = false;
                hrMP.visible = false;
                hrName.visible = false;
            }
        }
		
		public function Update(r1:Role, r2:Role, r3:Role):void
		{
			if (stImage.visible)
			{
				stHP.Set(r1.HP, r1.HPmax);
				stHP.SetValue(r1.HP, r1.HPmax);
				stMP.Set(r1.MP, r1.MPmax);
				stMP.SetValue(r1.MP, r1.MPmax);
			}
            if (gsImage.visible)
            {
                gsHP.Set(r2.HP, r2.HPmax);
                gsHP.SetValue(r2.HP, r2.HPmax);
                gsMP.Set(r2.MP, r2.MPmax);
                gsMP.SetValue(r2.MP, r2.MPmax);
            }
            if (hrImage.visible)
            {
                hrHP.Set(r3.HP, r3.HPmax);
                hrHP.SetValue(r3.HP, r3.HPmax);
                hrMP.Set(r3.MP, r3.MPmax);
                hrMP.SetValue(r3.MP, r3.MPmax);
            }
		}
	}
	
}
