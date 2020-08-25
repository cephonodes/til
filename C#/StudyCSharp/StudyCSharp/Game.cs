using System;
using System.Collections.Generic;
using System.Text;

namespace StudyCSharp
{
    public class Game
    {
        private char[,] cells = new char[3, 3];

        public bool IsXNext { get; private set; }

        public int PutSymbol(int row, int column)
        {
            if (cells[row, column] != '\0')
            {
                return (-1);
            }
            else
            {
                cells[row, column] = IsXNext ? 'X' : 'O';
                IsXNext = !IsXNext;
                return (0);
            }
        }

        public string GenerateBoardVisual()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("  0 1 2  \n");
			builder.Append("  - - - \n");
			builder.Append($"0|{cells[0, 0]}|{cells[0, 1]}|{cells[0, 2]}|\n");
			builder.Append("  - - - \n");
			builder.Append($"1|{cells[1, 0]}|{cells[1, 1]}|{cells[1, 2]}|\n");
			builder.Append("  - - - \n");
			builder.Append($"2|{cells[2, 0]}|{cells[2, 1]}|{cells[2, 2]}|\n");
			builder.Append("  - - - \n");
            return (builder.ToString());
        }
    }
}
