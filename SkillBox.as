package  
{	
	import flash.display.MovieClip;	
	import flash.events.MouseEvent;
	import Skill;
	import sButton1;
	import Role;
	public class SkillBox extends MovieClip 
	{
		
		// 元件中总共八个按钮，从s1到s8，每个按钮有一个成员，Name，显示文字
		// 另外，还有一个文本框Info，显示技能信息
		public function SkillBox() 
		{
			Info.text = "请选择技能";
			Name.text = "";
			
			sArray[0].x = sArray[2].x = sArray[4].x = sArray[6].x = 155;
			sArray[1].x = sArray[3].x = sArray[5].x = sArray[7].x = 345;
			sArray[0].y = sArray[1].y = 130;
			sArray[2].y = sArray[3].y = 205;
			sArray[4].y = sArray[5].y = 280;
			sArray[6].y = sArray[7].y = 355;
			s2.gotoAndStop(2);
			s4.gotoAndStop(2);
			s6.gotoAndStop(2);
						
			ClearInfo();
			
			for (var i:int = 0; i < 8; i++)
			{
				this.addChild(sArray[i]);
				sArray[i].addEventListener(MouseEvent.ROLL_OVER, ShowInfo);
				sArray[i].addEventListener(MouseEvent.ROLL_OUT, HideInfo);
			}
		}
		private var skill = new Skill();
		public function ClearInfo():void
		{			
			for (var i:int = 0; i < 8; i++)
			{
				sArray[i].SetInfo("");
				sArray[i].visible = false;
			}
		}
		
		private var s1 = new sButton1();
		private var s2 = new sButton1();
		private var s3 = new sButton1();
		private var s4 = new sButton1();
		private var s5 = new sButton1();
		private var s6 = new sButton1();
		private var s7 = new sButton1();
		private var s8 = new sButton1();
		public var sArray = new Array(s1, s2, s3, s4, s5, s6, s7, s8);
		
		// 根据不同位置判断人物并显示按钮
		public function SetInfo(hero:Role, Value1:Boolean = false, Value2:Boolean = false, Value3:Boolean = false)
		{
			Info.text = "请选择技能：";
			
			var Name:String;
			switch (hero.Position)
			{
				case 1:
					Name = "佐天泪子";
					break;
				case 2:
					Name = "我妻由乃";
					break;
				case 3:
					Name = "博丽灵梦";
					break;
			}
			//trace(Name);
			this.Name.text = Name;
			// 最初，清空所有按钮
			ClearInfo();
			// 不考虑角色，一定拥有以下技能
			SetButton(2, "防御");
			if (hero.MP < hero.MPmax * 0.2)
			{
				SetButton(4, "休息", false);
			}
			else
			{
				SetButton(4, "休息");
			}
			if (hero.MP < hero.MPmax * 0.5)
			{
				SetButton(6, "复活同伴", false);
			}
			else
			{
				SetButton(6, "复活同伴");
			}
			// 开始分析角色
            if (Name == "佐天泪子")
            {
                if (hero.MP < skill.GetSkillMP("球棒挥击") || hero.Scared > 0)
                {
                    SetButton(1, "球棒挥击", false);
                }
                else
                {
                    SetButton(1, "球棒挥击");
                }
                if (hero.MP < skill.GetSkillMP("幻想御手"))
                {
                    SetButton(3, "幻想御手", false);
                }
                else
                {
                    SetButton(3, "幻想御手");
                }                
                if (Value1)
                {
                    if (hero.MP < skill.GetSkillMP("掀裙奥义") || hero.Scared > 0)
                    {
                        SetButton(5, "掀裙奥义", false);
                    }
                    else
                    {
                        SetButton(5, "掀裙奥义");
                    }
                }
                if (Value2)
                {
                    if (hero.MP < skill.GetSkillMP("无双掀裙") || hero.Scared > 0)
                    {
                        SetButton(8, "无双掀裙", false);
                    }
                    else
                    {
                        SetButton(8, "无双掀裙");
                    }
                }
                if (Value3)
                {
                    if (hero.MP < skill.GetSkillMP("都市传说") || hero.Scared > 0)
                    {
                        SetButton(7, "都市传说", false);
                    }
                    else
                    {
                        SetButton(7, "都市传说");
                    }
                }
            }
            else if (Name == "我妻由乃")
            {
                if (hero.MP < skill.GetSkillMP("匕首挥击") || hero.Scared > 0)
                {
                    SetButton(1, "匕首挥击", false);
                }
                else
                {
                    SetButton(1, "匕首挥击");
                }
                if (hero.MP < skill.GetSkillMP("谜之笑容") || hero.Scared > 0)
                {
                    SetButton(3, "谜之笑容", false);
                }
                else
                {
                    SetButton(3, "谜之笑容");
                }
				if (Value1)
				{
					if (hero.MP < skill.GetSkillMP("争风吃醋") || hero.Scared > 0)
					{
						SetButton(7, "争风吃醋", false);
					}
					else
					{
						SetButton(7, "争风吃醋");
					}
				}
                if (hero.MP < skill.GetSkillMP("未来日记") || hero.Scared > 0)
                {
                    SetButton(5, "未来日记", false);
                }
                else
                {
                    SetButton(5, "未来日记");
                }
                if (Value2)
                {                    
                    if (hero.MP < skill.GetSkillMP("二斧流") || hero.Scared > 0)
                    {
                        SetButton(8, "二斧流", false);
                    }
                    else
                    {
                        SetButton(8, "二斧流");
                    }
                }
            }
            else if (Name == "博丽灵梦")
            {                
                if (hero.MP < skill.GetSkillMP("阴阳玉") || hero.Scared > 0)
                {
                    SetButton(1, "阴阳玉", false);
                }
                else
                {
                    SetButton(1, "阴阳玉");
                }
                if (hero.MP < skill.GetSkillMP("梦想封印") || hero.Scared > 0)
                {
                    SetButton(3, "梦想封印", false);
                }
                else
                {
                    SetButton(3, "梦想封印");
                }
                if (hero.MP < skill.GetSkillMP("飞行能力"))
                {
                    SetButton(5, "飞行能力", false);
                }
                else
                {
                    SetButton(5, "飞行能力");
                }
                if (hero.MP < skill.GetSkillMP("梦想天生"))
                {
                    SetButton(7, "梦想天生", false);
                }
                else
                {
                    SetButton(7, "梦想天生");
                }
                if (Value1)
                {
                    if (hero.MP < skill.GetSkillMP("二重封印") || hero.Scared > 0)
                    {
                        SetButton(8, "二重封印", false);
                    }
                    else
                    {
                        SetButton(8, "二重封印");
                    }
                }
            }
		}
		
		private function ShowInfo(evt:MouseEvent):void
		{
			if (evt.currentTarget.alpha == 1)
			{
				Info.text = skill.GetSkillInfo(evt.target.GetInfo());
			}
			else
			{
				Info.text = "MP值不够或者当前为害怕状态";
			}
			//Info.text = evt.target.x.toString() + ", " + evt.target.y.toString();
		}
		private function HideInfo(evt:MouseEvent):void
		{
			Info.text = "请选择技能：";
		}
		
		private function SetButton(index:int, contents:String, isEnabled:Boolean = true):void
		{
			index--;
			sArray[index].SetInfo(contents);
			sArray[index].visible = true;
			if (!isEnabled)
			{
				sArray[index].alpha = 0.5;
			}
			else
			{
				sArray[index].alpha = 1;
			}
		}
	}	
}
