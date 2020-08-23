using System;

namespace StudyCSharp
{
	class Program
	{
		static void Main(string[] args)
		{
			var game = new Game();

			// まずは空っぽの盤面を表示する
			Console.WriteLine(game.GenerateBoardVisual());

			// 盤面に交互に記号を置かせる
			for (int i=0; i<3; i++)
			{
				Console.WriteLine("Input position (Row): ");
				var row = int.Parse(Console.ReadLine());
				Console.WriteLine("Input position (Column): ");
				var column = int.Parse(Console.ReadLine());

				if (game.PutSymbol(row, column) != 0)
				{
					Console.WriteLine("Error");
				}

				Console.WriteLine(game.GenerateBoardVisual());
			}
		}
	}
}
