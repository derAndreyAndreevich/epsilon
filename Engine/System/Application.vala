namespace Engine.System {

  public class Application: Object {
    bool _is_done;
    List<GameObject> _game_objects;


    int _width = 800;
    public int get_width() { return _width; }
    public Application set_width(int width = 800) { _width = width; return this; }

    int _height = 600;
    public int get_height() { return _height; }
    public Application set_height(int height = 600) { _height = height; return this; }

    int _depth = 32;
    public int get_depth() { return _depth; }
    public Application set_depth(int depth = 32) { _depth = depth; return this; }

    public string fields() {
      return @"width: $_width, height: $_height, depth: $_depth";
    }

    public string to_string() {
      return @"Application {$(fields())}";
    }

    public Application append_object(GameObject obj) {
      _game_objects.append(obj);
      return this;
    }

    public Application append_objects(GameObject[] objects) {
      foreach (var obj in objects) {
        append_object(obj);
      }
      return this;
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

      while (!_is_done) {
        _is_done = true;
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
      this.on_exit.connect(() => { this.exit(); });
      this.on_key_down.connect(() => {});
    }

  }

}