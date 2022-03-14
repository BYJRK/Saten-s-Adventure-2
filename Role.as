package
{
	import flash.display.MovieClip;
	import Skill;
	
	public class Role extends MovieClip
	{
		private var skillList = new Skill();
		public function Role(names:String, positions:int)
		{
			ClearCondition();
			ClearStrengthen();
			Name = names;
			SetAbility();
			Position = positions;
		}
			
		public function GetFrame():int
		{
			var temp:int = 1;
			switch (Name)
			{
				case "佐天泪子":
					temp = 2; break;
				case "我妻由乃":
					temp = 3; break;
				case "博丽灵梦":
					temp = 4; break;
				case "胖虎": 
					temp = 5; break;
				case "小鸟游六花": 
					temp = 6; break;
				case "七宫智音": 
					temp = 7; break;
				case "最后之作": 
					temp = 8; break;
				case "御坂妹妹":
					temp = 9; break;
				case "桐人": 
					temp = 10; break;
				case "亚丝娜": 
					temp = 11; break;
				case "栗山未来": 
					temp = 12; break;
				case "时崎狂三": 
					temp = 13; break;
				case "奈亚子": 
					temp = 14; break;
				case "克子": 
					temp = 15; break;
				case "哈斯塔": 
					temp = 16; break;
				case "凉宫春日":
					temp = 17; break;		
			}
			return temp;
			// 人物形象和人物标志的帧数完全相同
		}
		
		private function SetAbility():void
		{
            HP = HPmax = 0;
            MP = MPmax = -1;
            Attack = 0; 
            Magic = 0;  
            Defence = 0; 
            Speed = 0; 
            Luck = 0;
			// 回合数变为0
			Turn = 0;
			Gender = false;
            // 根据名称设定角色初始值
            if (Name == "佐天泪子")
            {
                HP = HPmax = 1000;
                MP = MPmax = 750;
                Attack = 350; 
                Magic = 300;  
                Defence = 275; 
                Speed = 300; 
                Luck = 400;
            }
            else if (Name == "我妻由乃")
            {
                HP = HPmax = 1250;
                MP = MPmax = 500;
                Attack = 500; 
                Magic = 150;  
                Defence = 350; 
                Speed = 250; 
                Luck = 300;
            }
            else if (Name == "博丽灵梦")
            {
                HP = HPmax = 850;
                MP = MPmax = 900;
                Attack = 250; 
                Magic = 400;  
                Defence = 300; 
                Speed = 350; 
                Luck = 150;
            }

            // 敌人
            else if (Name == "胖虎")
            {
                HP = HPmax = 2500;
                Attack = 250; 
                Magic = 200;  
                Defence = 300; 
                Speed = 225; 
                Luck = 200;
                Gender = true;
            }
            else if (Name == "小鸟游六花")
            {
                HP = HPmax = 2750;
                Attack = 180; 
                Magic = 150;  
                Defence = 200; 
                Speed = 240; 
                Luck = 250;
            }
            else if (Name == "七宫智音")
            {
                HP = HPmax = 2500;
                Attack = 200; 
                Magic = 160;  
                Defence = 220; 
                Speed = 265; 
                Luck = 200;
            }
            else if (Name == "最后之作")
            {
                HP = HPmax = 4500;
                Attack = 190; 
                Magic = 200;  
                Defence = 300; 
                Speed = 320; 
                Luck = 300;
            }
            else if (Name == "御坂妹妹")
            {
                HP = HPmax = 1500;
                Attack = 240; 
                Magic = 250;  
                Defence = 200; 
                Speed = 250; 
                Luck = 225;
            }
            else if (Name == "桐人")
            {
                HP = HPmax = 5000;
                Attack = 375; 
                Magic = 280;  
                Defence = 340; 
                Speed = 280; 
                Luck = 350;
                Gender = true;
            }
            else if (Name == "亚丝娜")
            {
                HP = HPmax = 4500;
                Attack = 325; 
                Magic = 300;  
                Defence = 300; 
                Speed = 320; 
                Luck = 300;
            }
            else if (Name == "栗山未来")
            {
                HP = HPmax = 7500;
                Attack = 450; 
                Magic = 200;  
                Defence = 300; 
                Speed = 350; 
                Luck = 250;
            }
            else if (Name == "时崎狂三")
            {
                HP = HPmax = 9999;
                Attack = 350; 
                Magic = 400;  
                Defence = 350; 
                Speed = 325; 
                Luck = 350;
            }
            else if (Name == "奈亚子")
            {
                HP = HPmax = 10000;
                Attack = 400; 
                Magic = 350;  
                Defence = 300; 
                Speed = 290; 
                Luck = 300;
            }
            else if (Name == "克子")
            {
                HP = HPmax = 8500;
                Attack = 300; 
                Magic = 350;  
                Defence = 300; 
                Speed = 275; 
                Luck = 325;
            }
            else if (Name == "哈斯塔")
            {
                HP = HPmax = 9000;
                Attack = 300; 
                Magic = 350;  
                Defence = 400; 
                Speed = 300; 
                Luck = 275;
                Gender = true;
            }
            else if (Name == "凉宫春日")
            {
                HP = HPmax = 18000;
                Attack = 350; 
                Magic = 350;  
                Defence = 400; 
                Speed = 275; 
                Luck = 400;
            }
            else
            {               
                HP = HPmax = 0;
                Attack = 0; 
                Magic = 0;  
                Defence = 0; 
                Speed = 0; 
                Luck = 0;
                Gender = true;
            }
		}
		
		// 传入场上敌人的状态，然后产生对应的技能
		public function AI(enemy1:Role, enemy2:Role, enemy3:Role):String
		{
			var nnn:int = 0;// 敌人空位数量
			nnn = 0;
			if (enemy1 == null) nnn++;
			if (enemy2 == null) nnn++;
			if (enemy3 == null) nnn++;
			// 如果状态为害怕，则只能是防御（即便是混乱，害怕了也只能防御）
			if (Scared > 0)
			{
				return "防御";
			}
			var vvv:int = Math.random() * 100;
			//trace(vvv);
			// 我方角色的AI是只有混乱的时候才会调用的
			if (Name == "佐天泪子")
			{
				return "球棒挥击";
			}
			else if (Name == "我妻由乃")
			{
				return "匕首挥击";
			}
			else if (Name == "博丽灵梦")
			{
				return "阴阳玉";
			}
			else if (Name == "胖虎")
			{		
				if (Chaos > 0)
				{
					return "重拳出击";
				}
				// 第一阶段
				if (HP > HPmax / 2)
				{
					if (vvv < 20)
					{
						return "防御";
					}
					else if (vvv >= 20 && vvv < 50)
					{
						return "灭绝歌";
					}
					else
					{
						return "重拳出击";
					}
				}
				// 第二阶段
				else
				{
					if (vvv < 30)
					{
						return "防御";
					}
					else if (vvv < 50)
					{
						return "休息";
					}
					else if (vvv < 65)
					{
						return "灭绝歌";
					}
					else
					{
						return "重拳出击";
					}
				}
			}
			else if (Name == "小鸟游六花")
			{
				if (Chaos > 0)
				{
					return "邪王真眼";
				}
				if (HP > HPmax * 0.4)
				{
					if (vvv < 35)
					{
						return "邪王真眼";
					}
					else if (vvv < 55)
					{
						return "使魔召唤";
					}
					else if (vvv < 75)
					{
						return "强力飞踹";
					}
					else
					{
						return "漆黑之盾";
					}
				}
				else
				{
					if (vvv < 40)
					{
						return "使魔召唤";
					}
					else if (vvv < 70)
					{
						return "漆黑之盾";
					}
					else
					{
						return "休息";
					}
				}
			}
			else if (Name == "七宫智音")
			{
				if (Chaos > 0)
				{
					return "炽天使降临";
				}
				if (vvv < 50)
				{
					return "炽天使降临";
				}
				else if (vvv < 80)
				{
					return "千重凤凰击";
				}
				else
				{
					return "火神之盾";
				}
			}
			else if (Name == "最后之作")
			{
				if (Chaos > 0)
				{
					return "防御";
				}
				if (Turn < 3 && nnn > 0)
				{
					return "召唤妹妹";
				}

				if (HP > HPmax * 0.4)
				{
					if (nnn == 2)
					{
						if (vvv < 75)
						{
							return "召唤妹妹";
						}
						else if (vvv < 90)
						{
							return "撒娇卖萌";
						}
						else
						{
							return "防御";
						}
					}
					else if (nnn == 1)
					{
						if (vvv < 50)
						{
							return "召唤妹妹";
						}
						else if (vvv < 80)
						{
							return "撒娇卖萌";
						}
						else
						{
							return "防御";
						}
					}
					else
					{
						if (vvv < 60)
						{
							return "撒娇卖萌";
						}
						else
						{
							return "防御";
						}
					}
				}
				else
				{
					if (nnn == 2)
					{
						if (vvv < 50)
						{
							return "召唤妹妹";
						}
						else if (vvv < 85)
						{
							return "休息";
						}
						else
						{
							return "防御";
						}
					}
					else if (nnn == 1)
					{
						if (vvv < 20)
						{
							return "召唤妹妹";
						}
						else if (vvv < 85)
						{
							return "休息";
						}
						else
						{
							return "防御";
						}
					}
					else
					{
						if (vvv < 20)
						{
							return "撒娇卖萌";
						}
						else if (vvv < 80)
						{
							return "休息";
						}
						else
						{
							return "防御";
						}
					}
				}
			}
			else if (Name == "御坂妹妹")
			{					
				if (Chaos > 0)
				{
					return "手枪射击";
				}
				if (vvv < 50)
				{
					return "手枪射击";
				}
				else if (vvv < 80)
				{
					return "步枪射击";
				}
				else
				{
					return "防御";
				}
			}
			else if (Name == "桐人")
			{
				if (Chaos > 0)
				{
					return "双重扇形斩";
				}
				if (HP > HPmax * 0.5)
				{
					if (vvv < 38)
					{
						return "双重扇形斩";
					}
					else if (vvv < 76)
					{
						return "星爆气流斩";
					}
					else
					{
						return "日蚀";
					}
				}
				else
				{					
					if (vvv < 35)
					{
						return "双重扇形斩";
					}
					else if (vvv < 70)
					{
						return "星爆气流斩";
					}
					else if (vvv < 80)
					{
						return "日蚀";
					}
					else
					{
						return "防御";
					}
				}
			}
			else if (Name == "亚丝娜")
			{
				if (Chaos > 0)
				{
					return "星屑飞溅";
				}
				nnn = 0;
				if (enemy1 != null)
				{
					if (enemy1.Position != Position && enemy1.HP < enemy1.HPmax * 0.5) nnn++;
				}
                if (enemy2 != null)
                {
                    if (enemy2.Position != Position && enemy2.HP < enemy2.HPmax * 0.5) nnn++;
                }
                if (enemy3 != null)
                {
                    if (enemy3.Position != Position && enemy3.HP < enemy3.HPmax * 0.5) nnn++;
                }

				if (HP > HPmax * 0.4)
				{
					// 表明有角色需要补血
					if (nnn > 0)
					{
						if (vvv < 50)
						{
							return "生命回复";
						}
						else if (vvv < 80)
						{
							return "星屑飞溅";
						}
						else if (vvv < 95)
						{
							return "并肩作战";
						}
						else
						{
							return "防御";
						}
					}
					else
					{
						if (vvv < 50)
						{
							return "星屑飞溅";
						}
						else if (vvv < 75)
						{
							return "并肩作战";
						}
						else if (vvv < 90)
						{
							return "防御";
						}
						else
						{
							return "休息";
						}
					}
				}
				else
				{
					// 表明有角色需要补血
					if (nnn > 0)
					{
						if (vvv < 20)
						{
							return "生命回复";
						}
						else if (vvv < 30)
						{
							return "并肩作战";
						}
						else if (vvv < 50)
						{
							return "星屑飞溅";
						}
						else if (vvv < 90)
						{
							return "休息";
						}
						else
						{
							return "防御";
						}
					}
					else
					{
						if (vvv < 10)
						{
							return "生命回复";
						}
						else if (vvv < 50)
						{
							return "休息";
						}
						else if (vvv < 65)
						{
							return "并肩作战";
						}
						else if (vvv < 80)
						{
							return "星屑飞溅";
						}
						else
						{
							return "防御";
						}
					}
				}				
			}
			else if (Name == "栗山未来")
			{				
				if (Chaos > 0)
				{
					return "透明血刃";
				}
				// 第一阶段
				if (HP > HPmax * 0.6)
				{
					if (vvv < 40)
					{
						return "透明血刃";
					}
					else if (vvv < 75)
					{
						return "我不愉快";
					}
					else
					{
						return "戒指解除";
					}
				}
				// 第二阶段
				else if (HP > HPmax * 0.3)
				{
					if (vvv < 40)
					{
						return "透明血刃";
					}
					else if (vvv < 65)
					{
						return "我不愉快";
					}
					else if (vvv < 85)
					{
						return "戒指解除";
					}
					else
					{
						return "防御";
					}
				}
				// 第三阶段
				else
				{
					if (vvv < 25)
					{
						return "透明血刃";
					}
					else if (vvv < 30)
					{
						return "我不愉快";
					}
					else if (vvv < 75)
					{
						return "防御";
					}
					else
					{
						return "休息";
					}
				}
			}
			else if (Name == "时崎狂三")
			{
				if (Chaos > 0)
				{
					return "二之弹";
				}
				if (Turn == 1 && nnn == 2)
				{
					return "八之弹";
				}
				else if (Turn == 4 && nnn > 0)
				{
					return "八之弹";
				}
				if (HP > HPmax * 0.66)
				{
					if (dSpeed <= 0)
					{
						if (nnn > 0)
						{							
							if (vvv < 35)
							{
								return "一之弹";
							}
							else if (vvv < 60)
							{
								return "八之弹";
							}
							else if (vvv < 80)
							{
								return "二之弹";
							}
							else
							{
								return "七之弹";
							}
						}
						else
						{
							if (vvv < 60)
							{
								return "一之弹";
							}
							else if (vvv < 80)
							{
								return "二之弹";
							}
							else
							{
								return "七之弹";
							}
						}
					}
					else
					{
						if (nnn > 0)
						{
							if (vvv < 50)
							{
								return "八之弹";
							}							
							else if (vvv < 80)
							{
								return "二之弹";
							}
							else
							{
								return "七之弹";
							}
						}
						else
						{							
							if (vvv < 55)
							{
								return "二之弹";
							}
							else
							{
								return "七之弹";
							}
						}
					}
				}
				else if (HP > HPmax * 0.33)
				{
					if (nnn == 2)
					{
						if (vvv < 55)
						{
							return "八之弹";
						}
						else if (vvv < 75)
						{
							return "四之弹";
						}
						else if (vvv < 90)
						{
							return "二之弹";
						}
						else
						{
							return "七之弹";
						}
					}
					else if (nnn == 1)
					{
						if (dSpeed <= 0)
						{
							if (vvv < 35)
							{
								return "一之弹";
							}
							else if (vvv < 60)
							{
								return "四之弹";
							}
							else if (vvv < 75)
							{
								return "二之弹";
							}
							else if (vvv < 90)
							{
								return "七之弹";
							}
							else
							{
								return "八之弹";
							}
						}
						else
						{
							if (vvv < 35)
							{
								return "四之弹";
							}
							else if (vvv < 70)
							{
								return "二之弹";
							}
							else if (vvv < 85)
							{
								return "七之弹";
							}
							else
							{
								return "八之弹";
							}
						}
					}
					else
					{
						if (dSpeed <= 0)
						{
							if (vvv < 30)
							{
								return "一之弹";
							}
							else if (vvv < 60)
							{
								return "四之弹";
							}
							else if (vvv < 85)
							{
								return "二之弹";
							}
							else
							{
								return "七之弹";
							}
						}
						else
						{
							if (vvv < 40)
							{
								return "四之弹";
							}
							else if (vvv < 75)
							{
								return "二之弹";
							}
							else
							{
								return "七之弹";
							}
						}
					}
				}
				else if (HP > HPmax * 0.1)
				{
					if (vvv < 35)
					{
						return "四之弹";
					}
					else if (vvv < 70)
					{
						return "二之弹";
					}
					else
					{
						return "七之弹";
					}
				}
				else
				{
					if (nnn > 0)
					{
						return "八之弹";
					}
					else
					{
						return "四之弹";
					}
				}
			}
			else if (Name == "奈亚子")
            {
                if (Chaos > 0)
                {
                    return "难以名状";
                }
                if (HP > HPmax * 0.6)
                {
                    if (vvv < 30)
                    {
                        return "难以名状";
                    }
                    else if (vvv < 60)
                    {
                        return "宇宙CQC";
                    }
                    else if (vvv < 80)
                    {
                        return "呆毛雷达";
                    }
                    else
                    {
                        return "亵渎之手榴弹";
                    }
                }
                else if (HP > HPmax * 0.3)
                {
                    if (vvv < 25)
                    {
                        return "难以名状";
                    }
                    else if (vvv < 40)
                    {
                        return "宇宙CQC";
                    }
                    else if (vvv < 60)
                    {
                        return "呆毛雷达";
                    }
                    else if (vvv < 85)
                    {
                        return "亵渎之手榴弹";
                    }
                    else if (vvv < 90)
                    {
                        return "休息";
                    }
                    else
                    {
                        return "防御";
                    }
                }
                else
                {
                    if (vvv < 60)
                    {
                        return "休息";
                    }
                    else if (vvv < 75)
                    {
                        return "防御";
                    }
                    else if (vvv < 80)
                    {
                        return "呆毛雷达";
                    }
                    else if (vvv < 90)
                    {
                        return "难以名状";
                    }
                    else
                    {
                        return "宇宙CQC";
                    }
                }
            }
            else if (Name == "克子")
            {
                if (Chaos > 0)
                {
                    return "防御";
                }
                if (HP > HPmax * 0.4)
                {
                    if (vvv < 35)
                    {
                        return "百合之魂";
                    }
                    else if (vvv < 80)
                    {
                        return "火焰邪神";
                    }
                    else
                    {
                        return "防御";
                    }
                }
                else
                {
                    if (vvv < 30)
                    {
                        return "火焰邪神";
                    }
                    else if (vvv < 75)
                    {
                        return "休息";
                    }
                    else
                    {
                        return "防御";
                    }
                }
            }
            else if (Name == "哈斯塔")
            {
                if (Chaos > 0)
                {
                    return "防御";
                }
                if (vvv < 40)
                {
                    return "大气操控";
                }
                else if (vvv < 65)
                {
                    return "搞基之魂";
                }
                else if (vvv < 87)
                {
                    return "防御";
                }
                else
                {
                    return "休息";
                }
            }
			else if (Name == "凉宫春日")
			{
				if (Chaos > 0)
				{
					return "凉宫春日的消失";
				}
				if ((Turn - 1) % 3 == 0 && nnn > 0)
				{
					return "凉宫春日的分裂";
				}
				if (HP > HPmax * 0.8)
				{
					if (vvv < 20)
					{
						return "凉宫春日的忧郁";
					}
					else if (vvv < 40)
					{
						return "凉宫春日的烦闷";
					}
					else if (vvv < 60)
					{
						return "凉宫春日的消失";
					}
					else if (vvv < 80)
					{
						return "凉宫春日的暴走";
					}
					else if (vvv < 90)
					{
						return "凉宫春日的动摇";
					}
					else
					{
						return "凉宫春日的惊愕";
					}
				}
				else if (HP > HPmax * 0.6)
				{					
					if (vvv < 10)
					{
						return "凉宫春日的忧郁";
					}
					else if (vvv < 20)
					{
						return "凉宫春日的阴谋";
					}
					else if (vvv < 30)
					{
						return "凉宫春日的烦闷";
					}
					else if (vvv < 45)
					{
						return "凉宫春日的消失";
					}
					else if (vvv < 60)
					{
						return "凉宫春日的暴走";
					}
					else if (vvv < 75)
					{
						return "凉宫春日的惊愕";
					}
					else if (vvv < 90)
					{
						return "凉宫春日的愤慨";
					}
					else
					{
						return "凉宫春日的叹息";
					}
				}
				else if (HP > HPmax * 0.4)
				{									
					if (vvv < 9)
					{
						return "凉宫春日的忧郁";
					}
					else if (vvv < 18)
					{
						return "凉宫春日的阴谋";
					}
					else if (vvv < 27)
					{
						return "凉宫春日的烦闷";
					}
					else if (vvv < 36)
					{
						return "凉宫春日的消失";
					}
					else if (vvv < 45)
					{
						return "凉宫春日的暴走";
					}
					else if (vvv < 54)
					{
						return "凉宫春日的惊愕";
					}
					else if (vvv < 60)
					{
						return "凉宫春日的愤慨";
					}
					else
					{
						return "凉宫春日的叹息";
					}
				}
				else if (HP > HPmax * 0.2)
				{								
					if (vvv < 10)
					{
						return "凉宫春日的忧郁";
					}
					else if (vvv < 20)
					{
						return "凉宫春日的阴谋";
					}
					else if (vvv < 30)
					{
						return "凉宫春日的暴走";
					}
					else if (vvv < 40)
					{
						return "凉宫春日的惊愕";
					}
					else if (vvv < 70)
					{
						return "凉宫春日的愤慨";
					}
					else
					{
						return "凉宫春日的叹息";
					}
				}
				else
				{
					if (vvv < 20)
					{
						return "凉宫春日的烦闷";
					}
					else if (vvv < 40)
					{
						return "凉宫春日的忧郁";
					}
					else if (vvv < 60)
					{
						return "凉宫春日的愤慨";
					}
					else
					{
						return "凉宫春日的叹息";
					}
				}
			}
			
			return "防御";
		}
		
		// 改变HP的值，正数为上升，负数为下降
		public function ChangeHP(number:int):int
		{
			//trace(Name + " 血量：" + HP.toString() + " -> " + (HP + number).toString());
			HP += number;
			if (HP > HPmax)
			{
				HP = HPmax;
			}
			if (HP < 0)
			{
				HP = 0;
			}
			return number;
		}
		public function AddHPRatio(number:Number):int
		{
			return ChangeHP(HPmax * number);
		}
		public function ReduceHP(number:int):void
		{
			ChangeHP( -number);
		}
		public function ChangeMP(number:int = 0):void
		{
			if (number != 0)
			{
				MP += number;
			}
			else
			{
				MP += MPmax * 0.2;
			}
			if (MP > MPmax)
			{
				MP = MPmax;
			}
			if (MP < 0)
			{
				MP = 0;
			}
		}
		
		// 计算伤害
		public function GetDamage(skill:String, enemy:Role):int
		{			
			// 没有命中
			if (!GetHitRate(skill, enemy))
			{
				return 0;
			}
			
			var temp:int;
			
			if (skillList.IsPhy(skill))
			{
				// 爆机写在外部，不在此处进行判断
				// (我方攻击 * 攻击强化 + 固有伤害 - 敌方防御 * 防御强化 / 2) * 技能伤害系数 * 爆机 * 防御效果
				// 浮动（0.95 ~ 1.05）
				// 如果小于0（不可能）则伤害为1 ~ 5
				temp = AT - enemy.DF / 2;
				// 固有伤害
				temp += GetSkillDamage(skill);
				
				// 伤害系数
				temp *= GetSkillRatio(skill);
				// 浮动
				temp *= Math.random() * 0.1 + 0.95;
				
				if (temp < 0)
				{
					temp = Math.ceil(Math.random() * 5);
				}
			}
			else
			{
				temp = GetMagicDamage(skill, enemy);
			}
						
			// 此处对于特殊技能进行强化
			if (skill == "掀裙奥义")
			{
				if (enemy.Gender)
				{
					temp *= 0.4;
				}
				else
				{
					temp *= 1.8;
				}
			}
			else if (skill == "无双掀裙")
			{
				temp += MP + 1000 * Math.pow(MP / MPmax, 2);
				if (!enemy.Gender)
				{
					temp *= 1.3;
				}
			}
			else if (skill == "谜之笑容")
			{
				if (enemy.Gender)
				{
					temp *= 1.6;
					//trace(temp);
				}
			}
			else if (skill == "争风吃醋")
			{
				if (!enemy.Gender)
				{
					temp *= 1.3;
				}
			}
			
			
			// 防御
			if (enemy.Defencing > 0)
			{
				// 某些特殊技能能够无视防御效果
				if (skill == "梦想封印") { }
				else if (skill == "呆毛雷达") { }
				else if (skill == "凉宫春日的惊愕") { }
				else
				{
					temp /= 2;
				}				
			}
			
			// 佐天泪子的呱太胸章效果写在此处
			if (Name == "佐天泪子" && Sp2 && skillList.IsPhy(skill))
			{
				temp *= 1.3;
			}
			
			return temp;
		}
		public function GetMagicDamage(skill:String, enemy:Role):int
		{
			// (我方法术 * 法术强化 + 法术固有伤害 - 敌方防御 * 防御强化 / 3) * 技能伤害系数 * 防御效果 
			// 浮动（0.9 ~ 1.1）
			// 如果小于0（不可能）则伤害为1 ~ 10
				
			var temp:int;
			temp = MA + GetSkillDamage(skill) - enemy.DF / 3;
			// 伤害系数
			temp *= GetSkillRatio(skill);
			// 浮动
			temp *= Math.random() * 0.2 + 0.9;
			
			if (temp < 0)
			{
				temp = Math.ceil(Math.random() * 10);
			}
			
			//trace(temp);
			
			return temp;
		}
		
		// 物理攻击命中率（一定在30~100之间）
		public function GetHitRate(skill:String, enemy:Role):Boolean
		{			
			var temp:int = 100;	
			var sp1:int = SP + LC / 3, sp2:int = enemy.SP + enemy.LC / 3;			
			if (!skillList.IsPhy(skill))
			{
				temp = GetHitRateBySkill(skill);
			}
			// 以下内容完全照搬自曹操传的命中率计算公式		
			else
			{
                if (sp1 > 2 * sp2)
                {
                    temp = 100;
                }
                else if (sp1 > sp2)
                {
                    temp = (sp1 - sp2) * 10 / sp2 + 90;
                }
                else if (sp1 > sp2 / 2)
                {
                    temp = (sp1 - sp2 / 2) * 30 / (sp2 / 2) + 60;
                }
                else
                {
                    temp = (sp1 - sp2 / 3) * 30 / (sp2 / 3) + 30;
                }
			}
			
			if (skill == "二斧流")
			{
				temp *= 1.13;
			}
			else if (skill == "日蚀")
			{
				temp *= 1.1;
			}
			
			var result:Boolean;
			var number = Math.random() * 100;
			
			// 凌乱状态，命中率下降，而且招数必须是物理攻击！！！
			// 经过考虑，连同法术攻击都收到凌乱影响更能够体现凌乱状态的麻烦
			if (Mess > 0)// && skillList.IsPhy(skill))
			{
				// 特殊技能不受该状态的影响
				if (skill == "未来日记"){}
				else temp *= 0.8;
			}
			if (number < temp) result = true;
			else result = false;
			
			//trace(number, temp, result);
			
			return result;
		}
		// 法术攻击命中率
		public function GetHitRateBySkill(skill:String):int
		{
			return skillList.HitRate(skill);
		}
		// 物理攻击暴击率
		public function GetCritical(skill:String, enemy:Role):Boolean
		{
			if (!skillList.IsPhy(skill))
			{
				return false;
			}
			var temp:int = 100;
			var rrr:Number = LC;
			rrr /= enemy.LC;
			// 以下内容照抄自曹操传暴击率公式
			if (rrr >= 3)
			{
				temp = 100;
			}
			else if (rrr >= 2 && rrr < 3)
			{
				temp = 100 * (0.8 * rrr - 1.4);
			}
			else if (rrr >= 1 && rrr < 2)
			{
				temp = 100 * (0.18 * rrr - 0.16);
			}
			else
			{
				temp = 1;
			}
			
			var result:Boolean;
			var number = Math.random() * 100;
			if (number < temp) result = true;
			else result = false;
			
			return result;
		}
		
		// 获取技能伤害系数
		private function GetSkillRatio(skill:String):Number
		{
			var temp:Number = 1.0;
			
			temp = skillList.GetSkillRatio(skill);
			return temp;
		}
		// 获取技能固有伤害
		private function GetSkillDamage(skill:String):int
		{
			var temp:int = 0;
			
			temp = skillList.GetOriginalDamage(skill);
			
			return temp;
		}
		
		// 异常状态相关（以下两个函数暂时没用，本来想做成每次只能有一个异常的效果，但是放弃了）
		public function GetBadCondition(condition:String, number:int = 0):void
		{
			// 这个有问题，应该是仅去除坏情况
			ClearCondition();
			// 由于在回合初扣数字，所以每个number都加了一个1
			switch (condition)
			{
				case "凌乱":
					if (number == 0)
						Mess = 6;
					else
						Mess = number;
					break;
				case "混乱":
					if (number == 0)
						Chaos = 4;
					else
						Chaos = number;
					break;
				case "害怕":
					if (number == 0)
						Scared = 6;
					else
						Scared = number;
					break;
				case "晕眩":
					if (number == 0)
						Giddy = 2;
					else
						Giddy = number;
					break;
				case "中毒":
					if (number == 0)
						Poison = 9;
					else
						Poison = number;
			}
		}
		public function GetGoodCondition(condition:String, number:int = 0):void
		{
			
		}
		
		public function ClearCondition():void
		{
			Poison = Scared = Mess = Giddy = Chaos = 0;
			// 测试中毒效果
			//Poison = 20;
			Defencing = 0;
		}
		// 清除坏异常（梦想天生所用）
		public function ClearBadCondition():void
		{
			Poison = Scared = Mess = Giddy = Chaos = 0;
		}
		public function ClearStrengthen(type:int = 0):void
		{
			if (type == 0)
			{
				dAttack = dDefence = dMagic = dSpeed = dLuck = 0;
			}
		}
		// 回合开始，防御状态数值降低
		// 另外，回合数的上升写在这里
		public function ReduceDefence():void
		{
			Defencing--;
			Turn++;
			SpecialFunction();
		}
		// 凉宫春日的每回合去除异常状态在此处
		// 我妻由乃的病娇状态写在此处
		public function SpecialFunction():void
		{
			if (Name == "凉宫春日")
			{
				ClearBadCondition();
			}
			if (Name == "我妻由乃" && Sp1)
			{
				if (Attack < 800)
				{
					Attack += 10;
				}
			}
		}
		// 回合结束，所有状态数值均降低
		public function ReduceCondition():void
		{
			// 不考虑是否小于0了，因为如果加成，是直接变成某个数字，而不是在现有基础上上升，因此无法累加
			Poison--;
			Scared--;
			Mess--;
			Giddy--;
			Chaos--;
			
			// 这个需要考虑小于0的情况
			// 大于零意思是提升，小于零意思是降低
            if (dAttack > 0) dAttack--;
            else if (dAttack < 0) dAttack++;
            else;
            if (dDefence > 0) dDefence--;
            else if (dDefence < 0) dDefence++;
            else;
            if (dMagic > 0) dMagic--;
            else if (dMagic < 0) dMagic++;
            else;
            if (dSpeed > 0) dSpeed--;
            else if (dSpeed < 0) dSpeed++;
            else;
            if (dLuck > 0) dLuck--;
            else if (dLuck < 0) dLuck++;
            else;
		}
		// 每回合开始，回复MP，甚至还有佐天泪子的自动回血
		public function AddHPMP():int
		{
			var mmm:int = MPmax * 0.2;
			if (Name == "博丽灵梦" && Sp1)
			{
				mmm = MPmax * 250 / 900;
			}
			if (Name == "佐天泪子" && Sp1)
			{
				ChangeHP(HPmax * 0.05);
			}
			ChangeMP(mmm);
			return mmm;
		}
		// 由于中毒而减血，返回值为减血数量
		public function DamageByPoison():int
		{
			if (Poison <= 0)
			{
				return 0;
			}
			var damage:int = HPmax * 0.08;
			ChangeHP(-damage);
			return damage;
		}
		
		// 人物的各种属性
		// 最基本的属性
		public var Name:String, Position:int;
		// 新增属性：回合数（与某些技能挂钩）
		public var Turn:int = 0;
		// 新增属性：性别（true为男性，false女性）
		public var Gender:Boolean;
		// 表示所代表的角色在哪一帧
		public var Frame:int;
		// 为了实现某些角色的特殊属性而临时设定的变量
		public var Sp1:Boolean = false, Sp2:Boolean = false, Sp3:Boolean = false;
		// 攻击、法术、防御、速度、幸运
		public var Attack:int, Magic:int, Defence:int, Speed:int, Luck:int; 
		public function get AT():int
        {
            if (dAttack > 0)
                return Attack * 1.2;
            else if (dAttack < 0)
                return Attack * 0.8;
            else
                return Attack;
        }
        public function get MA():int
        {
            if (dMagic > 0)
                return Magic * 1.2;
            else if (dMagic < 0)
                return Magic * 0.8;
            else
                return Magic;
        }
        public function get DF():int
        {
            if (dDefence > 0)
                return Defence * 1.2;
            else if (dDefence < 0)
                return Defence * 0.8;
            else
                return Defence;
        }
        public function get SP():int
        {
            if (dSpeed > 0)
                return Speed * 1.2;
            else if (dSpeed < 0)
                return Speed * 0.8;
            else
                return Speed;
        }
        public function get LC():int
        {
            if (dLuck > 0)
                return Luck * 1.2;
            else if (dLuck < 0)
                return Luck * 0.8;
            else
                return Luck;
        }
		// 状态加成或削弱
		public var dAttack:int, dMagic:int, dDefence:int, dSpeed:int, dLuck:int;
		// 生命值、法术值
		public var HP:int, HPmax:int, MP:int, MPmax:int;
		// 异常状态剩余回合数
		// 中毒，害怕，混乱，晕眩，凌乱
		public var Poison:int, Scared:int, Mess:int, Giddy:int, Chaos:int;
		// 强化状态剩余回合数
		// 防御
		public var Defencing:int;
	}
}