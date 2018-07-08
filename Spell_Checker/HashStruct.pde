/** HashTable class
 * class for making a hash map/table
 *
 * @author Aniruddha Murali
 */
 
class HashTable {
  String[][] hashtable; // [ [], [], [], [] ]
  int m, r;
  
  /** HashTable()
   * This is the constructor class for the hash table
   *
   * @param im(int) - size of the array
   * @return none
   */
  HashTable(int im) {
    m = im; // m is the size of the array; the hashtable is of size m X 2
    r = 31; // r can be any prime number
    hashtable = new String[m][2];
  }
  
  /** put()
   * This method inserts a key-value pair into the hash table
   *
   * @param k(String) - key to be inserted
   * @param v(String) - value to be inserted with key
   * @return none
   */
  void put(String k, String v) {
    int index = hash(k);
    if (hashtable[index][0] == null) {
      hashtable[index][0] = k;
      hashtable[index][1] = v;
    }
    else {
      hashtable[index] = append(hashtable[index], k);
      hashtable[index] = append(hashtable[index], v);
    }
  }
  
  
  /** find()
   * This method searches for a key in the hash table
   *
   * @param k(String) - key to be searched
   * @return boolean - true if k is found, false if k isn't found
   */
  boolean find(String k) {
    k = k.toLowerCase();
    int index = hash(k);
    for (int i = 0; i < hashtable[index].length; i += 2) {
      if (hashtable[index][i].equals(k)) return true;
    }
    return false;
  }
  
  
  /** getValue()
   * This method gets the value given the key
   *
   * @param k(String) - key used for search
   * @return String - returns value if key is in the hash table, returns an error otherwise
   */
  String getValue(String k) {
    int index = hash(k);
    for (int i = 0; i < hashtable[index].length; i += 2) {
      if (hashtable[index][i].equals(k)) return hashtable[index][i+1];
    }
    return "ERROR - Key does not exist";
  }
  
  
  /** keysArray()
   * This method returns an array of keys
   *
   * @param none
   * @return keysArray(String) - array of keys
   */
  String[] keysArray(){
    String[] keysArray = {};
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < hashtable[i].length; j += 2) {
        keysArray = append(keysArray, hashtable[i][j]);
      }
    }
    return keysArray;
  }
  
  
  /** valuesArray()
   * This method returns an array of values
   *
   * @param none
   * @return valuesArray(String) - array of values
   */
  String[] valuesArray(){
    String[] valuesArray = {};
    for (int i = 0; i < m; i++) {
      for (int j = 1; j < hashtable[i].length; j += 2) {
        valuesArray = append(valuesArray, hashtable[i][j]);
      }
    }
    return valuesArray;
  }
  
  
  /** hash()
   * This method calculates hash for a string and puts the string in the respective index of the hash table
   *
   * @param s(String) - String to be hashed
   * @return none
   */
  int hash(String s) {
    int hash = 0;
    for (int i = 0; i < s.length(); i++) {
      hash = (r * hash + s.charAt(i)) % m;
    }
    return hash;
  }
}