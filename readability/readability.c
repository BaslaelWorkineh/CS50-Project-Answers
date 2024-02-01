#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
int main(void)
{
    int sentence_count = 0;
    int letter_count = 0;
    int word_count = 1;
    int readability;
    float average_letter;
    float average_sentence;
    int grade;

    string essay = get_string("Text: ");
//is alpha is used to check weather the string is alphabetical or not
    for (int i = 0; i < strlen(essay); i++)
    {
        if (isalpha(essay[i]))
        {
            letter_count++;
        }
        if (essay[i] == ' ')
        {
            word_count++;
        }
        if (essay[i] == '.' || essay[i] == '!' || essay[i] == '?')
        {
            sentence_count++;
        }
    }
    //type casting is nessasary other wise it will be integer
    average_letter = (float)(letter_count * 100) / word_count;
    average_sentence = (float)(sentence_count * 100) / word_count;

    grade = round(0.0588 * average_letter - 0.296 * average_sentence - 15.8);

    if (grade < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (grade >= 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %i\n", grade);
    }

}