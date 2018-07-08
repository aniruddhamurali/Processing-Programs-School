int[] grades = {39, 52, 67, 73, 77, 84, 85, 86, 89, 92, 94, 95, 97, 100};

void setup() {
  int start = 0;
  int end = grades.length-1;
  print(bS(grades, start, end, 100));
}

int bS(int[] array, int start, int end, int target) {
  if (array[array.length-1] == target) return array.length-1;
  if (start < end) {
    int midIndex = start + (end-start)/2;
    if (target < array[midIndex]) {
      return bS(array, start, midIndex, target); 
    }
    else if (target > array[midIndex]) {
      return bS(array, midIndex+1, end, target);
    }
    else return midIndex;
  }
  return -1;
}