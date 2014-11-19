namespace Engine.System {

  public class GameObject: Object {
    public virtual GameObject update() {
      return this;
    }

    public virtual GameObject draw() {
      return this;
    }

    public virtual GameObject on_key_down() {
      return this;
    }

    public virtual GameObject on_key_up() {
      return this;
    }


  }

}