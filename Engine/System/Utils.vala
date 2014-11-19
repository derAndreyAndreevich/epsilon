namespace Engine.System.Utils {
  public class Hex: Object {

    public static int64 to_int(string hex) {

      string hexdown = hex.down();
      int hexlen = hex.length;
      int64 ret_val = 0;
      string chr;
      int chr_int;
      int multiplier;
      
      for (int i = 0; i < hexlen ; i++) {
        int inv = (hexlen-1)-i;
        chr = hexdown[inv:inv+1];
        switch(chr) {
          case "a": chr_int = 10; break;
          case "b": chr_int = 11; break;
          case "c": chr_int = 12; break;
          case "d": chr_int = 13; break;
          case "e": chr_int = 14; break;
          case "f": chr_int = 15; break;
          default: chr_int = int.parse(chr); break;
        }

        multiplier = 1;
        for(int j = 0 ; j < i ; j++) {
          multiplier *= 16;
        }
        ret_val += chr_int * multiplier;
      }
      return ret_val;
    }
  }

  public class Console: Object {
    public static void write_line(string text) {
      stdout.printf(text + "\n");
    }
  }
}