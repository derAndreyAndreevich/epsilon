using Engine.System;
using Engine.System.Utils;

namespace Engine.Graphics.Shapes {

  public class Shape: GameObject {

    public SDL.Color fillColorSdl { get; private set; }
    public SDL.Color getFillColorSdl() { return fillColorSdl; }

    string normalizeColor(string color) {
      var result = "";

      if (color[0] != '#' && color.length < 8) {
        result = color[0:6] + "00";
      } else if (color[0] == '#' && color.length < 9) {
        result = color[1:7] + "00";
      } 

      return result;
    }

    public string fillColor { 
      default = "#141D54";
      get { 
        return fillColor;
      } 
      set {
        fillColor = normalizeColor(value);
        fillColorSdl = {
          (uchar)Hex.toInt(fillColor[0:2]), 
          (uchar)Hex.toInt(fillColor[2:4]),
          (uchar)Hex.toInt(fillColor[4:6]),
          (uchar)Hex.toInt(fillColor[6:8])
        };
      }
    }
    
    public string getFillColor() { 
      return fillColor; 
    }
    
    public Shape setFillColor(string val = "#141D54") { 
      fillColor = val; 
      return this; 
    }

    public string fields() {
      return @"fillColor: #$(fillColor)";
    }

    public string to_string() {
      return @"Shape {$(fields())}";
    }

    public string toString() {
      return to_string();
    }

  }

}