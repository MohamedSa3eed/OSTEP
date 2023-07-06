// Constants used in the random number generation algorithm
#define A 1103515245
#define C 12345
#define M 2147483648

// The seed value for the random number generator
static int seed = 1;

// Generate a random number between min and max (inclusive)
int getRandomNumber(int min, int max) {
    // Calculate a new seed value based on the current seed
    seed = (A * seed + C) % M;
    
    // Calculate the range of the random number
    int range = max - min + 1;
    
    // Generate a random number within the specified range
    int randomNumber = min + (seed % range);
    
    return randomNumber;
}
