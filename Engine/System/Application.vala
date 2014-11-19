namespace Engine.System {

  public class Application: Object {
    bool __is_done;
    List<GameObject> _game_objects;
    unowned SDL.Surface __surface;


    public int width { get; private set; default = 800; }
    public int getWidth() { return width; }
    public Application setWidth(int val) { width = val; return this; }

    public int height { get; private set; default = 600; }
    public int getHeight() { return height; }
    public Application setHeight(int val) { height = val; return this; }

    public int depth { get; private set; default = 32; }
    public int getDepth() { return depth; }
    public Application setDepth(int val) { depth = val; return this; }

    public string caption { get; private set; default = "SHEngine"; }
    public string getCaption() { return caption; }
    public Application setCaption(string val) { caption = val; return this; }

    uint32 flags = SDL.SurfaceFlag.DOUBLEBUF
                 | SDL.SurfaceFlag.HWACCEL
                 | SDL.SurfaceFlag.HWSURFACE;

    public string fields() {
      return @"width: $width, height: $height, depth: $depth";
    }

    public string to_string() {
      return @"Application {$(fields())}";
    }

    public signal void on_run();
    public signal void on_draw();
    public signal void on_update();
    public signal void on_key_down();
    public signal void on_key_up();
    public signal void on_mouse_move();
    public signal void on_mouse_down();
    public signal void on_mouse_up();
    public signal void on_exit();

    public Application run() {

      on_run();

      while (!__is_done) {
        __is_done = true;
        on_draw();
      }

      on_exit();

      return this;
    }

    Application draw() {
      return this;
    }

    Application update() {
      return this;
    }

    Application key_down() {
      return this;
    }

    Application key_up() {
      return this;
    }

    Application mouse_move() {
      return this;
    }

    Application mouse_down() {
      return this;
    }

    Application mouse_up() {
      return this;
    }

    public Application exit() {
      SDL.quit();
      return this;
    }


    public Application() {
      __surface = SDL.Screen.set_video_mode(width, height, depth, flags);
      on_exit.connect(() => { this.exit(); });
      on_key_down.connect(() => {});
    }

  }

}