namespace Engine.System {

  public class Application: Object {
    bool isDone;
    unowned SDL.Surface surface;

    public int width { 
      default = 800;
      get { 
        return width;
      } 
      set {
        width = value;
      }
    }
    
    public int getWidth() { 
      return width; 
    }
    
    public Application setWidth(int val = 800) { 
      width = val; 
      return this; 
    }

    public int height { 
      default = 600;
      get { 
        return height;
      } 
      set {
        height = value;
      }
    }
    
    public int getHeight() { 
      return height; 
    }
    
    public Application setHeight(int val = 600) { 
      height = val; 
      return this; 
    }
    
    public int depth { 
      default = 32;
      get { 
        return depth;
      } 
      set {
        depth = value;
      }
    }
    
    public int getDepth() { 
      return depth; 
    }
    
    public Application setDepth(int val = 32) { 
      depth = val; 
      return this; 
    }

    public string caption { 
      default = "Engine";
      get { 
        return caption;
      } 
      set {
        caption = value;
      }
    }
    
    public string getCaption() { 
      return caption; 
    }
    
    public Application setCaption(string val = "Engine") { 
      caption = val; 
      return this; 
    }
    

    uint32 flags = SDL.SurfaceFlag.DOUBLEBUF
                 | SDL.SurfaceFlag.HWACCEL
                 | SDL.SurfaceFlag.HWSURFACE;

    public string fields() {
      return @"width: $width, height: $height, depth: $depth";
    }

    public string to_string() {
      return @"Application {$(fields())}";
    }
    
    public string toString() {
      return to_string();
    }

    public signal void onRun();
    public signal void onDraw();
    // public signal void on_update();
    // public signal void on_key_down();
    // public signal void on_key_up();
    // public signal void on_mouse_move();
    // public signal void on_mouse_down();
    // public signal void on_mouse_up();
    public signal void onExit();

    public Application run() {

      onRun();

      while (!isDone) {
        isDone = true;
        onDraw();
      }

      onExit();

      return this;
    }

    // Application draw() {
    //   return this;
    // }

    // Application update() {
    //   return this;
    // }

    // Application key_down() {
    //   return this;
    // }

    // Application key_up() {
    //   return this;
    // }

    // Application mouse_move() {
    //   return this;
    // }

    // Application mouse_down() {
    //   return this;
    // }

    // Application mouse_up() {
    //   return this;
    // }

    public Application exit() {
      SDL.quit();
      return this;
    }


    public Application() {
      surface = SDL.Screen.set_video_mode(width, height, depth, flags);
      onExit.connect(() => { this.exit(); });
    }

  }

}