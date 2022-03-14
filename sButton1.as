package 
{
	import flash.display.MovieClip;

	public class sButton1 extends MovieClip
	{

		public function sButton1()
		{
			Info.text = "";
		}

		public function SetInfo(Name:String):void
		{
			Info.text = Name;
			//trace(GetInfo());
		}

		public function GetInfo():String
		{
			return Info.text;
		}
	}
}