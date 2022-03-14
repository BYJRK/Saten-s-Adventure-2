package
{
	// 这个类详细记录了所有技能的效果等等
	public class Skill
	{
		// 获取相应技能对应的总帧数（动画效果）
		public function GetTotalFrame(Name:String):int
		{
			var temp:int = 0;
			switch (Name)
			{
				case "防御": temp = 44; break;
				case "休息": temp = 61; break;
				case "复活同伴": temp = 55; break;
				// 佐天泪子
				case "球棒挥击": temp = 45; break;
				case "幻想御手": temp = 65; break;
                case "掀裙奥义": temp = 35; break;
				case "都市传说": temp = 90; break;
                case "无双掀裙": temp = 75; break;
				// 我妻由乃
				case "匕首挥击": temp = 35; break;
				case "谜之笑容": temp = 65; break;
				case "未来日记": temp = 90; break;
				case "争风吃醋": temp = 70; break;
				case "二斧流": temp = 130; break;
                // 博丽灵梦
                case "阴阳玉": temp = 90; break;
                case "梦想封印": temp = 80; break;
				case "飞行能力": temp = 80; break;
				case "梦想天生": temp = 80; break;
                case "二重封印": temp = 165; break;
				// 胖虎
				case "重拳出击": temp = 35; break;
				case "灭绝歌":   temp = 65; break;
				// 小鸟游六花
				case "邪王真眼": temp = 45; break;
				case "使魔召唤": temp = 60; break;
				case "强力飞踹": temp = 45; break;
				case "漆黑之盾": temp = 40; break;
				// 七宫智音
				case "炽天使降临": temp = 70; break;
				case "火神之盾": temp = 45; break;
				case "千重凤凰击": temp = 115; break;
				// 最后之作
				case "撒娇卖萌": temp = 50; break;
				case "召唤妹妹": temp = 50; break;
                // 御坂妹妹
                case "手枪射击": temp = 40; break;
                case "步枪射击": temp = 45; break;
				// 桐人
				case "双重扇形斩": temp = 70; break;
				case "星爆气流斩": temp = 70; break;
				case "日蚀": temp = 130; break;
				// 亚丝娜
				case "星屑飞溅": temp = 80; break;
				case "并肩作战": temp = 85; break;
				case "生命回复": temp = 75; break;
				// 栗山未来
				case "透明血刃": temp = 40; break;
				case "我不愉快": temp = 60; break;
				case "戒指解除": temp = 70; break;
				// 时崎狂三
				case "一之弹": temp = 65; break;
				case "二之弹": temp = 60; break;
				case "四之弹": temp = 85; break;
				case "七之弹": temp = 60; break;
				case "八之弹": temp = 55; break;
				// 奈亚子
				case "宇宙CQC": temp = 95; break;
				case "难以名状": temp = 50; break;
				case "亵渎之手榴弹": temp = 115; break;
				case "呆毛雷达": temp = 80; break;
				// 克子
				case "火焰邪神": temp = 100; break;
				case "百合之魂": temp = 90; break;
				// 哈斯塔
				case "大气操控": temp = 60; break;
				case "搞基之魂": temp = 75; break;
				// 凉宫春日                
				case "凉宫春日的忧郁": temp = 100 ; break;
                case "凉宫春日的叹息": temp = 65 ; break;
                case "凉宫春日的烦闷": temp = 135 ; break;
                case "凉宫春日的消失": temp = 45 ; break;
                case "凉宫春日的暴走": temp = 70 ; break;
                case "凉宫春日的动摇": temp = 60 ; break;
                case "凉宫春日的阴谋": temp = 85 ; break;
                case "凉宫春日的愤慨": temp = 45 ; break;
                case "凉宫春日的分裂": temp = 50 ; break;
                case "凉宫春日的惊愕": temp = 80 ; break;
			}
			return temp * 100 / 6;
		}	
		// 获取相应技能的出现数字的帧数
		public function GetEffectFrame(Name:String):int
		{	
			var temp:int = 0;
			switch (Name)
			{
				case "防御": temp = 0; break;
				case "休息": temp = 25; break;
				case "复活同伴": temp = 20; break;
				// 佐天泪子
				case "球棒挥击": temp = 9; break;	
				case "幻想御手": temp = 13; break;	
                case "掀裙奥义": temp = 10; break;
				case "都市传说": temp = 40; break;
                case "无双掀裙": temp = 20; break;
				// 我妻由乃
				case "匕首挥击": temp = 10; break;
				case "谜之笑容": temp = 30; break;
				case "未来日记": temp = 60; break;
				case "争风吃醋": temp = 30; break;
				case "二斧流": temp = 100; break;
                // 博丽灵梦
                case "阴阳玉": temp = 50; break;
                case "梦想封印": temp = 50; break;
				case "飞行能力": temp = 0; break;
				case "梦想天生": temp = 50; break;
                case "二重封印": temp = 135; break;
				// 胖虎
				case "重拳出击": temp = 10; break;
				case "灭绝歌"  : temp = 26; break;
				// 小鸟游六花
				case "邪王真眼": temp = 15; break;
				case "使魔召唤": temp = 30; break;
				case "强力飞踹": temp = 10; break;
				case "漆黑之盾": temp = 0; break;
				// 七宫智音
				case "炽天使降临": temp = 37; break;
				case "火神之盾": temp = 10; break;
				case "千重凤凰击": temp = 85; break;
				// 最后之作
				case "撒娇卖萌": temp = 23; break;
				case "召唤妹妹": temp = 0; break;
                // 御坂妹妹
                case "手枪射击": temp = 15; break;
                case "步枪射击": temp = 20; break;
				// 桐人
				case "双重扇形斩": temp = 40; break;
				case "星爆气流斩": temp = 40; break;
				case "日蚀": temp = 100; break;
				// 亚丝娜
				case "星屑飞溅": temp = 43; break;
				case "并肩作战": temp = 0; break;
				case "生命回复": temp = 35; break;
				// 栗山未来
				case "透明血刃": temp = 10; break;
				case "我不愉快": temp = 29; break;
				case "戒指解除": temp = 40; break;
				// 时崎狂三
				case "一之弹": temp = 30; break;
				case "二之弹": temp = 30; break;
				case "四之弹": temp = 55; break;
				case "七之弹": temp = 30; break;
				case "八之弹": temp = 0; break;
				// 奈亚子
				case "宇宙CQC": temp = 50; break;
				case "难以名状": temp = 15; break;
				case "亵渎之手榴弹": temp = 90; break;
				case "呆毛雷达": temp = 45; break;
				// 克子
				case "火焰邪神": temp = 65; break;
				case "百合之魂": temp = 0; break;
				// 哈斯塔
				case "大气操控": temp = 0; break;
				case "搞基之魂": temp = 50; break;
				// 凉宫春日                
				case "凉宫春日的忧郁": temp = 65 ; break;
                case "凉宫春日的叹息": temp = 25 ; break;
                case "凉宫春日的烦闷": temp = 100 ; break;
                case "凉宫春日的消失": temp = 10 ; break;
                case "凉宫春日的暴走": temp = 26 ; break;
                case "凉宫春日的动摇": temp = 30 ; break;
                case "凉宫春日的阴谋": temp = 0 ; break;
                case "凉宫春日的愤慨": temp = 0 ; break;
                case "凉宫春日的分裂": temp = 0 ; break;
                case "凉宫春日的惊愕": temp = 45 ; break;
			}
			return temp * 100 / 6;
		}
		// 获取相应技能的固有伤害
		public function GetOriginalDamage(Name:String):int
		{			
            switch (Name)
            {
                // 佐天泪子
                case "球棒挥击": return 100;
                case "幻想御手": return 0;
                case "掀裙奥义": return 100;
                case "无双掀裙": return 50;
                case "都市传说": return 350;
                // 我妻由乃
                case "匕首挥击": return 100;
                case "谜之笑容": return 350;
                case "未来日记": return 500;
                case "争风吃醋": return 75;
                case "二斧流": return 1000;
                // 博丽灵梦
                case "阴阳玉": return 175;
                case "梦想封印": return 200;
                case "飞行能力": return 0;
                case "梦想天生": return 0;
                case "二重封印": return 500;
                // 胖虎
                case "重拳出击": return 75;
                case "灭绝歌": return 50;
				// 小鸟游六花
				case "邪王真眼": return 100;
				case "使魔召唤": return 120;
				case "强力飞踹": return 150;
				// 七宫智音
				case "炽天使降临": return 100;
				case "火神之盾": return 0;
				case "千重凤凰击": return 275;
				// 最后之作
				case "撒娇卖萌": return 25;
				case "召唤妹妹": return 0;
                // 御坂妹妹
                case "手枪射击": return 50;
                case "步枪射击": return 30;
				// 桐人
				case "双重扇形斩": return 50;
				case "星爆气流斩": return 50;
				case "日蚀": return 120;
				// 亚丝娜
				case "星屑飞溅": return 50;
				case "并肩作战": return 0;
				case "生命回复": return 0;
				// 栗山未来
				case "透明血刃": return 100;
				case "我不愉快": return 50;
				case "戒指解除": return 75;
				// 时崎狂三
				case "一之弹": return 0;
				case "二之弹": return 120;
				case "四之弹": return 0;
				case "七之弹": return 175;
				case "八之弹": return 0;
				// 奈亚子
				case "宇宙CQC": return 100;
				case "难以名状": return 50;
				case "亵渎之手榴弹": return 50;
				case "呆毛雷达": return 0;
				// 克子
				case "火焰邪神": return 60;
				case "百合之魂": return 0;
				// 哈斯塔
				case "大气操控": return 75;
				case "搞基之魂": return 0;                
				// 凉宫春日                
                case "凉宫春日的忧郁": return 30;
                case "凉宫春日的叹息": return 0;
                case "凉宫春日的烦闷": return 85;
                case "凉宫春日的消失": return 75;
                case "凉宫春日的暴走": return 60;
                case "凉宫春日的动摇": return 150;
                case "凉宫春日的阴谋": return 0;
                case "凉宫春日的愤慨": return 0;
                case "凉宫春日的分裂": return 0;
                case "凉宫春日的惊愕": return 0;
            }
            return 0;
		}
		// 获取相应技能的伤害系数
		public function GetSkillRatio(Name:String):Number
		{        
            switch (Name)
            {
                // 佐天泪子
                case "球棒挥击": return 1.0;
                case "幻想御手": return 1.0;
                case "掀裙奥义": return 1.2;
                case "无双掀裙": return 1.3;
                case "都市传说": return 1.5;
                // 我妻由乃
                case "匕首挥击": return 1.0;
                case "谜之笑容": return 1.3;
                case "争风吃醋": return 1.2;
                case "未来日记": return 2.5;
                case "二斧流"  : return 2.0;
                // 博丽灵梦
                case "阴阳玉": return 1.2;
                case "梦想封印": return 1.4;
                case "飞行能力": return 1.0;
                case "梦想天生": return 1.0;
                case "二重封印": return 1.5;
                // 胖虎
                case "重拳出击": return 1.2;
                case "灭绝歌": return 1.5;
                // 小鸟游六花
                case "邪王真眼": return 1.1;
				case "使魔召唤": return 1.0;
				case "强力飞踹": return 1.2;
				case "漆黑之盾": return 1.0;
				// 七宫智音
				case "炽天使降临": return 1.2;
				case "火神之盾": return 1.0;
				case "千重凤凰击": return 1.1;
				// 最后之作
				case "撒娇卖萌": return 1.1;
				case "召唤妹妹": return 1.0;
                // 御坂妹妹
                case "手枪射击": return 1.1;
                case "步枪射击": return 1.0;
				// 桐人
				case "双重扇形斩": return 1.1;
				case "星爆气流斩": return 1.2;
				case "日蚀": return 1.35;
				// 亚丝娜
				case "星屑飞溅": return 1.2;
				case "并肩作战": return 1.0;
				case "生命回复": return 1.0;
                // 栗山未来
                case "透明血刃": return 1.1;
                case "我不愉快": return 1.0;
                case "戒指解除": return 1.0;
				// 时崎狂三
				case "一之弹": return 1.0;
				case "二之弹": return 1.3;
				case "四之弹": return 1.0;
				case "七之弹": return 1.2;
				case "八之弹": return 1.0;
				// 奈亚子
				case "宇宙CQC": return 1.1;
				case "难以名状": return 1.2;
				case "亵渎之手榴弹": return 1.1;
				case "呆毛雷达": return 1.0;
				// 克子
				case "火焰邪神": return 1.1;
				case "百合之魂": return 1.0;
				// 哈斯塔
				case "大气操控": return 1.15;
				case "搞基之魂": return 1.0;              
				// 凉宫春日                
                case "凉宫春日的忧郁": return 1.1;
                case "凉宫春日的叹息": return 1.0;
                case "凉宫春日的烦闷": return 1.3;
                case "凉宫春日的消失": return 1.2;
                case "凉宫春日的暴走": return 1.1;
                case "凉宫春日的动摇": return 1.2;
                case "凉宫春日的阴谋": return 1.0;
                case "凉宫春日的愤慨": return 1.0;
                case "凉宫春日的分裂": return 1.0;
                case "凉宫春日的惊愕": return 1.0;
            }
            return 1.0;
		}
		// 获取相应技能损耗的MP值（-1代表的意思是消耗全部MP）
		public function GetSkillMP(Name:String):int
		{
			switch (Name)
			{
                case "球棒挥击": return 50;
                case "幻想御手": return 350;
                case "掀裙奥义": return 275;
                case "无双掀裙": return -1;
                case "都市传说": return 400;

                case "匕首挥击": return 50;
                case "谜之笑容": return 275;
                case "争风吃醋": return 325;
                case "未来日记": return 375;
                case "二斧流": return 0;

                case "阴阳玉": return 75;
                case "梦想封印": return 300;
                case "飞行能力": return 450;
                case "梦想天生": return 350;
                case "二重封印": return 550;
			}
			return 0;
		}
		// 技能是否为物理技能
		public function IsPhy(Name:String):Boolean
		{	
			// 只有以下技能为物攻
            switch (Name)
            {
				// 佐天泪子
                case "球棒挥击":
                case "掀裙奥义":
				// 我妻由乃
                case "匕首挥击":
				case "争风吃醋":
                case "二斧流":
				// 博丽灵梦
                case "阴阳玉":
				// 胖虎
				case "重拳出击":
				// 小鸟游六花
				case "强力飞踹":
				// 七宫智音
				case "炽天使降临":
                // 御坂妹妹
                case "手枪射击":
				// 桐人
				case "双重扇形斩":
				case "日蚀":
				// 亚丝娜
				case "星屑飞溅":
				// 栗山未来
				case "透明血刃":
				case "戒指解除":
				// 时崎狂三
				case "二之弹":
				// 奈亚子
				case "宇宙CQC":
				case "难以名状":
				// 克子（无）
				// 哈斯塔
				case "大气操控":               
				// 凉宫春日
                case "凉宫春日的烦闷":
                case "凉宫春日的消失":
                case "凉宫春日的动摇":
					return true;
            }
			return false;
		}
		// 获取技能介绍
		public function GetSkillInfo(Name:String):String
		{
			switch (Name)
			{
				case "防御":
					return "开启抱头蹲防模式，受到的伤害减半，不消耗MP";
				case "休息":
					return "立刻就地躺下开始睡觉，回复HP总计350，消耗MP总量的20%";
				case "复活同伴":
					return "使已经倒下的同伴立刻原地复活，并回复总血量的40%，消耗MP总量的50%";
				
                case "球棒挥击":
                    return "（物理）挥舞其在超电磁炮最后一集必定使用的球棍对敌方单体进行常规物理攻击。MP消耗50";
                case "幻想御手":
                    return "使用开挂神器，使我方单人HP回复750点，并且攻击、幸运上升三回合。MP消耗350";
                case "掀裙奥义":
                    return "（物理）佐天泪子的独门绝学。如果对方是女生，则效果拔群，并有几率进入攻击降低状态三回合。对男生效果很差。MP消耗275";
                case "无双掀裙":
                    return "（法术）强力的掀裙技能。由于力道强大，技巧娴熟，甚至能够无视对方性别，进行无差别攻击。伤害与我方剩余MP数量有关。MP全部消耗";
                case "都市传说":
                    return "（法术）散播各种不知真假的都市传说，有一定几率使对方进入中毒状态五回合或速度降低三回合，并会因为分不清真假而损失HP。MP消耗400";

                case "匕首挥击":
                    return "（物理）最基础的病娇妹子必备技能。MP消耗50";
                case "谜之笑容":
                    return "（法术）使用谜の微笑，对对方全体造成不同程度的震慑效果。对男性角色效果较好。有几率进入晕眩状态。MP消耗275";
                case "未来日记":
                    return "（法术）使用未来日记，精准的找到对方的弱点进行攻击，而且命中率非常高，不受凌乱效果的影响。MP消耗375";
                case "争风吃醋":
                    return "（物理）将无限的醋意转换为杀意，攻击敌方全体，具体伤害与剩余MP有关。对女性角色效果较好。有几率使敌人混乱三回合。MP消耗325";
                case "二斧流":
                    return "（物理）桐人传授的技能。以牺牲防御为代价，换取更加高效的挥舞斧头，造成强力伤害，且命中率略高于普通物理攻击。消耗MP及HP总计800（先减完MP，有可能致死）";

                case "阴阳玉":
                    return "（物理）红白的最基础攻击招式，MP消耗75";
                case "梦想封印":
                    return "（法术）对敌方单体造成较为有效的伤害。由于具有魔法属性，因此能够无视对方的防御效果。MP消耗300";
                case "飞行能力":
                    return "借助飞行程度的能力，使我方全体速度提升三回合。MP消耗450";
                case "梦想天生":
                    return "我方每人HP补充700，并解除异常状态，但是施法者会由于法力消耗过度而速度降低一回合。MP消耗350";
                case "二重封印":
                    return "（法术）对敌方全体造成中等规模的伤害，并有几率使对方陷入害怕状态两回合。MP消耗550";
			}
			return "";
		}
		// 获取技能攻击范围（0只能是自己，1敌方单人，2我方单人，3敌方全体，4我方全体，5全场所有人）
		// 注意，此处的所谓我方、敌方是一个绝对的概念，不是相对的。敌方永远指的是主角的敌人
		public function GetSkillRange(Name:String):int
		{
            switch (Name)
            {
                // 主角共有技能
                case "防御": return 0;
                case "休息": return 0;
                case "复活同伴": return 2;
                // 佐天泪子
                case "球棒挥击": return 1;
                case "幻想御手": return 2;
                case "掀裙奥义": return 1;
                case "无双掀裙": return 3;
                case "都市传说": return 3;
                // 我妻由乃
                case "匕首挥击": return 1;
                case "谜之笑容": return 3;
                case "争风吃醋": return 3;
                case "未来日记": return 1;
                case "二斧流": return 1;
                // 博丽灵梦
                case "阴阳玉": return 1;
                case "梦想封印": return 1;
                case "飞行能力": return 4;
                case "梦想天生": return 4;
                case "二重封印": return 3;
                    
                // 胖虎
                case "重拳出击": return 2;
                case "灭绝歌": return 4;
                // 小鸟游六花
                case "邪王真眼": return 2;
                case "使魔召唤":  return 2;
                case "强力飞踹": return 2;
                case "漆黑之盾": return 0;
                // 七宫智音
                case "炽天使降临": return 2;
                case "火神之盾":  return 0;
                case "千重凤凰击": return 2;
                // 最后之作
                case "撒娇卖萌": return 4;
                // 御坂妹妹
                case "手枪射击": return 2;
                case "步枪射击": return 4;
				// 桐人
				case "双重扇形斩": return 2;
				case "星爆气流斩": return 2;
				case "日蚀": return 2;
				// 亚丝娜
				case "星屑飞溅": return 2;
				case "并肩作战": return 3;
				case "生命回复": return 1;
                // 栗山未来
                case "透明血刃":  return 2;
                case "我不愉快": return 4;
                case "戒指解除": return 4;
				// 时崎狂三
				case "一之弹": return 0;
				case "二之弹": return 2;
				case "四之弹": return 0;
				case "七之弹": return 2;
				case "八之弹": return 0;
				// 奈亚子
				case "宇宙CQC": return 2;
				case "难以名状": return 2;
				case "亵渎之手榴弹": return 4;
				case "呆毛雷达": return 4;
				// 克子
				case "火焰邪神": return 4;
				case "百合之魂": return 3;
				// 哈斯塔
				case "大气操控": return 4;
				case "搞基之魂": return 4;  
				// 凉宫春日
                case "凉宫春日的忧郁": return 4;
                case "凉宫春日的叹息": return 3;
                case "凉宫春日的烦闷": return 2;
                case "凉宫春日的消失": return 2;
                case "凉宫春日的暴走": return 4;
                case "凉宫春日的动摇": return 2;
                case "凉宫春日的阴谋": return 3;
                case "凉宫春日的愤慨": return 0;
                case "凉宫春日的分裂": return 0;
                case "凉宫春日的惊愕": return 4; 
            }            
            return 0;
		}
        // 获取法术技能的命中率（物理技能的命中率是通过SP计算的）
		public function HitRate(skill:String):int
        {
            switch (skill)
            {
                // 佐天泪子
                case "无双掀裙": return 95;
				case "都市传说": return 90;
                // 我妻由乃
                case "谜之笑容": return 85;
                case "未来日记": return 98;
				// 博丽灵梦
				case "梦想封印": return 95;
				case "二重封印": return 90;
                // 胖虎
                case "灭绝歌"  : return 85;
                // 小鸟游六花
                case "邪王真眼": return 90;
                case "使魔召唤": return 85;
                // 七宫智音
                case "千重凤凰击": return 90;
                // 最后之作
                case "撒娇卖萌": return 80;
                case "召唤妹妹": return 100;
                // 御坂妹妹
                case "步枪射击": return 80;
                // 桐人
                case "星爆气流斩": return 90;
				// 亚丝娜
                // 栗山未来
                case "我不愉快": return 80;
				// 时崎狂三
				case "七之弹": return 95;
				// 奈亚子
				case "亵渎之手榴弹": return 85;
				case "呆毛雷达": return 90;
				// 克子
				case "火焰邪神": return 80;
				case "百合之魂": return 75;
				// 哈斯塔
				case "搞基之魂": return 75; 
				// 凉宫春日
                case "凉宫春日的忧郁": return 86;
                case "凉宫春日的暴走": return 80;
                case "凉宫春日的惊愕": return 95;
            }
            return 95;
        }	
		// 技能是否为大招，并在符卡动画处播放符卡声音
		public function hasSpellSound(skill:String):Boolean
		{
			switch(skill)
			{
				case "无双掀裙":
				case "都市传说":
				case "未来日记":
				case "二斧流":
				case "梦想天生":
				case "二重封印":
					
				case "灭绝歌":
				case "邪王真眼":
				case "千重凤凰击":
				case "召唤妹妹":
				case "步枪射击":
				case "日蚀":
				case "星屑飞溅":
				case "戒指解除":
				case "八之弹": 		
				case "宇宙CQC":
				case "大气操控":
				case "火焰邪神":
					
                case "凉宫春日的忧郁":
                case "凉宫春日的叹息":
                case "凉宫春日的烦闷":
                case "凉宫春日的消失":
                case "凉宫春日的暴走":
                case "凉宫春日的动摇":
                case "凉宫春日的阴谋":
                case "凉宫春日的愤慨":
                case "凉宫春日的分裂":
                case "凉宫春日的惊愕":
				
					return true;
			}
			return false;
		}
		
		public function hasShaking(skill:String):int
		{
			switch(skill)
			{
				case "无双掀裙": return 0;
				
				case "梦想天生":					
				case "召唤妹妹":
				case "步枪射击":
				// 时崎狂三
				case "一之弹": 
				case "四之弹": 
				case "八之弹":
				// 凉宫春日			
                case "凉宫春日的叹息":
                case "凉宫春日的消失":
                case "凉宫春日的动摇":
                case "凉宫春日的阴谋":
                case "凉宫春日的愤慨":
                case "凉宫春日的分裂":
					
					return -1;
			}
			if (hasSpellSound(skill))
			{
				return GetEffectFrame(skill);
			}
			return -1;
		}
	}
}