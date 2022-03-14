package 
{
	// 引入公共库
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.SoundTransform;
	import flash.text.ime.CompositionAttributeRange;
	import flash.ui.Mouse;
	import flash.utils.*;
	import flash.utils.Timer;
	import flash.errors.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.SharedObject;
	import flash.media.SoundChannel;
	import flash.media.Sound;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.system.fscommand;

	// 影片剪辑类
	import TalkBox;
	import Black;
	import Curtain;
	import ChooseBox;
	import Character;
	import SoundEffects;
	import Menus;
	import BattleStartMovie;
	import EnemyImg;
	import Mark;
	import ConditionBox;
	import ProcessBar;
	import SkillFilm;
	import SpellCard;
	import WarEnd;
	import FightBox;
	import SkillBox;
	
	// 非影片剪辑类
	import Role;
	import Skill;
	import HeroImg;

	public class main extends MovieClip
	{
		// 全局速度
		public var speed:int = 1000 / 60;

		public function main()
		{
			Initialize();
		}
		// 游戏初始化
		public function Initialize():void
		{
			// 菜单指令
			fscommand("fullscreen","true"); //全屏
			//fscommand("showmenu","false"); // 菜单和鼠标右键 不可用
			//fscommand("trapallkeys", "false"); //禁用快捷键

			// 添加容器
			stage.addChild(low);
			stage.addChild(medium);
			stage.addChild(high);
			stage.addChild(highest);
			
			// 对话框
			tBox.x = 0;
			tBox.y = 455;// 初始位置为屏幕下方看不到的位置
			high.addChild(tBox);
			tBox.Menu.addEventListener(MouseEvent.CLICK, ShowMenu);
			
			// 选择框
			cBox.x = 175;
			cBox.y = 75;
			ClearChooseBox();
			high.addChild(cBox);
			
			// 人物图像
			char1.y = char2.y = char3.y = 30;
			char1.alpha = char2.alpha = char3.alpha = 0;
			char1.x = 30;
			char2.x = 260;
			char3.x = 490;
			medium.addChild(char1);
			medium.addChild(char3);
			medium.addChild(char2);
			
			// 菜单
			menu.visible = false;
			menu.x = 100;
			menu.y = 50;
			high.addChild(menu);
			menu.Close.addEventListener(MouseEvent.CLICK, HideMenu);
			menu.a1.addEventListener(MouseEvent.CLICK, AdjustSpellCard);
			menu.addEventListener(MouseEvent.MOUSE_DOWN, onMenuDrag);
			menu.addEventListener(MouseEvent.MOUSE_UP, offMenuDrag);
			menu.di2.addEventListener(MouseEvent.CLICK, LowSpeed);
			menu.zhong2.addEventListener(MouseEvent.CLICK, MediumSpeed);
			menu.gao2.addEventListener(MouseEvent.CLICK, HighSpeed);
			menu.di3.addEventListener(MouseEvent.CLICK, SoundLow);
			menu.zhong3.addEventListener(MouseEvent.CLICK, SoundMedium);
			menu.gao3.addEventListener(MouseEvent.CLICK, SoundHigh);
			
			menu.st1.text = "";
			menu.st2.text = "";
			menu.st3.text = "";
			menu.st4.text = "";
			menu.st5.text = "";
			
			menu.sb1.addEventListener(MouseEvent.CLICK, Saving);
			menu.sb2.addEventListener(MouseEvent.CLICK, Saving);
			menu.sb3.addEventListener(MouseEvent.CLICK, Saving);
			menu.sb4.addEventListener(MouseEvent.CLICK, Saving);
			menu.sb5.addEventListener(MouseEvent.CLICK, Saving);
			menu.lb1.addEventListener(MouseEvent.CLICK, Loading);
			menu.lb2.addEventListener(MouseEvent.CLICK, Loading);
			menu.lb3.addEventListener(MouseEvent.CLICK, Loading);
			menu.lb4.addEventListener(MouseEvent.CLICK, Loading);
			menu.lb5.addEventListener(MouseEvent.CLICK, Loading);			
			menu.de1.addEventListener(MouseEvent.CLICK, Deleting);
			menu.de2.addEventListener(MouseEvent.CLICK, Deleting);
			menu.de3.addEventListener(MouseEvent.CLICK, Deleting);
			menu.de4.addEventListener(MouseEvent.CLICK, Deleting);
			menu.de5.addEventListener(MouseEvent.CLICK, Deleting);
			
			LoadOutsideSave();
			
			// 音效元件
			high.addChild(sound);
			
			// 战斗开始的动画
			battleStartMovie.visible = false;
			highest.addChild(battleStartMovie);

			// 黑幕
			black.alpha = 0;
			black.visible = false;
			highest.addChild(black);
			
			// 外围黑色
			highest.addChild(curtain);
			
			// 敌人图像
			var i:int;
			for (i = 0; i < 3; i++)
			{
				enemyArray[i].visible = false;
				enemyArray[i].addEventListener(MouseEvent.ROLL_OVER, onMouseRollInScale);
				enemyArray[i].addEventListener(MouseEvent.ROLL_OUT, onMouseRollOutScale);
				enemyArray[i].addEventListener(MouseEvent.CLICK, onMouseClick);
			}
            enemyArray[0].x = -6, enemyArray[0].y = 142;
            enemyArray[1].x = 131, enemyArray[1].y = 77;
            enemyArray[2].x = 257, enemyArray[2].y = 4;
            medium.addChild(enemyArray[2]);// 叠放次序
            medium.addChild(enemyArray[1]);
            medium.addChild(enemyArray[0]);
			
			// 人物标志
			for (i = 0; i < 6; i++)
			{
				markArray[i].visible = false;
				medium.addChild(markArray[i]);
			}
			markArray[0].gotoAndStop(2);
			markArray[1].gotoAndStop(3);
			markArray[2].gotoAndStop(4);
			
			cMark.visible = false;
			cMark.scaleX = 2;
			cMark.scaleY = 2;
			cMark.x = 730;
			cMark.y = 100;
			medium.addChild(cMark);
			cMark.addEventListener(MouseEvent.CLICK, ChooseCancel);
			
			// 进度条
			pBar.x = 415;
			pBar.y = 44;
			pBar.visible = false;
			medium.addChild(pBar);
			
			// 战斗框
			fBox.x = 0;
			fBox.y = 275;
			fBox.visible = false;
			fBox.stImage.addEventListener(MouseEvent.ROLL_OVER, onMouseRollInScale);
			fBox.stImage.addEventListener(MouseEvent.ROLL_OUT, onMouseRollOutScale);
			fBox.stImage.addEventListener(MouseEvent.CLICK, onMouseClick);
			
			fBox.gsImage.addEventListener(MouseEvent.ROLL_OVER, onMouseRollInScale);
			fBox.gsImage.addEventListener(MouseEvent.ROLL_OUT, onMouseRollOutScale);
			fBox.gsImage.addEventListener(MouseEvent.CLICK, onMouseClick);
			
			fBox.hrImage.addEventListener(MouseEvent.ROLL_OVER, onMouseRollInScale);
			fBox.hrImage.addEventListener(MouseEvent.ROLL_OUT, onMouseRollOutScale);
			fBox.hrImage.addEventListener(MouseEvent.CLICK, onMouseClick);
			high.addChild(fBox);
			
			// 法术效果
			filmArray[0].x = 424;
			filmArray[1].x = 571;
			filmArray[2].x = 717;
			filmArray[0].y = filmArray[1].y = filmArray[2].y = 323;
			filmArray[3].x = 94; filmArray[3].y = 300;
			filmArray[4].x = 212; filmArray[4].y = 226;
			filmArray[5].x = 341; filmArray[5].y = 154;
			for (i = 0; i < 6; i++)
			{
				filmArray[i].visible = false;
				high.addChild(filmArray[i]);
			}
			
			// 符卡图片
			card.visible = false;
			high.addChild(card);
			
			// 战斗胜利、失败动画
			warEnd.visible = false;
			warEnd.x = 400;
			warEnd.y = 225;
			high.addChild(warEnd);
			
			// 状态框
			eBox.visible = false;
			eBox.x = 600;
			eBox.y = 15;
			medium.addChild(eBox);
			
			// 技能框
			sBox.visible = false;
			high.addChild(sBox);
			for (i = 0; i < 8; i++)
			{
				sBox.sArray[i].addEventListener(MouseEvent.CLICK, ChooseSkill);
			}
			sBox.addEventListener(MouseEvent.ROLL_OVER, ShowSkillBox);
			sBox.addEventListener(MouseEvent.ROLL_OUT, HideSkillBox);
			
			tBox.Clicker.addEventListener(MouseEvent.CLICK, MainClickEvent);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, MainWheelEvent);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, MainPressEvent);
		}
		// 容器
		private var low = new Sprite();// 底层，显示背景图片
		private var medium = new Sprite();// 中层，显示人物头像
		private var high = new Sprite();// 高层，显示对话框
		private var highest = new Sprite();// 最高层，显示黑色边框以及黑幕
		// 元件
		private var tBox = new TalkBox();
		private var black = new Black();
		private var curtain = new Curtain();
		private var cBox = new ChooseBox();
		private var menu = new Menus();
		
		private var char1 = new Character();// 左边的头像，（30, 30）
		private var char2 = new Character();// 中间，（260, 30）
		private var char3 = new Character();// 右边，（490, 30）
		private var charArray = new Array(char1, char2, char3);

		private var enemy1 = new EnemyImg();// 敌人4，（-26, 182）
		private var enemy2 = new EnemyImg();// 敌人5，（101, 77）
		private var enemy3 = new EnemyImg();// 敌人6，（257, 4）
		private var enemyArray = new Array(enemy1, enemy2, enemy3);
		
		private var mark1 = new Mark();
		private var mark2 = new Mark();
		private var mark3 = new Mark();
		private var mark4 = new Mark();
		private var mark5 = new Mark();
		private var mark6 = new Mark();
		private var markArray = new Array(mark1, mark2, mark3, mark4, mark5, mark6);
		
		private var film1 = new SkillFilm();
		private var film2 = new SkillFilm();
		private var film3 = new SkillFilm();
		private var film4 = new SkillFilm();
		private var film5 = new SkillFilm();
		private var film6 = new SkillFilm();
		private var filmArray = new Array(film1, film2, film3, film4, film5, film6);
		
		private var cMark = new Mark();// 显示当前回合的头像
		
		private var sound = new SoundEffects();		
		private var battleStartMovie = new BattleStartMovie();
		private var fBox = new FightBox();
		private var sBox = new SkillBox();
		
		private var card = new SpellCard();
		private var warEnd = new WarEnd();
		
		private var eBox = new ConditionBox();
		private var pBar = new ProcessBar();
		
		private var Img = new HeroImg();

		// ===================================================================================便于调用的函数 =====		
		public function M(soundName:String = "", loop:int = 999):void
		{
			PlayMusic(soundName, loop);
		}
		public function S(Name:String = "", Content:String = "", position:int = 0):void
		{
			Say(Name, Content, position);
		}
		public function W(bg:String, delay:int = 100, goto:String = ""):void
		{
			Wait(delay, bg, goto);
		}
		public function K(duration:int = 20, amplitude:int = 20):void
		{
			Shake(duration, amplitude);
		}
		public function C(t1:String = "", g1:String = "", t2:String = "", g2:String = "", t3:String = "", g3:String = ""):void
		{
			Choose(t1, g1, t2, g2, t3, g3);
		}
		public function B():void
		{
			Before();
		}
		public function L(names:String):void
		{
			Scenes(names);
		}
		public function H(names:String = "", fast:Boolean = false):void
		{
			if (names != "") HideCharacter(names, fast);
			else HideAllChar(fast);
		}
		public function F(frame1:String, frame2:String, frame3:String, scenes:String):void
		{
			StartWar(frame1, frame2, frame3, scenes);
		}
		public function GOTO(frame:Object):void
		{
			gotoAndStop(frame);
		}
		public function WIN(clear:Boolean = false):void
		{
			if (clear)
			{
				winnerTime = 0;
			}
			else
			{
				winnerTime++;
			}
		}
		
		// ======================================================================================= 全局控制 =====

		private var stages:int = -1;
		// stage的单击事件（2014.7.23晚 改为对话框上的元件）
		private function MainClickEvent(evt:MouseEvent):void
		{
			//trace(mouseX, mouseY);
			TalkBoxEffect();
		}
		// stage的键盘敲击事件
		private function MainPressEvent(evt:KeyboardEvent):void
		{
			//trace(evt.keyCode);
			if (evt.keyCode == 67)
			{
				isCheating = !isCheating;
				if (isCheating)
				{
					trace("开启作弊模式");
				}
				else
				{
					trace("关闭作弊模式");
				}
			}
			else if (evt.keyCode == 65)
			{
				playCard = !playCard;
				if (playCard)
				{
					trace("播放符卡动画");
					menu.at1.text = "开启";
				}
				else
				{
					trace("不播放符卡动画");
					menu.at1.text = "关闭";
				}
			}
			else if (evt.keyCode == 77)
			{
				if (menu.visible)
				{
					stages = 3;
					menu.visible = false;
					return;
				}
			}
			if (stages == -1)
			{
				return;
			}
			else if (evt.keyCode == 32)
			{
				TalkBoxEffect();
			}
			else if (evt.keyCode == 37)
			{
				ClearTalkBox();
				stages = 2;
				H();
				prevFrame();
			}
			else if (evt.keyCode == 39)
			{
				ClearTalkBox();
				stages = 2;
				nextFrame();
			}
			else if (evt.keyCode == 77)
			{
				if (tBox.Menu.visible)
				{		
					stages = -1;
					menu.visible = true;
					//menu.Initialize();
				}
			}
		}

		private function MainWheelEvent(evt:MouseEvent):void
		{
			if (stages != -1)
			{
				if (evt.delta < 0)
				{
					ClearTalkBox();
					stages = 2;
					nextFrame();
				}
				else if (evt.delta > 0)
				{
					ClearTalkBox();
					stages = 2;
					H();
					prevFrame();
				}
			}
		}
		
		private function TalkBoxEffect():void
		{
			switch (stages)
			{
				// 停止响应鼠标事件等
				case -1 :
					break;
				case 0 :
					stages = 1;
					break;
				case 1 :
					ShowTalkBox();
					stages = 2;
					break;
				case 2 :
					ShowTalkBoxAtOnce();
					ShowContentAtOnce();
					stages = 3;
					break;
				case 3 :
					stages = 1;
					nextFrame();
					break;
				default :;
			}
		}

		// ======================================================================================== 对话框 ======
		/*
		 * 对话框元件拥有四个成员：
		 * Name, Content, Menu, Notice
		 */
		public function Say(Name:String = "", Content:String = "", position:int = 0):void
		{
			// 表示不打算显示什么文字，隐藏对话框，清空内容
			if (Name == "" && Content == "")
			{
				ClearTalkBox();
				HideTalkBox();
				return;
			}
			ContentToShow = Content;
			NameToShow = Name;
			if (position == 0)
			{
				position = Img.GetPosition(Name);
			}
			//trace("Say函数测试：当前stages = " + stages.toString());
			if (stages == 0)
			{
				stages = 1;
			}
			if (stages == 1)
			{
				ShowTalkBox();
				ShowContentSlowly();
				ShowCharacter(Name, position, false);
				stages = 2;
				sound.gotoAndStop(2);
				sound.gotoAndStop(1);
			}
			else if (stages == 2)
			{
				ShowContentAtOnce();
				ShowTalkBoxAtOnce();
				ShowCharacter(Name, position, true);
				stages = 3;
			}
		}
		
		private var ContentToShow:String = "";
		private var NameToShow:String = "";
		// 从下方弹出对话框，循环直到完全显示时停止
		public function ShowTalkBox():void
		{
			if (stages == -1)
			{
				return;
				HideTalkBoxAtOnce();
			}
			if (tBox.y <= 275)
			{
				return;
			}
			else
			{
				var timer = new Timer(speed,0);
				timer.addEventListener(TimerEvent.TIMER, ShowingTalkBox);
				timer.start();
			}
		}
		private function ShowingTalkBox(evt:TimerEvent):void
		{
			if (stages == -1)
			{
				HideTalkBoxAtOnce();
				evt.target.stop();
			}
			if (tBox.y - 275 < 1)
			{
				ShowTalkBoxAtOnce();
				evt.target.stop();
			}
			else
			{
				tBox.y += (275 - tBox.y) / 10;
			}
		}
		// 立刻显示对话框
		public function ShowTalkBoxAtOnce():void
		{
			if (stages == -1)
			{
				HideTalkBoxAtOnce();
				return;
			}
			tBox.y = 275;
		}
		
		// 隐藏对话框，循环直到完全消失时停止
		public function HideTalkBox():void
		{
			if (tBox.y >= 455)
			{
				return;
			}
			else
			{
				var timer = new Timer(speed,0);
				timer.addEventListener(TimerEvent.TIMER, HidingTalkBox);
				timer.start();
			}
		}
		private function HidingTalkBox(evt:TimerEvent):void
		{
			if (455 - tBox.y < 1)
			{
				HideTalkBoxAtOnce();
				evt.target.stop();
			}
			else
			{
				tBox.y += (455 - tBox.y) / 10;
			}
		}
		// 立刻隐藏对话框（不附带清空文字的效果）
		public function HideTalkBoxAtOnce():void
		{
			tBox.y = 455;
		}
		// 单纯的清空对话框内容，并且Notice隐藏
		public function ClearTalkBox():void
		{
			tBox.Name.text = "";
			tBox.Content.text = "";
			tBox.Notice.visible = false;
			tBox.Menu.visible = false;
		}
		public function ShowContentAtOnce():void
		{
			ShowName();
			tBox.Content.text += ContentToShow;
			ContentToShow = "";
			tBox.Notice.visible = true;
			tBox.Menu.visible = true;
		}
		public function ShowContentSlowly():void
        {
			if (ContentToShow.length == 0)
			{
				return;
			}
            ClearTalkBox();
			ShowName();
			var talkTimer:Timer = new Timer(speed * 2, 0);
            talkTimer.addEventListener(TimerEvent.TIMER, ShowingContentSlowly);
            talkTimer.start();
        }
		// 根据情况，显示名称
		public function ShowName():void
		{
			if (tBox.Name.text == NameToShow)
			{
			}
			else if (NameToShow == "")
			{
				tBox.Name.text = "";
			}
			else if (NameToShow == "系统提示")
			{
				tBox.Name.text = "系统提示：";
			}
			else
			{
				tBox.Name.text = "【" + NameToShow + "】";
			}
		}
		// 逐字显示文字
		// 每显示一个字，就将需要显示的内容删掉一个字符，跳出条件为需要显示的内容为空
		private function ShowingContentSlowly(evt:TimerEvent):void
		{
			if (ContentToShow.length > 1)
			{
				tBox.Content.appendText(ContentToShow.charAt(0));
				ContentToShow = ContentToShow.substring(1, ContentToShow.length);
			}
			else if(ContentToShow.length == 1)
			{
				tBox.Content.appendText(ContentToShow.charAt(0));
				ContentToShow = "";
			}
			else
			{
				stages = 3;
				evt.target.stop();
				evt.target.removeEventListener(TimerEvent.TIMER, ShowingContentSlowly);
				tBox.Notice.visible = true;
				tBox.Menu.visible = true;
			}
		}
		// ================================================================================= 对话框上的菜单按钮 =======
		private function ShowMenu(evt:MouseEvent):void
		{
			if (tBox.y > 275) return;
			stages = -1;
			menu.visible = true;
			menu.Initialize();
		}
		private function HideMenu(evt:MouseEvent):void
		{
			menu.visible = false;
			stages = 3;
		}
		private function AdjustSpellCard(evt:MouseEvent):void
		{
			playCard = !playCard;
			if (playCard)
			{
				menu.at1.text = "开启";
			}
			else
			{
				menu.at1.text = "关闭";
			}
		}
		// 菜单的拖动
		private function onMenuDrag(evt:MouseEvent):void
		{
			evt.currentTarget.startDrag(false);
		}
		private function offMenuDrag(evt:MouseEvent):void
		{
			evt.currentTarget.stopDrag();
		}
		// 游戏速度的调节
		private function LowSpeed(evt:MouseEvent):void
		{
			speed = 1000 / 45;
			markSpeed = 2.0;
		}
		private function MediumSpeed(evt:MouseEvent):void
		{
			speed = 1000 / 60;
			markSpeed = 2.3;
		}
		private function HighSpeed(evt:MouseEvent):void
		{
			speed = 1000 / 100;
			markSpeed = 2.7;
		}
		
		// ===================================================================================== 人物头像 =======
		/*
		 * 人物头像总共三个，左中右依次为：
		 * char1, char2, char3
		 */
		// position总共三种情况，1左边，2中间，3右边
		// fast为出现的方式，默认为false，即从无渐变到有；1为立刻出现，多用于多人物说话时，头像的移动
		public function ShowCharacter(names:String, position:int = 0, fast:Boolean = false):void
		{
			if (stages == 2) fast = true;
			// 这个玩意相当复杂，主要原因1：角色太多，原因2：与上一款游戏不同，这回可以同时显示三个头像
			if (position == 0)
			{
				position = Img.GetPosition(names);
			}
			CheckDisplayError(names, position);
			
			var frame:int = GetRoleID(names);
			
			if (position == 1)
			{
				if (frame == 1)
				{
					return;
				}
				else
				{
					if (frame == char1.currentFrame && char1.alpha >= 1)
					{
						t1.removeEventListener(TimerEvent.TIMER, HidingC1);
						char1.alpha = 1;
						return;
					}
					char1.alpha = 0;
					char1.gotoAndStop(frame);
					if (!fast)
					{
						t1.removeEventListener(TimerEvent.TIMER, HidingC1);
						t1.addEventListener(TimerEvent.TIMER, ShowingC1);
						t1.start();
					}
					else
					{
						char1.alpha = 1;
						return;
					}
				}
			}
			else if (position == 2)
			{				
				if (frame == 1)
				{
					return;
				}
				else
				{
					if (frame == char2.currentFrame && char2.alpha >= 1)
					{
						t2.removeEventListener(TimerEvent.TIMER, HidingC2);
						char2.alpha = 1;
						return;
					}
					char2.alpha = 0;
					char2.gotoAndStop(frame);
					if (!fast)
					{
						t2.removeEventListener(TimerEvent.TIMER, HidingC2);
						t2.addEventListener(TimerEvent.TIMER, ShowingC2);
						t2.start();
					}
					else
					{
						char2.alpha = 1;
						return;
					}
				}
			}
			else if (position == 3)
			{				
				if (frame == 1)
				{
					return;
				}
				else
				{
					if (frame == char3.currentFrame && char3.alpha >= 1)
					{
						t3.removeEventListener(TimerEvent.TIMER, HidingC3);
						char3.alpha = 1;
						return;
					}
					char3.alpha = 0;
					char3.gotoAndStop(frame);
					if (!fast)
					{
						t3.removeEventListener(TimerEvent.TIMER, HidingC3);
						t3.addEventListener(TimerEvent.TIMER, ShowingC3);
						t3.start();
					}
					else
					{
						char3.alpha = 1;
						return;
					}
				}
			}
		}
		// 这个函数的作用为，不考虑position，强行隐藏指定名称的头像
		public function HideCharacter(names:String, fast:Boolean = false):void
		{
			if (stages == 2) fast = true;
			var frame:int = GetRoleID(names);
			if (char1.currentFrame == frame)
			{
				HideChar(1, fast);
			}
			if (char2.currentFrame == frame)
			{
				HideChar(2, fast);
			}
			if (char3.currentFrame == frame)
			{
				HideChar(3, fast);
			}
		}
		private function GetRoleID(Name:String):int
		{
			return Img.GetID(Name);
		}
		public function HideAllChar(fast:Boolean = false):void
		{			
			if (stages == 2) fast = true;
			if (fast)
			{
				HideChar(0, true);
			}
			else
			{
				HideChar();
			}
		}
		
		private var t1 = new Timer(speed, 0);
		private var t2 = new Timer(speed, 0);
		private var t3 = new Timer(speed, 0);
		// 隐藏某个位置的头像，如果为默认值0，则隐藏全部
		public function HideChar(position:int = 0, fast:Boolean = false):void
		{			
			if (stages == 2) fast = true;
			if (fast)
			{
				if (position == 1)
				{
					char1.alpha = 0;
				}
				else if (position == 2)
				{
					char2.alpha = 0;
				}
				else if (position == 3)
				{
					char3.alpha = 0;
				}
				else if (position == 0)
				{
					char1.alpha = char2.alpha = char3.alpha = 0;
				}
			}
			else
			{					
                if (position == 1)
                {
					t1.removeEventListener(TimerEvent.TIMER, ShowingC1);
                    t1.addEventListener(TimerEvent.TIMER, HidingC1);
                    t1.start();
                }
                else if (position == 2)
                {					
					t2.removeEventListener(TimerEvent.TIMER, ShowingC2);
                    t2.addEventListener(TimerEvent.TIMER, HidingC2);
                    t2.start();
                }
                else if (position == 3)
                {
					t3.removeEventListener(TimerEvent.TIMER, ShowingC3);
                    t3.addEventListener(TimerEvent.TIMER, HidingC3);
                    t3.start();
                }
                else if (position == 0)
                {
					t1.removeEventListener(TimerEvent.TIMER, ShowingC1);
					t2.removeEventListener(TimerEvent.TIMER, ShowingC2);
					t3.removeEventListener(TimerEvent.TIMER, ShowingC3);
                    t1.addEventListener(TimerEvent.TIMER, HidingC1);
                    t2.addEventListener(TimerEvent.TIMER, HidingC2);
                    t3.addEventListener(TimerEvent.TIMER, HidingC3);
                    t1.start();
                    t2.start();
                    t3.start();
                }
			}
		}
		// 关于三个头像的逐渐显示以及逐渐消失
		private function ShowingC1(evt:TimerEvent):void
		{
			if (stages == -1) 
			{
				char1.alpha = 0;
				return;
			}			
			if (char1.alpha >= 1)
			{
				char1.alpha = 1;
				evt.target.stop();
			}
			else
			{
				char1.alpha += 0.04;
			}
		}
		private function HidingC1(evt:TimerEvent):void
		{
			if (char1.alpha <= 0)
			{
				char1.alpha = 0;
				evt.target.stop();
			}
			else
			{
				char1.alpha -= 0.04;
			}
		}
		private function ShowingC2(evt:TimerEvent):void
		{
			if (stages == -1) 
			{
				char2.alpha = 0;
				return;
			}		
			if (char2.alpha >= 1)
			{
				char2.alpha = 1;
				evt.target.stop();
			}
			else
			{
				char2.alpha += 0.04;
			}
		}
		private function HidingC2(evt:TimerEvent):void
		{
			if (char2.alpha <= 0)
			{
				char2.alpha = 0;
				evt.target.stop();
			}
			else
			{
				char2.alpha -= 0.04;
			}
		}
		private function ShowingC3(evt:TimerEvent):void
		{
			if (stages == -1) 
			{
				char3.alpha = 0;
				return;
			}		
			if (char3.alpha >= 1)
			{
				char3.alpha = 1;
				evt.target.stop();
			}
			else
			{
				char3.alpha += 0.04;
			}
		}
		private function HidingC3(evt:TimerEvent):void
		{
			if (char3.alpha <= 0)
			{
				char3.alpha = 0;
				evt.target.stop();
			}
			else
			{
				char3.alpha -= 0.04;
			}
		}
		// 这个函数的作用是，如果发现即将出现的头像已经出现在屏幕中，则将之前已经出现的头像隐藏掉
		private function CheckDisplayError(Name:String, Position:int):void
		{
			var frame:int = GetRoleID(Name);
            if (Position == 1)
            {
                if (char2.currentFrame == frame)
                {
                    HideChar(2, true);
                }
                if (char3.currentFrame == frame)
                {
                    HideChar(3, true);
                }
            }
            else if (Position == 2)
            {
                if (char1.currentFrame == frame)
                {
                    HideChar(1, true);
                }
                if (char3.currentFrame == frame)
                {
                    HideChar(3, true);
                }
            }
            else if (Position == 3)
            {
                if (char1.currentFrame == frame)
                {
                    HideChar(1, true);
                }
                if (char2.currentFrame == frame)
                {
                    HideChar(2, true);
                }
            }
		}
		
		// ======================================================================================= 选择框 =======
		/*
		 * 选择框的所有成员：
		 * 按钮：b1, b2, b3
		 * 文字：t1, t2, t3
		 */
		// 弹出选择框，开始选择
		public function Choose(txt1:String = "", go1:String = "", txt2:String = "", go2:String = "", txt3:String = "", go3:String = ""):void
		{
			if (txt1 == "" && txt2 == "" && txt3 == "")
			{
				//trace(txt1, txt2, txt3);
				return;
			}
			
			ClearChooseBox();
			// 通过goto的值来判断这个按钮是否可用
			goto1 = go1;
			goto2 = go2;
			goto3 = go3;
			
			menu.visible = false;
			stages = -1;
			HideTalkBox();
			HideAllChar();
			ShowChooseBox();
			if (goto1 != "")
			{
				cBox.t1.text = txt1;
				cBox.t1.visible = true;
				cBox.b1.addEventListener(MouseEvent.CLICK, onB1Click);
			}
			if (goto2 != "")
			{
				cBox.t2.text = txt2;
				cBox.t2.visible = true;
				cBox.b2.addEventListener(MouseEvent.CLICK, onB2Click);
			}
			if (goto3 != "")
			{
				cBox.t3.text = txt3;
				cBox.t3.visible = true;
				cBox.b3.addEventListener(MouseEvent.CLICK, onB3Click);
			}
		}
		private var going:String = ""
		private function onB1Click(evt:MouseEvent):void
		{
			if (cBox.alpha < 1) return;
			going = goto1;
			Chosen();
		}
		private function onB2Click(evt:MouseEvent):void
		{
			if (cBox.alpha < 1) return;
			going = goto2;
			Chosen();
		}
		private function onB3Click(evt:MouseEvent):void
		{
			if (cBox.alpha < 1) return;
			going = goto3;
			Chosen();
		}
		// 三个帧标签
		private var goto1:String = "", goto2:String = "", goto3:String = "";
		public function Chosen():void
		{
			try
			{
				cBox.b1.removeEventListener(MouseEvent.CLICK, onB1Click);
				cBox.b2.removeEventListener(MouseEvent.CLICK, onB2Click);
				cBox.b3.removeEventListener(MouseEvent.CLICK, onB3Click);
			}
			catch (err:Error)
			{				
			}
			
			ClearTalkBox();
			HideChooseBox();			
		}
		
		// 清空选择框的所有内容，隐藏选择框
		public function ClearChooseBox():void
		{
			goto1 = goto2 = goto3 = "";
			cBox.visible = false;
			cBox.alpha = 0;
			with (cBox)
			{
				b1.visible = false;
				b2.visible = false;
				b3.visible = false;
				t1.visible = false;
				t2.visible = false;
				t3.visible = false;
				t1.text = "";
				t2.text = "";
				t3.text = "";
			}
		}
		
		// 缓慢显示选择框
		public function ShowChooseBox():void
		{
			if (cBox.alpha >= 1)
			{
				return;
			}
			cBox.visible = true;
			var timer = new Timer(speed, 0);
			timer.addEventListener(TimerEvent.TIMER, ShowingChooseBox);
			timer.start();
		}		
		private function ShowingChooseBox(evt:TimerEvent):void
		{
			if (cBox.alpha < 1)
			{
				cBox.alpha += 0.04;
			}
			else
			{
				cBox.alpha = 1;
				evt.target.stop();
				evt.target.removeEventListener(TimerEvent.TIMER, ShowingChooseBox);
				if (goto1 != "") cBox.b1.visible = true;
				if (goto2 != "") cBox.b2.visible = true;
				if (goto3 != "") cBox.b3.visible = true;
			}
		}
		// 缓慢隐藏选择框（最后会清空内容）
		public function HideChooseBox():void
		{
			if (cBox.alpha <= 0)
			{
				return;
			}
			var timer = new Timer(speed, 0);
			timer.addEventListener(TimerEvent.TIMER, HidingChooseBox);
			timer.start();
		}		
		private function HidingChooseBox(evt:TimerEvent):void
		{
			if (cBox.alpha > 0)
			{
				cBox.alpha -= 0.04;
			}
			else
			{
				cBox.alpha = 0;
				cBox.visible = false;
				evt.target.stop();
				evt.target.removeEventListener(TimerEvent.TIMER, ShowingChooseBox);
				ClearChooseBox();
				//stages = 1;
				if (stages != -1) nextFrame();
								
				stages = 1;
				gotoAndStop(going);
				
			}
		}		

		// ===================================================================================== 特殊功能 =======
		/*
		 * 播放背景音乐
		 */
		private var bgmChannel = new SoundChannel();
		private var soundVolume = new SoundTransform();
		private var currentMusic:String = "";
		public function PlayMusic(soundName:String = "", loop:int = 999):Boolean
		{
			if (currentMusic == soundName)
			{
				return false;
			}
			else
			{
				bgmChannel.stop();
			}
			// 表示用户希望停止音乐
			if (soundName == "")
			{
				currentMusic = "";
				return false;
			}
			var sound = new Sound();
			var Name:String = "Resource/Music/";
			Name +=  soundName + ".mp3";
			try
			{
				sound.load(new URLRequest(Name));
				bgmChannel = sound.play(1, loop);
				currentMusic = soundName;
				bgmChannel.soundTransform = soundVolume;
			}
			catch (err:Error)
			{
				return false;
			}
			return true;
		}
		
		private function SoundLow(evt:MouseEvent):void
		{
			soundVolume.volume = 0.1;
			bgmChannel.soundTransform = soundVolume;
		}
		private function SoundMedium(evt:MouseEvent):void
		{
			soundVolume.volume = 0.55;
			bgmChannel.soundTransform = soundVolume;
		}
		private function SoundHigh(evt:MouseEvent):void
		{
			soundVolume.volume = 1.0;
			bgmChannel.soundTransform = soundVolume;
		}
		/*
		 * 更换背景图片（一般不单独调用，多用于黑屏后的场景切换）
		 */
		private var currentBg:String = "";
		public function Scenes(names:String = ""):void
		{
			// 如果图片重复，则不重复读取
			if (names == currentBg)
			{
				return;
			}
			if (names == "")
			{
				// 表示用户希望不加载任何背景图片
				return;
			}
			try
			{
				currentBg = names;
				bgPic = "Resource/Image/" + names + ".jpg";
				var loader = new Loader();
				var url = new URLRequest(bgPic);
				loader.load(url);
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
				function onComplete(evt:Event):void
				{
					var image = evt.target.content as Bitmap;
					try
					{
						low.removeChildAt(0);
					}
					catch(err:Error) { }
					low.addChild(image);
				}
			}
			catch (err:Error)
			{
				trace(err.message);
				trace("Cannot find the picture: " + url.toString());
				return;
			}
		}
		/*
		 * 用于切换场景前的黑屏，期间使stages = -1，停止响应单击事件
		 */
		private var WaitGotoAndStop:String = "";
		public function Wait(duration:int = 100, bgName:String = "", frame:String = ""):void
		{
			duration /=  3;
			var timer = new Timer(speed,0);
			timer.addEventListener(TimerEvent.TIMER, Waiting);
			bgPic = bgName;
			waitingLoop = 0;
			waitingDuration = duration;
			black.visible = true;
			timer.start();
			
			WaitGotoAndStop = frame;
			
			HideTalkBox();
			HideAllChar();

			stages = -1;
		}
		private var bgPic:String = "";
		private var waitingLoop:int = 0;
		private var waitingDuration:int = 0;
		private function Waiting(evt:TimerEvent):void
		{
			if (waitingLoop == 0)
			{
				black.alpha +=  1.0 / waitingDuration;
				if (black.alpha >= 1)
				{
					waitingLoop = 1;
				}
			}
			else if (waitingLoop == 1)
			{
				Scenes(bgPic);
				waitingLoop = 2;
			}
			else if (waitingLoop == 2)
			{
				if (evt.target.currentCount > waitingDuration * 2)
				{
					waitingLoop = 3;
				}
			}
			else if (waitingLoop == 3)
			{
				black.alpha -=  1.0 / waitingDuration;
				if (black.alpha <= 0)
				{
					waitingLoop = 0;
					black.visible = false;
					evt.target.stop();
					stages = 1;
					if (WaitGotoAndStop == "") nextFrame();
					else gotoAndStop(WaitGotoAndStop);
				}
			}
		}
		// 放在Wait后面，防止多次黑屏，出现BGM错误，背景图片错误等问题
		public function Before():void
		{
			nextFrame();
		}
		
		/*
		 * 屏幕震动（类似地震效果，背景图片、人物图片、对话框全体震动）
		 */
		private var amp:int = 0;
		// duration时长，amplitude振幅,默认数值都是20
		public function Shake(duration:int = 20, amplitude:int = 20):void
		{
			amp = amplitude;
			var timer = new Timer(50, duration);
			timer.addEventListener(TimerEvent.TIMER, Shaking);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, Shaked);
			timer.start();
		}
		private function Shaking(evt:TimerEvent):void
		{
			var X:int = Math.random() * amp - amp / 2;
			var Y:int = Math.random() * amp - amp / 2;
			low.x = medium.x = high.x = X;
			low.y = medium.y = high.y = Y;
		}
		private function Shaked(evt:TimerEvent):void
		{
			low.x = 0;
			low.y = 0;
			medium.x = 0;
			medium.y = 0;
			high.x = 0;
			high.y = 0;
		}
		// 还会添加下雨等动画
		
		// ==================================================================================== 存档系统 ========
		/*
		 * 此段内容较为复杂，因为除了游戏进度，还要存储每一个角色当前的能力开发状况等
		 * 另外，总共五个档位，其中第一个档位是自动存档
		 */
		// 胜利情况，与结局有关
		public var winnerTime:int = 0;
		 
		public var save1 = new Array();
		public var save2 = new Array();
		public var save3 = new Array();
		public var save4 = new Array();
		public var save5 = new Array();
		public var saveArray = new Array(save1, save2, save3, save4, save5);
		
		// 存档函数，-1表示默认，0为false，1为true
        public function SaveGame(Index:int = -1, CurrentFrame:int = -1, WinnerTime:int = -1, Content:String = "",
        xian:int = -1, du:int = -1, wu:int = -1, hu:int = -1, xiong:int = -1,
        zheng:int = -1, erfu:int = -1, bing:int = -1,
		erchong:int = -1, fei:int = -1,
		BGM:String = "", BGP:String = ""):void
		{
			if (Index == -1) Index = 1;
			if (CurrentFrame == -1) CurrentFrame = (this.root as MovieClip).currentFrame;
			if (WinnerTime == -1) WinnerTime = winnerTime;
			if (Content == "")
			{
				Content = tBox.Name.text + tBox.Content.text;
				if (Content.length > 41) Content = Content.slice(0, 41);
			}
			if (xian == -1)
			{
				if (xianqunaoyi) xian = 1;
				else xian = 0;
			}
			if (du == -1)
			{
				if (dushichuanshuo) du = 1;
				else du = 0;
			}
			if (wu == -1)
			{
				if (wushuangxianqun) wu = 1;
				else wu = 0;
			}
			if (hu == -1)
			{
				if (hushenfu) hu = 1;
				else hu = 0;
			}
			if (xiong == -1)
			{
				if (xiongzhen) xiong = 1;
				else xiong = 0;
			}
			if (zheng == -1)
			{
				if (zhengfengchicu) zheng = 1;
				else zheng = 0;
			}
			if (erfu == -1)
			{
				if (erfuliu) erfu = 1;
				else erfu = 0;
			}
			if (bing == -1)
			{
				if (bingjiao) bing = 1;
				else bing = 0;
			}
			if (erchong == -1)
			{
				if (erchongfengyin) erchong = 1;
				else erchong = 0;
			}
			if (fei == -1)
			{
				if (feixing) fei = 1;
				else fei = 0;
			}
			if (BGM == "")
			{
				BGM = currentMusic;
			}
			if (BGP == "")
			{
				BGP = currentBg;
			}
						
			// 开始保存
			saveArray[Index - 1].length = 0;
			saveArray[Index - 1].push(CurrentFrame, WinnerTime, xian, du, wu, hu, xiong, zheng, erfu, bing, erchong, fei, BGM, BGP, Content);
			
			var file = SharedObject.getLocal("ToaruToshiihen", "/");
			file.data.contents = saveArray;
			file.flush();
			
			switch(Index)
			{
				case 1:menu.st1.text = Content; break;
				case 2:menu.st2.text = Content; break;
				case 3:menu.st3.text = Content; break;
				case 4:menu.st4.text = Content; break;
				case 5:menu.st5.text = Content; break;
			}
		}
		
		public function LoadGame(Index:int):void
		{
			// 假设已经成功判断档位的问题等，下面开始读档
			menu.visible = false;
			ClearTalkBox();
			HideAllChar(true);
			stages = 2;
			winnerTime = saveArray[Index - 1][1];
			if (saveArray[Index - 1][2] == 1) xianqunaoyi = true;
			else xianqunaoyi = false;			
			if (saveArray[Index - 1][3] == 1) dushichuanshuo = true;
			else dushichuanshuo = false;
			if (saveArray[Index - 1][4] == 1) wushuangxianqun = true;
			else wushuangxianqun = false;
			if (saveArray[Index - 1][5] == 1) hushenfu = true;
			else hushenfu = false;
			if (saveArray[Index - 1][6] == 1) xiongzhen = true;
			else xiongzhen = false;
			if (saveArray[Index - 1][7] == 1) zhengfengchicu = true;
			else zhengfengchicu = false;
			if (saveArray[Index - 1][8] == 1) erfuliu = true;
			else erfuliu = false;
			if (saveArray[Index - 1][9] == 1) bingjiao = true;
			else bingjiao = false;
			if (saveArray[Index - 1][10] == 1) erchongfengyin = true;
			else erchongfengyin = false;
			if (saveArray[Index - 1][11] == 1) feixing = true;
			else feixing = false;
			
			PlayMusic("");
			PlayMusic(saveArray[Index - 1][12]);
			Scenes(saveArray[Index - 1][13]);
			
			GOTO(saveArray[Index - 1][0]);
		}
		
		public function Saving(evt:MouseEvent):void
		{
			var index:int;
			switch (evt.target.y)
			{
				case 132:
					index = 1; break;
				case 180:
					index = 2; break;
				case 226:
					index = 3; break;
				case 274:
					index = 4; break;
				case 322:
					index = 5; break;
			}
			SaveGame(index);
			menu.UpdateLoadButton();
		}
		public function Loading(evt:MouseEvent):void
		{
			var index:int;
			switch (evt.target.y)
			{
				case 132:
					index = 1; break;
				case 180:
					index = 2; break;
				case 226:
					index = 3; break;
				case 274:
					index = 4; break;
				case 322:
					index = 5; break;
			}
			LoadGame(index);
		}
		public function Deleting(evt:MouseEvent):void
		{			
			var index:int;
			switch (evt.target.y)
			{
				case 132:
					menu.st1.text = "";
					index = 1; break;
				case 180:
					menu.st2.text = "";
					index = 2; break;
				case 226:
					menu.st3.text = "";
					index = 3; break;
				case 274:
					menu.st4.text = "";
					index = 4; break;
				case 322:
					menu.st5.text = "";
					index = 5; break;
			}
			saveArray[index - 1].length = 0;
			menu.UpdateLoadButton();
			
			
			// 外部的缓存也被清除
			var file = SharedObject.getLocal("ToaruToshiihen");
			file.data.contents = saveArray;
		}
		
		public function LoadOutsideSave():void
		{
			// 读取外部文件缓存			
			var file = SharedObject.getLocal("ToaruToshiihen", "/");
			if (file.data.contents != undefined)
			{
				saveArray = file.data.contents;
			}
			else
			{
				return;
			}
			if (saveArray[0].length > 0)
			{
				menu.st1.text = saveArray[0][14];
			}
			if (saveArray[1].length > 0)
			{
				menu.st2.text = saveArray[1][14];
			}
			if (saveArray[2].length > 0)
			{
				menu.st3.text = saveArray[2][14];
			}
			if (saveArray[3].length > 0)
			{
				menu.st4.text = saveArray[3][14];
			}
			if (saveArray[4].length > 0)
			{
				menu.st5.text = saveArray[4][14];
			}
		}
		
		// ==================================================================================== 战斗系统 ========
		/*
		 * 此段内容非常复杂，包含函数众多，注意排版
		 * 这是今天晚上开始写的，傍晚才搞定了前面的全部
		 */
		
		// 以下几个布尔值的作用是，记录诸位主角是否学会了隐藏技能
		private var xianqunaoyi:Boolean = false;
		private var wushuangxianqun:Boolean = false;
		private var dushichuanshuo:Boolean = false;
		private var zhengfengchicu:Boolean = false;
		private var erfuliu:Boolean = false;
		private var erchongfengyin:Boolean = false;
		// 主角组的特殊属性
		private var hushenfu:Boolean = false;
		private var xiongzhen:Boolean = false;
		private var bingjiao:Boolean = false;
		private var feixing:Boolean = false;
		// 是否播放符卡动画
		public var playCard:Boolean = true;
		// 战斗胜利或者失败后的跳转
		public var shibai:String, shengli:String;
		// 游戏作弊
		public var isCheating:Boolean = false;
		 
		public var isMoving:Boolean = true;// 进度条是否在移动
		public var isSelecting:Boolean = false;// 是否能够开始选择敌人
		private var currentSkill:String = "";// 当前选择的技能
		private var currentHero:int;// 当前释放招数的角色
		private var currentEnemy:int;// 当前选择的攻击对象
		
		public var skill = new Skill();
		
		private var rHero1:Role, rHero2:Role, rHero3:Role, rHero4:Role, rHero5:Role, rHero6:Role;
		private var heroArray = new Array(rHero1, rHero2, rHero3, rHero4, rHero5, rHero6);
		// 开始战斗（frame1战斗设定，frame2胜利，frame3失败）
		public function StartWar(frame1:String,frame2:String, frame3:String, scenes:String):void
		{
			// 停止当前音乐
			PlayMusic();
			stages = -1;
			// 隐藏所有窗口
			HideAllChar();
			HideChooseBox();
			HideTalkBoxAtOnce();
			menu.visible = false;
			
			stages = -1;
			
			// 帧标签
			shengli = frame2;
			shibai = frame3;
			
			// 所有位置清空
			p1 = p2 = p3 = p4 = p5 = p6 = false;
			// 所有标志清空
			for (var i:int = 0; i < 6; i++)
			{
				markArray[i].visible = false;
				markArray[i].x = 415;
				// 所有角色清空
				heroArray[i] = null;
				pArray[i] = false;
			}
			mark1.y = mark2.y = mark3.y = 12;
			mark4.y = mark5.y = mark6.y = 64;
			cMark.visible = false;
			
			// 播放战斗开始的动画
			PlayBattleMovie(frame1, scenes);
		}
		
		public function EndWar():void
		{			
			var i:int;
			isMoving = false;
			isSelecting = false;
			// 所有位置清空
			p1 = p2 = p3 = p4 = p5 = p6 = false;
			// 所有标志清空
			for (i = 0; i < 6; i++)
			{
				markArray[i].visible = false;
				markArray[i].x = 415;
				// 所有角色清空
				heroArray[i] = null;
			}
			mark1.y = mark2.y = mark3.y = 12;
			mark4.y = mark5.y = mark6.y = 64;
			cMark.visible = false;
			pBar.visible = false;
			
			fBox.visible = false;
			for (i = 0; i < 3; i++)
			{
				enemyArray[i].visible = false;
			}
			for (i = 0; i < 6; i++)
			{
				heroArray[i] = null;
			}
			
			// 重新显示对话框
			tBox.visible = true;
		}
		
		private function PlayBattleMovie(frame:String, scenes:String):void
		{
			stages = -1;
			
			battleStartMovie.gotoAndPlay(1);
			battleStartMovie.visible = true;
			
			setTimeout(PlayingBattleMovie, battleStartMovie.totalFrames * 1000 / 60);
			setTimeout(ChangeScene, battleStartMovie.totalFrames / 2 * 1000 / 60);
			
			function PlayingBattleMovie():void
			{
				// 作者表示前面的对话框设计的不是很合理，导致这里可能会出问题，于是被迫如此
				stages = -1;
				HideTalkBoxAtOnce();
				// 将对话框隐藏掉
				tBox.visible = false;
				
				gotoAndStop(frame);
				battleStartMovie.visible = false;
				fBox.visible = true;
				pBar.visible = true;
				
				UpdatePlayerBox();
				MoveMark();
			}
			
			function ChangeScene():void
			{
				// 强制隐藏不该显示的窗口
				stages = -1;
				HideChar(0, true);
				HideChooseBox();
				HideTalkBoxAtOnce();
				stages = -1;
				Scenes(scenes);
			}
		}
		
		// 调整我方状态栏
		public function SetPlayer(st:Boolean = true, gs:Boolean = false, hr:Boolean = false):void
        {
            if (st)
            {
                pArray[0] = true;
                markArray[0].visible = true;
                heroArray[0] = new Role("佐天泪子", 1);
				heroArray[0].Sp1 = hushenfu;
				heroArray[0].Sp2 = xiongzhen;
            }
            else
            {
                pArray[0] = false;
                markArray[0].visible = false;
            }
            if (gs)
            {
                pArray[1] = true;
                markArray[1].visible = true;
                heroArray[1] = new Role("我妻由乃", 2);
				heroArray[1].Sp1 = bingjiao;
            }
            else
            {
                pArray[1] = false;
                markArray[1].visible = false;
            }
            if (hr)
            {
                pArray[2] = true;
                markArray[2].visible = true;
                heroArray[2] = new Role("博丽灵梦", 3);
				heroArray[2].Sp1 = feixing;
            }
            else
            {
                pArray[2] = false;
                markArray[2].visible = false;
            }
			fBox.SetPlayer(st, gs, hr);
        }
		// 更新全部状态显示，判断输赢。返回值如果为true，则表示有任意一方全体阵亡
		public function UpdatePlayerInfo():Boolean
		{
			UpdatePlayerBox();
						
			var i:int = 0;
			var total:int = 0;
			var current:int = 0;
			// 判断我方是否全挂
			for (i = 0; i < 3; i++)
			{
				if (heroArray[i] != null)
				{
					total++;
					if (heroArray[i].HP <= 0)
					{
						current++;
					}
				}
			}
			//trace(current, total);
			// 此处只判断我方失败（因为敌方失败需要有消失动画，此处立刻判断的效果不好）
			if (current == total)
			{
				Fail();
				return true;
			}
			
			UpdateEnemyInfo();
			for (i = 3; i < 6; i++)
			{
				if (heroArray[i] != null)
					break;
			}
			if (i == 6) 
			{
				//Succeed();
				return true;
			}
			
			CheckAlive();
			return false;
		}
		
		// 战斗胜利
		public function Succeed():void
		{
			fBox.addEventListener(Event.ENTER_FRAME, HideFightBox);
			PlayEndWarMovie(true);
		}
		// 战斗失败
		public function Fail():void
		{
			EndWar();
			fBox.addEventListener(Event.ENTER_FRAME, HideFightBox);
			PlayEndWarMovie(false);
		}
		
		// 战斗胜利或者失败后，播放动画
		private function PlayEndWarMovie(Win:Boolean):void
		{
			warEnd.visible = true;
			if (Win)
			{
				warEnd.gotoAndPlay("胜利");
				PlayMusic("胜利", 1);
			}
			else
			{
				warEnd.gotoAndPlay("失败");
				PlayMusic("失败", 1);
			}
			BattleResult = Win;
			setTimeout(SetEndWarEventListener, (warEnd.totalFrames -1) / 2 * 1000 / 60);
			EndWar();
		}
		private var BattleResult:Boolean;
		private function SetEndWarEventListener():void
		{
			warEnd.addEventListener(MouseEvent.CLICK, onEndWarClick);
		}
		private function onEndWarClick(evt:MouseEvent):void
		{
			warEnd.removeEventListener(MouseEvent.CLICK, onEndWarClick);
			warEnd.visible = false;
			warEnd.gotoAndStop(1);
			if (BattleResult)
			{
				gotoAndStop(shengli);
			}
			else
			{
				gotoAndStop(shibai);
			}
		}
		
		// 更新场上角色信息，将挂掉的敌人变为null
		public function UpdatePlayerBox():void
		{
			// 我方状态栏共以下内容：
			// 三张图片，分别是stImage, gsImage, hrImage
			// 三个血条，三个法条，分别是stHP，stMP……等
			// 每一个条都有内部的函数，Set(current:Number, total:Number)，SetValue(current:Number, total:Number)
			
			// 首先，更新场上显示
			for (var i:int = 0; i < 3; i++)
			{
                if (heroArray[i] == null)
                {
                    if (i == 0)
                    {   
                        fBox.stImage.visible = false;
                        fBox.stHP.visible = false;
                        fBox.stMP.visible = false;
                    }
                    if (i == 1) 
                    {
                        fBox.gsImage.visible = false;
                        fBox.gsHP.visible = false;
                        fBox.gsMP.visible = false;
                    }
                    if (i == 2) 
                    {
                        fBox.hrImage.visible = false;
                        fBox.hrHP.visible = false;
                        fBox.hrMP.visible = false;
                    }                    
                }
				else
				{
					if (heroArray[i].HP <= 0)
					{
						pArray[i] = false;
						heroArray[i].ClearCondition();
						heroArray[i].ClearStrengthen();
						if (i == 0) fBox.stImage.alpha = 0.5;
						else if (i == 1) fBox.gsImage.alpha = 0.5;
						else if (i == 2) fBox.hrImage.alpha = 0.5;
					}
					else
					{
						pArray[i] = true;
						if (i == 0) fBox.stImage.alpha = 1;
						else if (i == 1) fBox.gsImage.alpha = 1;
						else if (i == 2) fBox.hrImage.alpha = 1;
					}
                    if (i == 0)
                    {   
                        fBox.stHP.Set(heroArray[0].HP, heroArray[0].HPmax);
                        fBox.stHP.SetValue(heroArray[0].HP, heroArray[0].HPmax);
                        fBox.stMP.Set(heroArray[0].MP, heroArray[0].MPmax);
                        fBox.stMP.SetValue(heroArray[0].MP, heroArray[0].MPmax);
                    }
                    if (i == 1) 
                    {
                        fBox.gsHP.Set(heroArray[1].HP, heroArray[1].HPmax);
                        fBox.gsHP.SetValue(heroArray[1].HP, heroArray[1].HPmax);
                        fBox.gsMP.Set(heroArray[1].MP, heroArray[1].MPmax);
                        fBox.gsMP.SetValue(heroArray[1].MP, heroArray[1].MPmax);
                    }
                    if (i == 2) 
                    {
                        fBox.hrHP.Set(heroArray[2].HP, heroArray[2].HPmax);
                        fBox.hrHP.SetValue(heroArray[2].HP, heroArray[2].HPmax);
                        fBox.hrMP.Set(heroArray[2].MP, heroArray[2].MPmax);
                        fBox.hrMP.SetValue(heroArray[2].MP, heroArray[2].MPmax);
                    }
				}
			}
		}
		public function UpdateEnemyInfo():void
		{
			for (var i:int = 3; i < 6; i++)
			{
				if (heroArray[i] == null)
				{
					continue;
				}
				if (heroArray[i].HP <= 0)
				{
					heroArray[i] = null;
					
					markArray[i].visible = false;
					markArray[i].x = 415;
					pArray[i] = false;
					
					enemyArray[i - 3].removeEventListener(Event.ENTER_FRAME, ShowEnemyImg);
					enemyArray[i - 3].addEventListener(Event.ENTER_FRAME, HideEnemyImg);
				}
			}
		}
		// 缓慢隐藏或显示敌人立绘
		private function HideEnemyImg(evt:Event):void
		{
			if (evt.currentTarget.alpha > 0)
			{
				evt.currentTarget.alpha -= 0.02;
			}
			else
			{
				evt.currentTarget.visible = false;
				evt.currentTarget.alpha = 1;
				evt.currentTarget.removeEventListener(Event.ENTER_FRAME, HideEnemyImg);
				
				// 判断敌人是否全挂的动画在这里		
				var i:int;
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] != null)
						break;
				}
				if (i == 6) 
				{
					Succeed();
				}
			}
		}
		private function ShowEnemyImg(evt:Event):void
		{
			if (evt.currentTarget.alpha < 1)
			{
				evt.currentTarget.alpha += 0.03;
			}
			else
			{
				evt.currentTarget.alpha = 1;
				evt.currentTarget.removeEventListener(Event.ENTER_FRAME, ShowEnemyImg);
			}
		}
		
		// 每个位置是否有人（与mark是否移动有关）
		private var p1:Boolean, p2:Boolean, p3:Boolean, p4:Boolean, p5:Boolean, p6:Boolean;
		private var pArray = new Array(p1, p2, p3, p4, p5, p6);
		// 添加新敌人
		public function AddEnemy(Name:String, Position:int = 5,
		hp:int = 0, attack:int = 0, defence:int = 0, magic:int = 0, speed:int = 0, luck:int = 0):void
		{
			Position--;
			pArray[Position] = true;
			markArray[Position].visible = true;
			heroArray[Position] = new Role(Name, Position + 1);
			markArray[Position].gotoAndStop(heroArray[Position].GetFrame());
			enemyArray[Position - 3].visible = true;
			enemyArray[Position - 3].gotoAndStop(heroArray[Position].GetFrame());
			enemyArray[Position - 3].alpha = 0;
			// 防止出现正好处于消失与出现的冲突中
			enemyArray[Position - 3].removeEventListener(Event.ENTER_FRAME, HideEnemyImg);
			enemyArray[Position - 3].addEventListener(Event.ENTER_FRAME, ShowEnemyImg);
			// 根据需要，临时创建能力值较特殊的敌人
			if (hp > 0) heroArray[Position].HP = heroArray[Position].HPmax = hp;
			if (attack > 0) heroArray[Position].Attack = attack;
			if (defence > 0) heroArray[Position].Defence = defence;
			if (magic > 0) heroArray[Position].Magic = magic;
			if (speed > 0) heroArray[Position].Speed = speed;
			if (luck > 0) heroArray[Position].Luck = luck;
		}
		
		// 回合结束，更新场上的情况，跟p1~p6有关（这函数貌似完全没用）
		public function CheckAlive():void
		{
			// 只有null才当做消失，我方HP<0还可以救活，敌人则会在攻击之后对HP进行判断
			for (var i:int = 0; i < 6; i++)
			{
				// 只要是null，一定是对应位置没有人
				if (heroArray[i] == null)
				{
					pArray[i] = false;
				}
				else if (heroArray[i].HP > 0 && !markArray[i].visible)
				{
					pArray[i] = true;
					markArray[i].visible = true;
					markArray[i].x = 415;
				}
			}
		}
		
		// 损血的动画（出现位置已经调整）
		public function SubsHP(number:int, position:int, color:String = "红", isCritical:Boolean = false):void
		{
			var txt = new TextField();
			var textf:TextFormat = new TextFormat;
			if (isCritical)
			{
				textf.size = 35;
			}
			else
			{
				textf.size = 28;
			}
			textf.align = TextFieldAutoSize.LEFT;
			textf.bold = true;
			txt.height = 50;
			txt.width = 500;
			if (color == "红")
			{
				txt.textColor = 0xFF0000;
			}
			else if (color == "绿")
			{
				txt.textColor = 0x009933;
			}
			else if (color == "蓝")
			{
				txt.textColor = 0x0000FF;
			}
			else if (color == "黄")
			{
				txt.textColor = 0xFFFF00;
			}
			txt.multiline = false;
			txt.wordWrap = false;
			txt.selectable = false;
			txt.defaultTextFormat = textf;
			
			if (number > 0) txt.text = "+ " + number.toString();
			else if (number < 0) txt.text = number.toString();
			else txt.text = "Miss";
			if (isCritical && number != 0)
			{
				txt.appendText("  Critical!");
			}			
			
			txt.x = 50;
			txt.y = 200;

			switch (position)
            {
                case 1 :
                    txt.x = 355;
                    txt.y = 213;
                    break;
                case 2 :
                    txt.x = 515;
                    txt.y = 213;
                    break;
                case 3 :
                    txt.x = 676;
                    txt.y = 213;
                    break;
                case 4 :
                    txt.x = 43;
                    txt.y = 194;
                    break;
                case 5 :
                    txt.x = 169;
                    txt.y = 90;
                    break;
                case 6 :
                    txt.x = 318;
                    txt.y = 19;
                    break;
            }

            high.addChild(txt);

			var timer = new Timer(25, speed * 2.5);
			timer.addEventListener(TimerEvent.TIMER, MoveHP);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, MoveHPend);
			timer.start();
			function MoveHP(evt:TimerEvent)
			{
				txt.y -= 1.5;
				txt.alpha -= 0.01;
			}
			function MoveHPend(evt:TimerEvent)
			{
				high.removeChild(txt);
				txt = null;
			}
		}
		
		// 人物标志移动动画
		public function MoveMark():void
		{
			// 无条件隐藏不应该出现的窗口
			eBox.visible = false;
			sBox.visible = false;
			cMark.visible = false;
			
			var timer = new Timer(speed, 0);
			timer.addEventListener(TimerEvent.TIMER, MovingMark);
			timer.start();
		}
		private function MovingMark(evt:TimerEvent):void
		{
			var i:int;
			for (i = 0; i < 6; i++)
			{
				if (markArray[i].x >= 765 && markArray[i].visible && heroArray[i] != null)
				{
					evt.target.stop();
					MarkEnd(i + 1);
					return;
				}
			}
			
			for (i = 0; i < 6; i++)
			{
				if (pArray[i] && heroArray[i] != null)
				{
					markArray[i].x += markSpeed * heroArray[i].SP / GetHighestSpeed();
				}
				else
				{
					markArray[i].x = 415;
					markArray[i].visible = false;
				}
			}
		}
		private function MarkEnd(Position:int):void
		{
			isMoving = false;
			
			// 不写这个把坐标返回765目的是不让Mark到头后晃动返回，效果不好
			//markArray[Position - 1].x = 765;
			cMark.visible = true;
			cMark.gotoAndStop(heroArray[Position - 1].GetFrame());
						
			BeforeAction(Position);
		}
		// 轮到某个角色开始行动
		private function BeforeAction(Position:int):void
		{
			var damageByPoison:int;
			
			currentHero = Position;	
			heroArray[currentHero - 1].ReduceDefence();
			
			// 判断是否中毒
			damageByPoison = heroArray[currentHero - 1].DamageByPoison();
			if (damageByPoison > 0)
			{
				SubsHP( -damageByPoison, currentHero, "绿");				
				if (UpdatePlayerInfo())
				{
					// 呼叫一个游戏结束的函数
					return;
				}
				else
				{
					UpdatePlayerBox();
					setTimeout(Action, speed * 60);
					return;
				}
			}
			else
			{
				// 防御状态降低
				Action();
			}
		}
		
		private function Action():void
		{		
			var i:int;
			// 如果因为事先的中毒情况直接挂掉了，则跳过
			if (heroArray[currentHero - 1] == null)
			{
				AfterAction();
				return;
			}
			else if (heroArray[currentHero - 1].HP <= 0)
			{
				AfterAction();
				return;
			}
			// 如果为作弊模式，则我方人员全体回复HP、MP
			if (isCheating)
			{
				for (i = 0; i < 3; i++)
				{
					if (heroArray[i] != null)
					{
						heroArray[i].ChangeHP(9999);
						heroArray[i].ChangeMP(9999);
						heroArray[i].ClearBadCondition();
					}
				}
			}
			// 如果状态为眩晕，则跳过回合，但是会根据情况补充HP或MP
			if (heroArray[currentHero - 1].Giddy > 0)
			{				
				heroArray[currentHero - 1].AddHPMP();
				UpdatePlayerBox();
				
				setTimeout(AfterAction, 1000);
				return;
			}
			// 如果状态为混乱,则通过AI获取其最普通的攻击技能,随机选择目标进行攻击
			if (heroArray[currentHero - 1].Chaos > 0)
			{
				currentSkill = heroArray[currentHero - 1].AI(heroArray[3], heroArray[4], heroArray[5]);
				if (currentSkill != "防御") currentEnemy = RandomChoose(2);
				else currentEnemy = currentHero;
				SkillFunction(currentEnemy);
				return;
			}
			if (currentHero < 4)
			{
				// 自动回复MP的动画取消
				heroArray[currentHero - 1].AddHPMP();
				UpdatePlayerBox();
			
				// 我方阶段
				isSelecting = false;
				sBox.visible = true;
				if (currentHero == 1)
				{					
					if (!isCheating) sBox.SetInfo(heroArray[0], xianqunaoyi, wushuangxianqun, dushichuanshuo);
					else sBox.SetInfo(heroArray[0], true, true, true);
				}
				else if (currentHero == 2)
				{					
					if (!isCheating) sBox.SetInfo(heroArray[1], zhengfengchicu, erfuliu);
					else sBox.SetInfo(heroArray[1], true, true);
				}
				else if (currentHero == 3)
				{					
					if (!isCheating) sBox.SetInfo(heroArray[2], erchongfengyin);
					else sBox.SetInfo(heroArray[2], true);
				}
			}
			else
			{				
				if (heroArray[currentHero - 1].HP <= 0)
				{
					AfterAction();
				}
				// 敌方阶段
				currentSkill = heroArray[currentHero - 1].AI(heroArray[3], heroArray[4], heroArray[5]);
				var range:int = skill.GetSkillRange(currentSkill);
				if (range == 0)
				{
					currentEnemy = currentHero;
				}
				else if (range == 1)
				{
					currentEnemy = currentHero;
				}
				// 攻击我方单人
				else if (range == 2)
				{
					currentEnemy = RandomChoose();
					// 最好有一个判断，看RandomChoose是否为0
				}
				// 攻击敌方全体
				else if (range == 3)
				{
					currentEnemy = 5;
				}
				// 攻击我方全体
				else if (range == 4)
				{
					// 动画出现在我方第二个人的位置
					currentEnemy = 2;
				}
				SkillFunction(currentEnemy);
			}
		}
		
		// 任意选取我方一个角色作为攻击目标（0我方任意一人，1敌方任意一人，2全场任意一人）
		private function RandomChoose(Objects:int = 0):int
		{
			var person:int = 0;
			var i:int = 0;
			var list = new Array();
			var vvv:int;
			if (Objects == 0)
			{
				for (i = 0; i < 3; i++)
				{
					if (heroArray[i] != null)
					{
						if (heroArray[i].HP > 0)
						{
							person++;
							list.push(heroArray[i].Position);
						}
					}
				}
				vvv = Math.floor(Math.random() * list.length);
				if (list.length > 0)
					return list[vvv];
			}
			else if (Objects == 1)
			{
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] != null)
					{
						if (heroArray[i].HP > 0)
						{
							person++;
							list.push(heroArray[i].Position);
						}
					}
				}
				vvv = Math.floor(Math.random() * list.length);
				if (list.length > 0)
					return list[vvv];
			}
			else if (Objects == 2)
			{				
				for (i = 0; i < 6; i++)
				{
					if (heroArray[i] != null)
					{
						if (heroArray[i].HP > 0)
						{
							person++;
							list.push(heroArray[i].Position);
						}
					}
				}
				vvv = Math.floor(Math.random() * list.length);
				if (list.length > 0)
					return list[vvv];
			}
			return 0;
		}
		// 角色行动完毕，头像回到左边
		private function AfterAction():void
		{			
			// 减少所有状态指数
			if (heroArray[currentHero - 1] != null)
				heroArray[currentHero - 1].ReduceCondition();
			
			//// 作者表示思路有些混乱，只好在这里再度判断一下场上情况
			//if (UpdatePlayerInfo())
			//{
				//return;
			//}
				
			// 技能动画强制隐藏
			var i:int;
			for (i = 0; i < 6; i++)
			{
				filmArray[i].visible = false;
			}
			
			cMark.visible = false;
			for (i = 0; i < 6; i++)
			{
				if (markArray[i].x >= 765)
				{
					// 防御状态不是从头开始
					if (currentSkill == "防御")
					{
						markArray[i].x = 500;
					}
					else
					{
						markArray[i].x = 415;
					}
					break;
				}
			}
			
			//// 技能释放后，更新我方信息显示，并且再度检查场上胜负情况
			//if (UpdatePlayerInfo())
			//{
				//return;
			//}
			
			isMoving = true;
			MoveMark();
		}
		private var markSpeed:Number = 2.25;
		
		// 获取最大速度
		private function GetHighestSpeed():int
		{
			var temp:int = 0;
			for (var i:int = 0; i < 6; i++)
			{
				if (pArray[i] && heroArray[i] != null)
				{
					if (heroArray[i].SP > temp) temp = heroArray[i].SP;
				}
			}
			return temp;
		}
		
		// 敌人形象通过鼠标滑过事件而放大缩小
        private function onMouseRollInScale(evt:MouseEvent):void
        {
			// 如果进度条正在移动，则甚至不能缩放头像
			if (isMoving || !isSelecting)
				return;
				
            evt.currentTarget.scaleX = 1.05;
            evt.currentTarget.scaleY = 1.05;
            
            if (evt.currentTarget.x == -6)
            {
                ShowConditionBox(heroArray[3]);
            }
            else if (evt.currentTarget.x == 131)
            {
                ShowConditionBox(heroArray[4]);
            }
            else if (evt.currentTarget.x == 257)
            {
                ShowConditionBox(heroArray[5]);
            }
            else if (evt.currentTarget.x == 425.25)
            {
                ShowConditionBox(heroArray[0]);
            }
            else if (evt.currentTarget.x == 567.85)
            {
                ShowConditionBox(heroArray[1]);
            }
            else if (evt.currentTarget.x == 739.65)
            {
                ShowConditionBox(heroArray[2]);
            }
			else
			{
				//trace(evt.currentTarget.x);
			}
        }
        private function onMouseRollOutScale(evt:MouseEvent):void
        {
            evt.currentTarget.scaleX = 1;
            evt.currentTarget.scaleY = 1;
            HideConditionBox();
        }
		
		// 单击敌人形象，选取目标
		private function onMouseClick(evt:MouseEvent):void
		{			
			if (isMoving || !isSelecting)
			{
				// 如果进度条正在运行，则无任何意义
				return;
			}
			switch (evt.currentTarget.x)
			{
				case -6: currentEnemy = 4; break;
				case 131: currentEnemy = 5; break;
				case 257: currentEnemy = 6; break;
				case 425.25: currentEnemy = 1; break;
				case 567.85: currentEnemy = 2; break;
				case 739.65: currentEnemy = 3; break;
			}
			var range:int = skill.GetSkillRange(currentSkill);
			// range=1，攻击敌方单人
			if (range == 1 && currentEnemy < 4)
			{
				return;
			}
			// range=2，攻击我方单人
			if (range == 2 && currentEnemy > 3)
			{
				return;
			}
			// 特殊技能不能选择某些人
			if (currentSkill == "复活同伴")
			{
				//if (currentEnemy == currentHero)
				if (evt.currentTarget.alpha == 1)
				{
					return;
				}
			}
			SkillFunction(currentEnemy);
		}
		
		// 技能效果的实现（position = 0表示攻击全体）
		public function SkillFunction(Position:int = 0):void
		{
			var i:int;
			var ttt:int;
			isSelecting = false;
			
			// 没搞懂为啥这里要加一句这个
			if (UpdatePlayerInfo())
			{
				return;
			}
			else
			{
				// 特殊技能在此处进行判断
				if (currentSkill == "生命回复")
				{
					for (i = 3; i < 6; i++)
					{
						if (i + 1 != currentHero && heroArray[i] != null)
						{
							if (heroArray[i].HP < heroArray[i].HPmax * 0.5)
							{
								currentEnemy = i + 1;
								//trace(heroArray[i].HP, heroArray[i].HPmax, currentEnemy);
								break;
							}
						}
					}
					if (i == 6)
					{
						currentEnemy = currentHero;
					}
				}
				// 符卡效果
				ShowSpellCard(currentSkill);
			}		
		}
		// 在指定的时间指定的位置显示相应的减血动画，另外招数的扣血结果等也在此。所有技能的特殊效果都写在这里
		private function CauseEffect():void
		{
			var i:int = 0;
			var hhh:int;// 血量
			var dhhh:int;// 我方由于发招所损失的血量
			var mmm:int = skill.GetSkillMP(currentSkill);// 消耗气量
			var ccc:Boolean;// 爆机
			var nnn:int;// 临时变量
			var range:int = skill.GetSkillRange(currentSkill);
			
			if (currentSkill == "防御")
			{
				// 因为扣除状态值是在AfterAction里面，所以这里需要是2
				// 准确的说，这里的BUFF如果是给自己，则都需要在原有基础上+1
				heroArray[currentHero - 1].Defencing = 1;
				mmm = 0;
			}
			else if (currentSkill == "漆黑之盾")
			{
				heroArray[currentHero - 1].Defencing = 2;
			}
			else if (currentSkill == "火神之盾")
			{
				hhh = 100;
				heroArray[currentHero - 1].Defencing = 1;
				SubsHP(hhh, currentEnemy, "黄");
				heroArray[currentEnemy - 1].ChangeHP(hhh);
			}
			else if (currentSkill == "休息")
			{	
				// 我方休息
				if (currentHero < 4)
				{
					hhh = 350;
					heroArray[currentHero - 1].ChangeHP(hhh);
				}
				// 敌方休息
				else hhh = heroArray[currentHero - 1].AddHPRatio(0.15);
				SubsHP(hhh, currentHero, "黄");
				mmm = heroArray[currentHero - 1].MPmax * 0.2;
			}
			else if (currentSkill == "复活同伴")
			{
				hhh = heroArray[currentEnemy - 1].AddHPRatio(0.4);
				pArray[currentEnemy - 1] = true;
				SubsHP(hhh, currentEnemy, "黄");
				mmm = heroArray[currentHero - 1].MPmax * 0.5;
			}
			else if (currentSkill == "幻想御手")
			{
				hhh = 750;
				mmm = 350;
				SubsHP(hhh, currentEnemy, "黄");
				heroArray[currentEnemy - 1].ChangeHP(750);
				heroArray[currentEnemy - 1].dAttack = 3;
				heroArray[currentEnemy - 1].dLuck = 3;
			}
			else if (currentSkill == "召唤妹妹")
			{
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] == null)
					{
						AddEnemy("御坂妹妹", i + 1);
						break;
					}
				}
			}
			else if (currentSkill == "生命回复")
			{
				hhh = heroArray[currentEnemy - 1].AddHPRatio(0.2);
				SubsHP(hhh, currentEnemy, "黄");
				
			}
			else if (currentSkill == "并肩作战")
			{
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] != null)
					{
						heroArray[i].dAttack = 3;
						heroArray[i].dDefence = 3;
						heroArray[i].dLuck = 3;
						heroArray[i].dSpeed = 3;
					}
				}
			}
			else if (currentSkill == "飞行能力")
			{
				for (i = 0; i < 3; i++)
				{
					if (heroArray[i] != null)
					{
						if (heroArray[i].HP > 0)
						{
							heroArray[i].dSpeed = 3;
						}
					}
				}
				
			}
			else if (currentSkill == "梦想天生")
			{
				hhh = 700;
				for (i = 0; i < 3; i++)
				{
					if (heroArray[i] != null)
					{
						if (heroArray[i].HP > 0)
						{
							heroArray[i].ChangeHP(hhh);
							heroArray[i].ClearBadCondition();
							SubsHP(hhh, i + 1, "黄");
						}
					}
				}
				// 使用过后，施法者速度降低三回合
				// 由于发招过后，进入AfterAction才减少异常指数，所以在此处dSpeed = -2;
				heroArray[currentHero - 1].dSpeed = -2;
			}
			else if (currentSkill == "一之弹")
			{
				heroArray[currentEnemy - 1].dSpeed = 3;
			}
			else if (currentSkill == "四之弹")
			{
				hhh = heroArray[currentHero - 1].AddHPRatio(0.2);
				SubsHP(hhh, currentHero, "黄");
			}
			else if (currentSkill == "八之弹")
			{
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] == null)
					{
						AddEnemy("时崎狂三", i + 1, 7500, 300, 320, 300, 280, 300);
						break;
					}
				}
			}
			else if (currentSkill == "百合之魂")
			{		
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] != null)
					{		
						heroArray[i].ClearBadCondition();
						heroArray[i].dAttack = 3;
						heroArray[i].dDefence = 3;
						heroArray[i].dMagic = 3;
						if (!heroArray[i].Gender)
						{
							hhh = heroArray[i].AddHPRatio(0.075);
							SubsHP(hhh, i + 1, "黄");
						}
					}
				}
			}
			else if (currentSkill == "凉宫春日的叹息")
			{
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] != null)
					{
						if (heroArray[i].Name == "凉宫春日") hhh = heroArray[i].AddHPRatio(0.1);
						else hhh = heroArray[i].AddHPRatio(0.075);
						SubsHP(hhh, i + 1, "黄");
						mmm = heroArray[i].MPmax * 0.2;
					}
				}
			}
			else if (currentSkill == "凉宫春日的阴谋")
			{
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] != null)
					{
						heroArray[i].dAttack = 3;
						heroArray[i].dDefence = 3;
						heroArray[i].dSpeed = 1;
					}
				}
			}
			else if (currentSkill == "凉宫春日的愤慨")
			{
				heroArray[currentHero - 1].Defencing = 3;
			}
			else if (currentSkill == "凉宫春日的分裂")
			{
				var type:int = Math.floor(Math.random() * 100);
				var enemy:String = "";
				if (type < 5) 
				{
					enemy = "胖虎";
				}
				else if (type < 10)
				{
					enemy = "小鸟游六花";
				}
				else if (type < 15)
				{
					enemy = "七宫智音";
				}
				else if (type < 20)
				{
					enemy = "御坂妹妹";
				}
				else if (type < 30)
				{
					enemy = "最后之作";
				}
				else if (type < 40)
				{
					enemy = "桐人";
				}
				else if (type < 50)
				{
					enemy = "亚丝娜";
				}
				else if (type < 60)
				{
					enemy = "栗山未来";
				}
				else if (type < 70)
				{
					enemy = "时崎狂三";
				}
				else if (type < 80)
				{
					enemy = "奈亚子";
				}
				else if (type < 90)
				{
					enemy = "克子";
				}
				else if (type < 100)
				{
					enemy = "哈斯塔";
				}
				
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] == null)
					{
						AddEnemy(enemy, i + 1, 6000);
						break;
					}
				}
			}
			else if (range == 1 || range == 2)
			{
				//trace(currentEnemy);
				hhh = -heroArray[currentHero - 1].GetDamage(currentSkill, heroArray[currentEnemy - 1]);
				ccc = heroArray[currentHero - 1].GetCritical(currentSkill, heroArray[currentEnemy - 1]);
				if (ccc) hhh *= 1.6;
				SubsHP(hhh, currentEnemy, "红", ccc);
				heroArray[currentEnemy - 1].ChangeHP(hhh);
				if (currentSkill == "掀裙奥义" && !heroArray[currentEnemy - 1].Gender && hhh < 0)
				{
					if (Random(25))
					{
						heroArray[currentEnemy - 1].dAttack = -3;
					}
				}
				else if (currentSkill == "二斧流")
				{
					mmm = heroArray[currentHero - 1].MP;
					dhhh = 800 - mmm;
					heroArray[currentHero - 1].dDefence = -2;
				}
				else if (currentSkill == "二之弹" && Random(75) && hhh < 0)
				{
					heroArray[currentEnemy - 1].dSpeed = -3;
				}
				else if (currentSkill == "七之弹" && Random(65) && hhh < 0)
				{
					heroArray[currentEnemy - 1].Giddy = 1;
				}
				else if (currentSkill == "凉宫春日的动摇" && Random(75) && hhh < 0)
				{
					heroArray[currentEnemy - 1].dSpeed = -3;
				}
			}
            else if (range == 3)
            {
				for (i = 3; i < 6; i++)
				{
					if (heroArray[i] != null)
					{
						hhh = -heroArray[currentHero - 1].GetDamage(currentSkill, heroArray[i]);
						// 感谢90奇迹、无缝违反两位的帮助，于2014年7月30日晚纠正BUG：下方的i错写成了currentEnemy
						// 结果是：当对方中间位置没有敌人时，我方的群体物理攻击一定会出错
						ccc = heroArray[currentHero - 1].GetCritical(currentSkill, heroArray[i]);
						SubsHP(hhh, i + 1);
						heroArray[i].ChangeHP(hhh);
						if (currentSkill == "谜之笑容" && Random(30) && hhh < 0)
						{
							heroArray[i].Giddy = 1;
						}
						else if (currentSkill == "争风吃醋" && Random(25) && hhh < 0)
						{
							heroArray[i].Chaos = 3;
						}
						else if (currentSkill == "都市传说" && hhh < 0)
						{
							if (Random(20)) heroArray[i].Poison = 5;
							if (Random(25)) heroArray[i].dSpeed = -3;
						}
						else if (currentSkill == "二重封印" && Random(25) && hhh < 0)
						{
							heroArray[i].Scared = 2;
						}
					}
				}
            }
			else if (range == 4)
			{
				for (i = 0; i < 3; i++)
				{
					if (heroArray[i] != null)
					{
						if (heroArray[i].HP > 0)
						{
							hhh = -heroArray[currentHero - 1].GetDamage(currentSkill, heroArray[i]);
							ccc = heroArray[currentHero - 1].GetCritical(currentSkill, heroArray[currentEnemy - 1]);
							SubsHP(hhh, i + 1);
							heroArray[i].ChangeHP(hhh);
						}
						if (currentSkill == "我不愉快" && Random(25) && hhh < 0)
						{
							heroArray[i].Mess = 3;
						}
						else if (currentSkill == "撒娇卖萌" && Random(40) && hhh < 0)
						{
							nnn = Math.random() * 100;
							if (nnn < 40)
							{
								heroArray[i].Mess = 3;
							}
							else if(nnn < 80)
							{
								heroArray[i].Scared = 2;
							}
							else
							{
								heroArray[i].Chaos = 2;
							}
						}
						else if (currentSkill == "灭绝歌" && Random(25) && hhh < 0)
						{
							heroArray[i].Giddy = 1;
						}
						else if (currentSkill == "呆毛雷达" && Random(30) && hhh < 0)
						{
							heroArray[i].dDefence = -3;
						}
						else if (currentSkill == "亵渎之手榴弹" && Random(50) && hhh < 0)
						{
							heroArray[i].dAttack = -3;
							heroArray[i].dMagic = -3;
						}
						else if (currentSkill == "搞基之魂" && hhh < 0)
						{
							if(Random(20)) heroArray[i].Chaos = 1;
							if (Random(20)) heroArray[i].Poison = 3;
							if (Random(40)) heroArray[i].dSpeed = -2;
						}
						else if (currentSkill == "凉宫春日的暴走" && Random(30) && hhh < 0)
						{
							heroArray[i].Giddy = 1;
						}
					}
				}
			}
			// 我方扣除MP
			if (currentHero < 4)
			{
				if (mmm == -1)
				{
					heroArray[currentHero - 1].ChangeMP(-heroArray[currentHero - 1].MP);
				}
				else if (mmm == 0)
				{
					
				}
				else
				{
					heroArray[currentHero - 1].ChangeMP( -mmm);
				}
				heroArray[currentHero - 1].ChangeHP( -dhhh);
			}
			if (UpdatePlayerInfo())
			{
				return;
			}
			else
			{				
				setTimeout(AfterAction, skill.GetTotalFrame(currentSkill) - skill.GetEffectFrame(currentSkill));
			}
		}
		
		private function SkillShake(delay:int = 0, duration:int = 20, amplitude:int = 20):void
		{
			var ddd:int = duration, aaa:int = amplitude;
			setTimeout(foo, delay);
			function foo():void
			{
				Shake(ddd, aaa);
			}
		}
		
		// 符卡动画
		public function ShowSpellCard(Name:String):void
		{
			card.gotoAndStop(currentSkill);
			card.x = -800;
			if (!playCard)
			{
				card.x = 800;
			}
			else
			{
				if (skill.hasSpellSound(currentSkill))
				{
					sound.gotoAndStop(4);
					sound.gotoAndStop(1);
				}
			}
			card.alpha = 0;
			card.visible = true;
			
			var timer = new Timer(speed, 0);
			timer.addEventListener(TimerEvent.TIMER, ShowingSpellCard);
			timer.start();
		}
		// 在此timer的最后，会播放技能动画，并产生数字
		private function ShowingSpellCard(evt:TimerEvent):void
		{
			//trace(card.x);
			// 运动总共分三个阶段，出现，缓动，消失
			if (card.x >= 800)
			{
				evt.target.stop();
				card.visible = false;
				card.x = -800;
				
				// 大招的特殊震动效果
				if (skill.hasShaking(currentSkill) != -1)
				{
					SkillShake(skill.hasShaking(currentSkill));
				}
				
				PlaySkillEffect();
				
				// 延迟过后，进入AfterAction
				setTimeout(CauseEffect, skill.GetEffectFrame(currentSkill));
			}
			if (card.x < -100)
			{
				card.alpha += 0.05;
				card.x += (-100 - card.x) / 20 + 10;
			}
			else if (card.x >= -100 && card.x <= 100)
			{
				card.x += 10;
			}
			else if (card.x > 100)
			{
				card.x += (card.x - 100) / 20 + 10;
				card.alpha -= 0.05;
			}
		}
		
		// 播放技能动画
		private function PlaySkillEffect():void
		{		
			// 表示攻击单人
			var range:int = skill.GetSkillRange(currentSkill);
			//trace(range, currentEnemy);
			if (range == 0 || range == 1 || range == 2)
			{
				filmArray[currentEnemy - 1].visible = true;
				filmArray[currentEnemy - 1].gotoAndPlay(currentSkill);
			}
			// 敌方全体
			else if (range == 3)
			{
				// 跟上面没区别，因为在Action中，自动判断了攻击目标，设定为正中间
				filmArray[currentEnemy - 1].visible = true;
				filmArray[currentEnemy - 1].gotoAndPlay(currentSkill);
			}
			// 我方全体
			else if (range == 4)
			{
				// 跟上面没区别，因为在Action中，自动判断了攻击目标，设定为正中间
				filmArray[currentEnemy - 1].visible = true;
				filmArray[currentEnemy - 1].gotoAndPlay(currentSkill);
			}
		}
		
		// 技能框的显示与半透明
		private function ShowSkillBox(evt:MouseEvent):void
		{
			evt.target.alpha = 1;
		}
		private function HideSkillBox(evt:MouseEvent):void
		{
			evt.target.alpha = 0.3;
		}
		// 选取技能，然后将技能菜单隐藏，根据情况选取攻击目标
		private function ChooseSkill(evt:MouseEvent):void
		{			
			// 判断当前技能框是否是完全不透明（即MP足够发出这个招数）
			if (evt.currentTarget.alpha < 1)
			{
				return;
			}
			
			//trace(evt.currentTarget.GetInfo());
			sBox.visible = false;// 隐藏技能选择菜单
			currentSkill = evt.currentTarget.GetInfo();//获取当前技能名称
			
			var range:int = skill.GetSkillRange(currentSkill);
			// 特殊技能（作用目标是自己）不需要选择对象
			if (range == 0)
			{
				currentEnemy = currentHero;
				SkillFunction(currentEnemy);
			}
			// 攻击的目标是我方或敌方单人，即1或2
			else if (range == 1 || range == 2)
			{
				isSelecting = true;
			}
			// 攻击目标为敌方全体
			else if (range == 3)// || range == 4 || range == 5)
			{
				// 动画显示在敌人中间位置
				currentEnemy = 5;
				SkillFunction(currentEnemy);
				// 缺少“地图炮直接发射”的调用函数
			}
			else if (range == 4)
			{
				currentEnemy = 2;
				SkillFunction(currentEnemy);
			}
		}
		
		// 在选取攻击目标的时候，可以选择自己的头像从而撤销技能选择
		private function ChooseCancel(evt:MouseEvent):void
		{
			// 如果没有在选择攻击目标，则单击无任何意义
			if (!isSelecting) return;
			
			isSelecting = false;
			sBox.visible = true;
		}
		
		// 一个简单的函数，用于产生一个随机数，并返回true或false
		private function Random(number:int):Boolean
		{
			var temp:int = Math.random() * 100 + 1;
			if (temp > number) return false;
			else return true;
		}
		
		// 状态框相关
		private function ShowConditionBox(hero:Role):void
		{
			eBox.visible = true;
			with (eBox)
			{
				Name.text = hero.Name;

				//HP.text = hero.HP.toString() + " / " + hero.HPmax.toString();
				HPbar.Set(hero.HP, hero.HPmax);
				HPbar.SetValue(hero.HP, hero.HPmax);
				if (hero.MPmax != -1)
				{
					MPbar.visible = true;
					MPbar.Set(hero.MP, hero.MPmax);
					MPbar.SetValue(hero.MP, hero.MPmax);
				}
				else
					MPbar.visible = false;
				
                AT.text = hero.Attack.toString();
                if (hero.dAttack > 0) AT.appendText("+" + (hero.Attack * 0.2).toString());
                else if(hero.dAttack < 0) AT.appendText("-" + (hero.Attack * 0.2).toString());
                DF.text = hero.Defence.toString();
                if (hero.dDefence > 0) DF.appendText("+" + (hero.Defence * 0.2).toString());
                else if(hero.dDefence < 0) DF.appendText("-" + (hero.Defence * 0.2).toString());
                MA.text = hero.Magic.toString();
                if (hero.dMagic > 0) MA.appendText("+" + (hero.Magic * 0.2).toString());
                else if(hero.dMagic < 0) MA.appendText("-" + (hero.Magic * 0.2).toString());
                SP.text = hero.Speed.toString();
                if (hero.dSpeed > 0) SP.appendText("+" + (hero.Speed * 0.2).toString());
                else if(hero.dSpeed < 0) SP.appendText("-" + (hero.Speed * 0.2).toString());
                LC.text = hero.Luck.toString();
                if (hero.dLuck > 0) LC.appendText("+" + (hero.Luck * 0.2).toString());
                else if(hero.dLuck < 0) LC.appendText("-" + (hero.Luck * 0.2).toString());
				
				Condition.text = "";
				if (hero.Defencing > 0) Condition.appendText("防御 ");
                if (hero.Poison > 0) Condition.appendText("中毒 ");
                if (hero.Giddy > 0) Condition.appendText("眩晕 ");
                if (hero.Chaos > 0) Condition.appendText("混乱 ");
                if (hero.Scared > 0) Condition.appendText("害怕 ");
                if (hero.Mess > 0) Condition.appendText("凌乱 ");
				
                if (hero.dAttack > 0) Condition.appendText("攻击↑ ");
                else if (hero.dAttack < 0) Condition.appendText("攻击↓ ");
                if (hero.dMagic > 0) Condition.appendText("法术↑ ");
                else if (hero.dMagic < 0) Condition.appendText("法术↓ ");
                if (hero.dDefence > 0) Condition.appendText("防御↑ ");
                else if (hero.dDefence < 0) Condition.appendText("防御↓ ");
                if (hero.dLuck > 0) Condition.appendText("幸运↑ ");
                else if (hero.dLuck < 0) Condition.appendText("幸运↓ ");
                if (hero.dSpeed > 0) Condition.appendText("速度↑ ");
                else if (hero.dSpeed < 0) Condition.appendText("速度↓ ");
				
				if (Condition.text.length == 0) Condition.appendText("无特殊状态");
			}
		}
		private function HideConditionBox():void
		{
			with (eBox)
			{
				visible = false;
				Name.text = "";
				
				AT.text = "";
				DF.text = "";
				MA.text = "";
				SP.text = "";
				LC.text = "";
				
				Condition.text = "";
			}
		}
		
		// 我方状态栏的相关
		private function HideFightBox(evt:Event):void
		{
			if (evt.currentTarget.alpha > 0)
			{
				evt.currentTarget.alpha -= 0.03;
			}
			else
			{
				evt.currentTarget.visible = false;
				evt.currentTarget.alpha = 1;
				evt.currentTarget.removeEventListener(Event.ENTER_FRAME, HideFightBox);
			}
		}
	}
}