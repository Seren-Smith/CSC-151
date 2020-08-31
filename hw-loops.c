#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "test.h"

/*
 *  This lab consists of lots of practice writing loops.
 *  The first section asks you to compute a single value to return.
 *
 *  In the second section you will modify an array in place,
 *  without creating new storage.
 *
 *  In the third section, you will return new arrays created
 *  using malloc.  These should be freed before the program exits.
 */


/*****************************************************
 *  The exercises below all compute a single value
 *****************************************************/

/*
 *  Example A:
 *  Given an integer array and length, find the product of all the elements.
 *  Use a for loop.
 */
int product_for(int* array, int len) {
    int product = 1;
    for (int i = 0; i < len; i++) {
        product *= array[i];
    }
    return product;
}

/*
 *  Problem 1:
 *  Given an integer array and length, find the product of all the elements.
 *  Use a while loop.
 *
 *  Add some tests in main.
 */
int product_while(int* array, int len) {
    int i = 0;
    int product = 1;

    while (i < len) {
        product *= array[i];
        i++;
    }
    return product;
}

/*
 *  Example B:
 *  Given an integer array, its length, and an integer x,
 *  count the number of elements greater than or equal to x.
 *  Use a for loop.
 *
 *  Add some tests in main.
 */
int count_greater(int* array, int len, int x) {
    int count = 0;
    for (int i = 0; i < len; i++) {
        if (array[i] >= x) {
            count++;
        }
    }
    return count;
}

/*
 *  Problem 2:
 *  Given a string, count the number of characters up to (but not including)
 *  the first null (0) character.  Use a for loop.
 *
 *  Add some tests in main.
 */
int string_len(char* s) {
    int count = 0;

     for (int i = 0; *s != '\0'; i++) {
       count++;
       s++;
     }
    return count;
} 

/*
 *  Problem 3:
 *  Given an integer, return 1 if the input is prime, 0 if otherwise.
 *  Hint: A prime is a natural number that is only divisible by 1 and itself.
 *       Zero and negative integers are not prime!
 *
 *  Add some tests in main.
 */
int isPrime(int input) {
    if (input <= 1)
      return 0;

    for (int i = 2; i < input; i++)
      if (input % i == 0)
        return 0;

    return 1;
}

/*****************************************************
 *  The exercises below all modify an array in place
 *****************************************************/

/*
 *  Example C:
 *  Given an integer array and its length, square each element
 */
void squareElements(int* array, int len) {
    for (int i = 0; i < len; i++) {
        array[i] *= array[i];
    }
}

/*
 *  Problem 4:
 *  Given an integer array and its length, increase the value of each element by its index.
 *
 *  Add some tests in main.
 */
void incrementByIndex(int* array, int len) {
    for (int i = 0; i < len; i++) {
      array[i] = array[i] + i;
    }
}

/*
 *  Problem 5:
 *  Given an integer array and its length, change the sign of all negative elements
 *
 *  Add some tests in main.
 */
void makePositive(int* array, int len) {
  for (int i = 0; i < len; i++) {
    if (array[i] < 0) {
      array[i] = -(array[i]);
    }
  }  
}

/*****************************************************
 *  The exercises below create a new array to return
 *****************************************************/

/*
 *  Example D:
 *  Given an integer array, its length, and an integer x,
 *  return a new array containing all elements greater than or equal to x
 */
int* filter_small(int* array, int len, int x) {
    int newLen = count_greater(array,len,x);
    int* newArray = (int*)malloc(newLen*sizeof(int));
    int count = 0;
    for (int i = 0; i < len; i++) {
        if (array[i] >= x) {
            newArray[count] = array[i];
            count++;
        }
    }
    return newArray;
}

/*
 *  Problem 6:
 *  Given a string, return a new string with every other index character of the original string.
 *  For example:
 *  "HelloWorld!" will become "Hlool!"
 *
 *  Add some tests in main.
 */
char* everyOther(char* inputString) {
    int len = strlen(inputString);
    char* str = (char*)malloc((len+1)*sizeof(char));
    for (int i = 0; i < len; i += 2) {
        str[i/2] += inputString[i];
    }
    return str;
}

/*
 *  Problem 7
 *  determine whether an array is a palindrome
 *  that is, the function should return 1 if the array is a mirror
 *  of itself, and 0 otherwise
 */

int palindrome (int* arr, int len) {
  int* pal = (int*)malloc((len+1)*sizeof(int));
  int flag = 0; 
  for (int i = 0; i <= len/2 && len != 0; i++) {
    if (arr[i] != arr[len - i - 1]) {
      return 0;
    }
    return 1;
  }
}

/*
 *  Problem 8
 *  return a copy of the array that includes all elements
 *  between positions m to n, including m but not n
 *  you may assume that the array has at least n elements
 *
 *  For example, if the array contains 0, 1, 2, 3, 4
 *  and you call sub with m = 2 and n = 4,
 *  it should return a new array containing 2 and 3.
 */

int* sub(int* a, int m, int n) {
    int* newArray = (int*)malloc((n-m)*sizeof(int));
    int len = n + 1;
    int j = 0;
    for(int i = m; i < n; i++) {
      newArray[j] = a[i];
      j++;
    }
  return newArray;
}

