#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int convert(string input);

int main(void)
{
    string input = get_string("Enter a positive integer: ");

    for (int i = 0, n = strlen(input); i < n; i++)
    {
        if (!isdigit(input[i]))
        {
            printf("Invalid Input!\n");
            return 1;
        }
    }

    // Convert string to int
    printf("%i\n", convert(input));
}

int convert(string input)
{
    //TODO
    int i = 0;
    int temp = 0;
    if(i == input.size())
    {
        return 1;
    }
    else
    {
       temp = temp * 10 + (input[i]-'0');
       convert(input);
       i++;
       return temp;
    }
}