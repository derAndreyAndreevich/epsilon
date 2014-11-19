using Engine.System;
using Engine.System.Utils;

namespace Engine.Graphics {

  public class Shape: GameObject {

    private SDL.Color _fill_color_sdl; 

    public SDL.Color get_fill_color_sdl() {
      return _fill_color_sdl;
    }


    private string _normalize_color(string color) {
      var result = "";

      if (color[0] != '#' && color.length < 8) {
        result = color[0:6] + "00";
      } else if (color[0] == '#' && color.length < 9) {
        result = color[1:7] + "00";
      }

      return result;
    }

    private string _fill_color = "FFB4B400";

    public string get_fill_color() { 
      return _fill_color; 
    }

    public GameObject set_fill_color(string fill_color) { 
      _fill_color = _normalize_color(fill_color);
      _fill_color_sdl = {
        (uchar)Hex.to_int(_fill_color[0:2]), 
        (uchar)Hex.to_int(_fill_color[2:4]),
        (uchar)Hex.to_int(_fill_color[4:6]),
        (uchar)Hex.to_int(_fill_color[6:8])
      };

      return this; 
    }

    public string fields() {
      return @"fill_color: #$(_fill_color)";
    }

    public string to_string() {
      return @"Shape {$(fields())}";
    }

  }

  public class Circle: Shape {

    public new Circle set_fill_color(string fill_color) { base.set_fill_color(fill_color); return this; }

    int _radius = 25;
    public int get_radius() { return _radius; }
    public Circle set_radius(int radius) { _radius = radius; return this; }

    public new string fields() {
      return @"$(base.fields()), radius: $_radius";
    }

    public new string to_string() {
      return @"Circle {$(fields())}";
    }

  }

}