int main() {
// some arrays to test with
  int array1[1] = {0};
  int array2[5] = {-3,7,9,-6,-5};
  int array3[3] = {3,3,3};
  int array4[6] = {-1,1,5,1,-3,1};

// product_for tests
  run_test("array1 product_for",
    product_for(array1,1) == 0
  );
  run_test("array2 product_for",
    product_for(array2,5) == -5670
  );
  run_test("array3 product_for",
    product_for(array3,3) == 27
  );
  run_test("array4 product_for partial",
    product_for(array4,4) == -5
  );
  run_test("array2 product_for partial",
    product_for(array2, 2) == -21
  );

// product_while tests
  run_test("array1 product_while",
    product_while(array1,1) == 0
  );
  run_test("array2 product_while",
    product_while(array2,5) == -5670
  );
  run_test("array3 product_while",
    product_while(array3,3) == 27
  );
  run_test("array4 product_while",
    product_while(array4,4) == -5
  );
  run_test("array2 product_while partial",
    product_while(array2, 3) == -189
  );  

// count_greater tests
  run_test("array1 count_greater",
    count_greater(array1,1,1) == 0
  );
  run_test("array2 count_greater",
    count_greater(array2,5,0) == 2
  );
  run_test("array3 count_greater",
    count_greater(array3,3,3) == 3
  );
  run_test("array4 count_greater none",
    count_greater(array4,0,-2) == 0
  );

// count string length
  run_test("length of string 'cat'",
    string_len("cat") == 3
  );

  run_test("length of string 'meow'",
    string_len("meow") == 4
  );

  run_test("length of string 'puppies'",
    string_len("puppies") == 7
  );
  run_test("length of string 'supercalifragilisticexpialidocious'",     string_len("supercalifragilisticexpialidocious") == 34
  );

// isPrime tests
  run_test("Is 9 prime?",
    isPrime(9) == 0
  );

  run_test("Is 2 prime?",
    isPrime(2) == 1
  );

  run_test("Is 0 prime?",
    isPrime(0) == 0
  );
  run_test("Is 1 prime?",
    isPrime(1) == 0
  );

  run_test("Is 198 prime?",
    isPrime(198) == 0
  );

  run_test("Is 7 prime?",
    isPrime(7) == 1
  );

// squareElements tests
  squareElements(array3,3);
  run_test("array3 squareElements",
    (array3[0] == 9) && (array3[1] == 9) && (array3[2] == 9)
  );

  squareElements(array3,3);
  run_test("array3 squareElements again",
    (array3[0] == 81) && (array3[1] == 81) && (array3[2] == 81)
  );

 // increment by array tests
  incrementByIndex(array2, 5);
  run_test("Increment by Index for Array2",
    (array2[0] == -3) && (array2[1] == 8) && (array2[2] == 11) && (array2[3] == -3) && (array2[4] == -1)
  );

  incrementByIndex(array1, 1);
  run_test("Increment by Index for Array1",
    (array1[0] == 0)
  );

// makePositive tests & a new array
  int array5[3] = {-1, 1, -3};

  makePositive(array4, 6);
  run_test("Make array4 positive.",
    (array4[0] == 1) && (array4[1] == 1) && (array4[2] == 5) && (array4[3] == 1) && (array4[4] == 3) && (array4[5] == 1)
  );

  makePositive(array5, 3);
  run_test("Make array5 positive.",
    (array5[0] == 1) && (array5[1] == 1) && (array5[2] == 3)
  );

// filter_small tests & new array
  int array6[5] = {-3,7,9,-6,-5};

  int *fs1 = filter_small(array1,1,0);
  run_test("array1 filter_small",
    fs1[0] == 0
  );
  free(fs1);

  int *fs2 = filter_small(array6,5,0);
  run_test("array6 filter_small",
    (fs2[0] == 7) && (fs2[1] == 9)
  );
  free(fs2);
  
  char* s1 = everyOther("HelloWorld");
  run_test("every other test",
    strncmp(s1, "Hlool", 5) == 0
  );
  free(s1);

  char* s2 = everyOther("SerenSmith");
  run_test("name every other test",
    strncmp(s2, "Srnmt", 5) == 0
  );
  free(s2);

// test for palindromes
  int array7[5] = {-1, 1, -1, 1, -1};
  int p1 = palindrome(array7, 5);
  run_test("Palindrome true test", 
    palindrome(&p1, 5) == 1
  );
  //free(p1); // results in segmentation fault

  int array8[5] = {5, 1, 2, 2, 1};
  int p2 = palindrome(array8, 5);
  run_test("Palindrome false test", 
    palindrome(&p2, 5) == 0
  );
  free(p2);

  int array9[4] = {-2, 2, -2, 2};
  int p3 = palindrome(array9, 4);
  run_test("Palindrome even false test",
    palindrome(&p3, 4) == 0
  );
  free(p3);

// test for substitutions
  int array10[5] = {9, 5, 4, 3, 1};
  int* n1 = sub(array10, 2, 4);
  run_test("Substitute new array", 
    (n1[0] == 4) && (n1[1] == 3)
  );
  free(n1);

  int array11[5] = {4, 2, 0, 6, 9};
  int* n2 = sub(array11, 0, 3);
  run_test("Substitute new array test 2",
    (n2[0] == 4) && (n2[1] == 2) && (n2[2] == 0)
  );
}
