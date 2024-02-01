#include <cs50.h>
#include <stdio.h>

void build(int n);

int main(void)
{
    int height;
    //this will take height value
    do
    {
        height = get_int("Height: ");
    }
    while (height < 1 || height > 8);

    build(height);
}
//this function will build the pyramid :))))) simple
void build(int n)
{
    for (int i = 1; i < (n + 1); i++)
    {
        for (int j = 1; j < (n + 1); j++)
        {
            if (j <= (n - i))
            {
                printf(" ");
            }
            else
            {
                printf("#");
            }
        }

        printf("\n");
    }
}